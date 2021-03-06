package com.it.cf.project.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.it.cf.bootpay.BootpayApi;
import com.it.cf.bootpay.model.request.Cancel;
import com.it.cf.fdList.model.FundingListVO;
import com.it.cf.informProject.model.informProjectService;
import com.it.cf.informProject.model.informProjectVO;
import com.it.cf.project.model.FirstCategoryVO;
import com.it.cf.project.model.ProjectFileUploadUtil;
import com.it.cf.project.model.ProjectPageInfo;
import com.it.cf.project.model.ProjectService;
import com.it.cf.project.model.ProjectUtil;
import com.it.cf.project.model.ProjectVO;
import com.it.cf.project.model.SecondCategoryVO;
import com.it.cf.user.model.UserService;
import com.it.cf.user.model.UserVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/project")
public class ProjectController {
	private static final Logger logger = LoggerFactory.getLogger(ProjectController.class);
	
	private final ProjectService projectService;
	private final UserService userService;
	private final ProjectFileUploadUtil fileUploadUtil;
	private final informProjectService informService;
	
	static BootpayApi api;
	
	@RequestMapping("/list")
	public String list(@ModelAttribute ProjectVO pageVo, Model model) {
		logger.info("???????????? list ?????? ????????????");
		
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory("total");
		
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		List<ProjectVO> list = projectService.selectAllConfirm(pageVo);
		logger.info("???????????? list ?????? ??????, list.size={}", list.size());
		
		int totalRecord = projectService.selectTotalRecordConfirm();
		logger.info("list ?????? ??????, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "project/list";
	}
	
	@ResponseBody
	@RequestMapping("/alist")
	public Map<String, Object> ajaxList(@RequestParam int firstCategoryNo, @RequestParam int secondCategoryNo, @RequestParam int ingType,
			@RequestParam int curPage, @ModelAttribute ProjectVO pageVo) {
		pageVo.setCurrentPage(curPage);
		ProjectPageInfo pagingInfo = new ProjectPageInfo();
		pagingInfo.setBlockSize(ProjectUtil.BLOCK_SIZE);
		pagingInfo.setCurrentPage(pageVo.getCurrentPage());
		pagingInfo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		
		pageVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		pageVo.setRecordCountPerPage(ProjectUtil.RECORD_COUNT);
		pageVo.setFirstCategoryNo(firstCategoryNo);
		pageVo.setSecondCategoryNo(secondCategoryNo);
		pageVo.setIngType(ingType);
		
		List<ProjectVO> list = projectService.selectBySecondCategoryNo(pageVo);
		logger.info("???????????? list ?????? ??????, list.size={}", list.size());
		
		int totalRecord = projectService.selectTotalRecordBySecondCategoryNo(firstCategoryNo, secondCategoryNo, ingType);
		
		logger.info("list ?????? ??????, totalRecord={}", totalRecord);
		pagingInfo.setTotalRecord(totalRecord);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("list", list);
		map.put("pagingInfo", pagingInfo);
		
		return map;
	}
	
	@RequestMapping("/writeMain")
	public String writeMain(Model model) {
		int count = projectService.selectTotalRecord();
		model.addAttribute("count", count);
		return "project/writeMain";
	}
	
	@RequestMapping("/writeCategory")
	public void writeCategory() {}
	
	@RequestMapping("/writeTitle")
	public String writeTitle(@RequestParam String firstCategory, @RequestParam String projectSummary, Model model) {
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory(firstCategory);
		
		model.addAttribute("firstCategory", firstCategory);
		model.addAttribute("projectSummary", projectSummary);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		
		return "project/writeTitle";
	}
	
	@ResponseBody
	@RequestMapping("/aWriteTitle")
	public List<SecondCategoryVO> ajaxWriteTitle(@RequestParam String firstCategory) {
		List<SecondCategoryVO> list = projectService.selectSecondCategory(firstCategory);
		return list;
	}
	
	@Transactional
	@PostMapping("/writeTitleSecond")
	public String write_post(@ModelAttribute ProjectVO vo, 
			HttpServletRequest request, HttpSession session, Model model) {
		//1
		int userNo = (int) session.getAttribute("userNo");
		vo.setUserNo(userNo);
		logger.info("???????????? ?????? ??????, ???????????? vo={}, userNo={}", vo, userNo);
		
		//2
		//?????? ????????? ??????
		String fileName = "", originalFileName = "";
		List<Map<String, Object>> list = null;
		try {
			list = fileUploadUtil.fileUpload(request, ProjectUtil.UPLOAD_IMAGE_FLAG);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		for(int i=0;i<list.size();i++) {
			Map<String, Object> map = list.get(i);
			fileName = (String) map.get("fileName");
			originalFileName = (String) map.get("originalFileName");
		}
		
		logger.info("?????? ????????? ??????, fileName={}",fileName);
		
		vo.setProjectImage(fileName);
		vo.setProjectFilename(originalFileName);
		
		String msg="", url="";
		int cnt = projectService.insertProject(vo);		
		logger.info("???????????? ?????? ??????, cnt={}", cnt);
		
		
		if(cnt>0) { 
			msg="??????????????? ?????????????????????.";
			url="/project/list"; 
		} else {
			msg="???????????? ?????? ??????"; 
			url="/project/writeMain"; 
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@ResponseBody
	@PostMapping("/summer_image")
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// ???????????? ?????? ??????
		String realFolder = request.getSession().getServletContext().getRealPath("project_assets/projectImg/projectMainImg");

		// ???????????? ?????? ??????
		String org_filename = file.getOriginalFilename();
		String str_filename = fileUploadUtil.getUniqueFileName(org_filename);

		System.out.println("?????? ????????? : " + org_filename);
		System.out.println("????????? ????????? : " + str_filename);

		String filepath = realFolder + "\\" + str_filename;
		System.out.println("???????????? : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/cf/project_assets/projectImg/projectMainImg/"+str_filename);
		out.close();
	}
	
	@RequestMapping("/detail")
	public String detail(@RequestParam(defaultValue = "0") int projectNo, 
			HttpSession session, Model model) {
		int userNo=0;
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			userNo = (int) session.getAttribute("userNo");
		}
		logger.info("???????????? ????????????, ???????????? projectNo={}, userNo={}", projectNo, userNo);
		
		UserVO userVo = userService.selectByNo(userNo);
		logger.info("user ??????={}", userVo);
		
		Map<String, Object> check = projectService.checkLike(projectNo);
		logger.info("check={}", check);
		
		Map<String, Object> map = projectService.selectByNo(projectNo);
		int userCnt = projectService.selectFundingUserCount(projectNo);
		logger.info("???????????? ???????????? ?????? map={}, userCnt={}", map, userCnt);
		
		model.addAttribute("map", map);
		model.addAttribute("userCnt", userCnt);
		model.addAttribute("userVo", userVo);
		model.addAttribute("check", check);
		
		return "project/detail";
	}
	
	@RequestMapping("/detailFunding")
	public String detailFunding(@RequestParam(defaultValue = "0") int projectNo, 
			@RequestParam(defaultValue = "0") int fdAmount, @RequestParam String receiptId,
			HttpSession session) {
		int userNo = (int) session.getAttribute("userNo");
		logger.info("???????????? ?????? ??????, ???????????? projectNo={}, userNo={}, fdAmount={}, receiptId={}", projectNo, userNo, fdAmount, receiptId);
		
		FundingListVO vo = new FundingListVO();
		vo.setProjectNo(projectNo);
		vo.setUserNo(userNo);
		vo.setFundingAmount(fdAmount);
		vo.setReceiptId(receiptId);
		
		int cnt = projectService.insertFunding(vo);
		logger.info("???????????? ?????? ??????, cnt={}", cnt);
		
		return "redirect:/project/detail?projectNo="+projectNo;
	}
	
	@RequestMapping("/cancle")
	public String cancle(@RequestParam int userNo, @RequestParam String receiptId,
			@RequestParam String pwd, Model model) {
		logger.info("?????? ?????? ????????????, userNo={}, pwd={}, receiptId={}", userNo,pwd,receiptId);
		
		String msg="", url="/mypages/support";
		String dbPwd = projectService.selectDBPwd(userNo);
		if(dbPwd.equals(pwd)) {
			api = new BootpayApi("60ffa2837b5ba400237bda13", "aAx7mTvRBnDZtARKP/FlAH3GjL6KmRyqFpH8k+8fzmg=");  // application_id, private key 
			try {
				api.getAccessToken();
			} catch (Exception e) {
				e.printStackTrace();
			}
			Cancel cancel = new Cancel();
	        cancel.receipt_id = receiptId;
	        cancel.name = "userNo="+userNo;
	        cancel.reason = "????????????";

	        try {
	            HttpResponse res = api.cancel(cancel);
	            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
	            System.out.println(str);
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	        
	        int cnt = projectService.deleteFunding(receiptId);
	        logger.info("?????? ??????, cnt={}", cnt);
	        
			msg="?????????????????????.";
		}else {
			msg="??????????????? ???????????? ????????????."; 
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}

	@ResponseBody
	@RequestMapping("/cancleAll")
	public void cancleAll() {
		System.out.println("asdasdasd");
		logger.info("?????? ?????? ?????? ?????? ??????");
		
		List<ProjectVO> list = projectService.selectAllCheck();
		logger.info("?????? ?????? ?????? ?????? ??????, list.size={}", list.size());
		
		Date today = new Date();
		logger.info("?????? : {}",today);
		for(int i=0;i<list.size();i++) {
			ProjectVO vo = list.get(i);
			Date end =new Date(vo.getProjectEnddate().getTime());
			
			if(today.after(end)) {
				double totalAmount = (double)vo.getTotalAmount();
				double totalFundingAmount = (double)vo.getTotalFundingAmount();
				double percent = totalFundingAmount/totalAmount*100.0;
				logger.info("?????? : {}, ???????????? : {}, ????????? : {}",totalAmount, totalFundingAmount, percent);
				
				if(percent<100.0) {
					List<FundingListVO> rList = projectService.selectFundingListByProjectNo(vo.getProjectNo());
					logger.info("????????? rList={}", rList);
					
					if(rList.size()!=0) {
						for(int j=0;j<rList.size();j++) {
							if(rList.get(j).getReceiptId()!=null) {
								api = new BootpayApi("60ffa2837b5ba400237bda13", "aAx7mTvRBnDZtARKP/FlAH3GjL6KmRyqFpH8k+8fzmg=");  // application_id, private key 
								try {
									api.getAccessToken();
								} catch (Exception e) {
									e.printStackTrace();
								}
								Cancel cancel = new Cancel();
								cancel.receipt_id = rList.get(j).getReceiptId();
								cancel.name = "?????????";
								cancel.reason = "????????????";
								
								try {
									HttpResponse res = api.cancel(cancel);
									String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
									System.out.println(str);
								} catch (Exception e) {
									e.printStackTrace();
								}
								
								int cnt = projectService.deleteFunding(rList.get(j).getReceiptId());
								logger.info("?????? ??????, cnt={}", cnt);
							}
						}
					}
				}
			}
		}
		
		/*List<FundingListVO> list = projectService.selectFundingListByProjectNo(projectNo);
		logger.info("????????? list={}", list);
		
		if(list.size()!=0) {
			for(int i=0;i<list.size();i++) {
				api = new BootpayApi("60ffa2837b5ba400237bda13", "aAx7mTvRBnDZtARKP/FlAH3GjL6KmRyqFpH8k+8fzmg=");  // application_id, private key 
				try {
					api.getAccessToken();
				} catch (Exception e) {
					e.printStackTrace();
				}
				Cancel cancel = new Cancel();
		        cancel.receipt_id = list.get(i).getReceiptId();
		        cancel.name = "?????????";
		        cancel.reason = "????????????";

		        try {
		            HttpResponse res = api.cancel(cancel);
		            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		            System.out.println(str);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        
		        int cnt = projectService.deleteFunding(list.get(i).getReceiptId());
		        logger.info("?????? ??????, cnt={}", cnt);
			}
		}*/
	}
	
	@GetMapping("/update")
	public String update(@RequestParam int projectNo, Model model) {
		Map<String, Object> map = projectService.selectByNo(projectNo);
		
		int secondCategoryNo = Integer.parseInt(String.valueOf(map.get("SECOND_CATEGORY_NO")));
		String firstCategory = projectService.selectFirstCategoryNo(secondCategoryNo);
		List<FirstCategoryVO> fList = projectService.selectFirstCategory();
		List<SecondCategoryVO> sList = projectService.selectSecondCategory(firstCategory);
		
		model.addAttribute("map", map);
		model.addAttribute("firstCategory", firstCategory);
		model.addAttribute("fList", fList);
		model.addAttribute("sList", sList);
		
		return "project/update";
	}
	
	@PostMapping("/update")
	public String update_post(@ModelAttribute ProjectVO vo, Model model) {
		//1
		logger.info("???????????? ?????? ??????, ???????????? vo={}", vo);
		
		//2
		String msg="", url="";
		int cnt = projectService.updateProject(vo);		
		logger.info("???????????? ?????? ??????, cnt={}", cnt);
		
		
		if(cnt>0) { 
			msg="??????????????? ?????????????????????.";
			url="/project/detail?projectNo="+vo.getProjectNo(); 
		} else {
			msg="???????????? ?????? ??????"; 
			url="/project/update?projectNo="+vo.getProjectNo(); 
		}
		
		//3
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@Transactional
	@RequestMapping("/delete")
	public String delete(@RequestParam int userNo, @RequestParam int projectNo,
			@RequestParam String pwd, @RequestParam String type, Model model) {
		logger.info("?????? ??????, ???????????? userNo={}, projectNo={}, pwd={}, type={}", userNo, projectNo, pwd, type);
		
		String msg="", url="";
		String dbPwd = projectService.selectDBPwd(userNo);
		if(dbPwd.equals(pwd)) {
			List<FundingListVO> list = projectService.selectFundingListByProjectNo(projectNo);
			
			if(list.size()!=0) {
				for(int i=0;i<list.size();i++) {
					api = new BootpayApi("60ffa2837b5ba400237bda13", "aAx7mTvRBnDZtARKP/FlAH3GjL6KmRyqFpH8k+8fzmg=");  // application_id, private key 
					try {
						api.getAccessToken();
					} catch (Exception e) {
						e.printStackTrace();
					}
					Cancel cancel = new Cancel();
			        cancel.receipt_id = list.get(i).getReceiptId();
			        cancel.name = "userNo="+userNo;
			        cancel.reason = "???????????? ??????";

			        try {
			            HttpResponse res = api.cancel(cancel);
			            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
			            System.out.println(str);
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
			        
			        int cnt = projectService.deleteFunding(list.get(i).getReceiptId());
			        logger.info("?????? ??????, cnt={}", cnt);
				}
			}
			
			projectService.deleteFundingList(projectNo);
			projectService.deleteProject(projectNo);
			msg="??????????????? ?????????????????????.";
			if(type.equals("detail")) {
				url="/project/list"; 
			}else {
				url="/mypages/projects"; 
			}
		}else {
			msg="??????????????? ???????????? ????????????.";
			if(type.equals("detail")) {
				url="/project/detail?projectNo="+projectNo;
			}else {
				url="/mypages/projects"; 
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@Transactional
	@RequestMapping("/adminDelete")
	public String admin_delete(@RequestParam int projectNo, Model model) {
		logger.info("?????? ??????, ???????????? projectNo={}", projectNo);
		
		String msg="", url="";
		List<FundingListVO> list = projectService.selectFundingListByProjectNo(projectNo);
		
		if(list.size()!=0) {
			for(int i=0;i<list.size();i++) {
				api = new BootpayApi("60ffa2837b5ba400237bda13", "aAx7mTvRBnDZtARKP/FlAH3GjL6KmRyqFpH8k+8fzmg=");  // application_id, private key 
				try {
					api.getAccessToken();
				} catch (Exception e) {
					e.printStackTrace();
				}
				Cancel cancel = new Cancel();
		        cancel.receipt_id = list.get(i).getReceiptId();
		        cancel.name = "?????????";
		        cancel.reason = "???????????? ??????";
		        try {
		            HttpResponse res = api.cancel(cancel);
		            String str = IOUtils.toString(res.getEntity().getContent(), "UTF-8");
		            System.out.println(str);
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		        
		        int cnt = projectService.deleteFunding(list.get(i).getReceiptId());
		        logger.info("?????? ??????, cnt={}", cnt);
			}
		}
		
		projectService.deleteFundingList(projectNo);
		projectService.deleteProject(projectNo);
		msg="??????????????? ?????????????????????.";
		url="/admin/confirm"; 
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/plan")
	public String plan(@RequestParam(defaultValue = "0") int projectNo, Model model, 
			HttpSession session) {
		int userNo=0;
		if(session.getAttribute("userNo")!=null && session.getAttribute("userNo")!="") {
			userNo = (int) session.getAttribute("userNo");
		}
		logger.info("userNo={}",userNo);
		logger.info("?????? ?????? ???????????? ?????????, projectNo={}", projectNo);
		
		Map<String, Object> plan = projectService.selectPlanProject(projectNo);
		logger.info("?????? ?????? ???????????? ?????? ?????? plan={}", plan);
		
		int count = projectService.planCount(projectNo);
		logger.info("?????? ?????? count={}", count);
		
		int informCheck = informService.informCheck(projectNo, userNo);
		logger.info("userNo={},projectNo={}",userNo, projectNo);
		logger.info("informCheck={}", informCheck);
		
		model.addAttribute("plan", plan);
		model.addAttribute("count", count);
		model.addAttribute("informCheck", informCheck);
		
		return "project/plan";
	}
	
	@RequestMapping("/planList")
	public String planList(Model model) {
		logger.info("?????? ?????? ???????????? ??????(??????)");
		
		List<Map<String, Object>> planList = projectService.selectplan();
		logger.info("planList={}", planList.size());
		
		model.addAttribute("planList", planList);
		
		return "project/planList";
	}
	
	@RequestMapping("/randomList")
	public String randomList(Model model) {
		logger.info("???????????? ?????? ??????(import???)");
		
		List<Map<String, Object>> random = projectService.randomList();
		logger.info("random={}", random);
		
		model.addAttribute("random", random);
		
		return "project/randomList";
	}
	
	@RequestMapping("/randomListMain")
	public String randomListMain(Model model) {
		logger.info("???????????? ?????? ??????(import???)");
		
		List<Map<String, Object>> random = projectService.randomListMain();
		logger.info("random={}", random.size());
		
		model.addAttribute("random", random);
		
		return "project/randomListMain";
	}
}
