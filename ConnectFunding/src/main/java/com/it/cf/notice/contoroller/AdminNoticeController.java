package com.it.cf.notice.contoroller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.http.HttpRequest;
import java.util.List;
import java.util.Map;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.it.cf.common.PaginationInfo;
import com.it.cf.notice.model.NoticeFileUpload;
import com.it.cf.notice.model.NoticeService;
import com.it.cf.notice.model.NoticeUtil;
import com.it.cf.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin_notice")
public class AdminNoticeController {

	private static final Logger logger
		= LoggerFactory.getLogger(AdminNoticeController.class);
	
	private final NoticeService noticeService;
	private final NoticeFileUpload fileupLoad;
	
	@RequestMapping("/notice_tab")
	public String notices(Model model, @ModelAttribute NoticeVO noticeVo) {
		logger.info("공지사항 전체보기 화면");
		String category = "공지사항";
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(noticeVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(7);
		
		noticeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		noticeVo.setRecordCountPerPage(7);
		noticeVo.setNoticeCategory(category);
		
		List<NoticeVO> allList = noticeService.selectAll(noticeVo);
		logger.info("공지사항 전체 조회결과, allList.size={}", allList.size());
		
		int totalRecord = noticeService.selectTotalCount(noticeVo);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);

		model.addAttribute("allList", allList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin_notice/notice_tab";
	}//
	
	@RequestMapping("/noticeAll")
	public String noticeAll(Model model, @ModelAttribute NoticeVO noticeVo) {
		logger.info("공지사항 전체보기 화면");
		String category = "공지사항";
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(noticeVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(7);
		
		noticeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		noticeVo.setRecordCountPerPage(7);
		noticeVo.setNoticeCategory(category);
		
		List<NoticeVO> allList = noticeService.selectAll(noticeVo);
		logger.info("공지사항 전체 조회결과, allList.size={}", allList.size());
		
		int totalRecord = noticeService.selectTotalCount(noticeVo);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);
		
		model.addAttribute("allList", allList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin_notice/noticeAll";
	}//
	
	@RequestMapping("/notices")
	public String noticess(Model model, @ModelAttribute NoticeVO noticeVo) {
		logger.info("공지사항 화면");
		
		String category = "공지사항";
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(noticeVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(7);
		
		noticeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		noticeVo.setRecordCountPerPage(7);
		noticeVo.setNoticeCategory(category);
		
		List<NoticeVO> noticelist = noticeService.selectNotice(noticeVo);
		logger.info("공지사항 조회결과, noticelist.size={}", noticelist.size());
		
		int totalRecord = noticeService.TotalCountByCate(category);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);

		model.addAttribute("noticelist", noticelist);
		model.addAttribute("pageInfo", pageInfo);

		return "admin_notice/notices";
	}//
	
	@RequestMapping("/event")
	public String event(Model model, @ModelAttribute NoticeVO noticeVo) {
		logger.info("공지사항 - 이벤트화면");
		
		String category = "이벤트";
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(noticeVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(7);
		
		noticeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		noticeVo.setRecordCountPerPage(7);
		noticeVo.setNoticeCategory(category);
		
		List<NoticeVO> eventlist = noticeService.selectNotice(noticeVo);
		logger.info("이벤트 조회결과, noticelist.size={}", eventlist.size());
		
		int totalRecord = noticeService.TotalCountByCate(category);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);
		
		model.addAttribute("eventlist", eventlist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin_notice/event";
	}//
	
	@RequestMapping("/news")
	public String news(Model model, @ModelAttribute NoticeVO noticeVo) {
		logger.info("공지사항 - 보도자료 화면");
		
		String category = "보도자료";
		
		PaginationInfo pageInfo = new PaginationInfo();
		pageInfo.setCurrentPage(noticeVo.getCurrentPage());
		pageInfo.setBlockSize(5);
		pageInfo.setRecordCountPerPage(7);
		
		noticeVo.setFirstRecordIndex(pageInfo.getFirstRecordIndex());
		noticeVo.setRecordCountPerPage(7);
		noticeVo.setNoticeCategory(category);
		
		List<NoticeVO> newslist = noticeService.selectNotice(noticeVo);
		logger.info("보도자료 조회결과, newslist.size={}", newslist.size());
		
		int totalRecord = noticeService.TotalCountByCate(category);
		pageInfo.setTotalRecord(totalRecord);
		logger.info("총 레코드수 totalRecord={}" , totalRecord);
		
		model.addAttribute("newslist", newslist);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin_notice/news";
	}//
	
	@RequestMapping("/notice_detail")
	public String notice_detail(@RequestParam(defaultValue = "0") int noticeNo,
			@ModelAttribute NoticeVO noticeVo, Model model) {
		
		logger.info("공지사항 내용보기, 파라미터 noticeNo={}", noticeNo);
		noticeVo.setNoticeNo(noticeNo);
		noticeVo.setNoticeCategory("공지사항");
		
//		NoticeVO noticeVo = noticeService.selectByNo(noticeNo);
		Map<String, Object> noticemap = noticeService.selectByNoticeNo(noticeVo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin_notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticemap", noticemap);
		
		return "admin_notice/notice_detail";
	}
	
	@RequestMapping("/event_detail")
	public String event_detail(@RequestParam(defaultValue = "0") int noticeNo,
			@ModelAttribute NoticeVO noticeVo, Model model) {
		
		logger.info("이벤트 detail, 파라미터 noticeNo={}", noticeNo);
		noticeVo.setNoticeNo(noticeNo);
		noticeVo.setNoticeCategory("이벤트");
		
//		NoticeVO noticeVo = noticeService.selectByNo(noticeNo);
		Map<String, Object> noticemap = noticeService.selectByNoticeNo(noticeVo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin_notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticemap", noticemap);
		
		return "admin_notice/event_detail";
	}
	
	@RequestMapping("/news_detail")
	public String news_detail(@RequestParam(defaultValue = "0") int noticeNo, 
			@ModelAttribute NoticeVO noticeVo, Model model) {
		
		logger.info("보도자료 detail, 파라미터 noticeNo={}", noticeNo);
		noticeVo.setNoticeNo(noticeNo);
		noticeVo.setNoticeCategory("보도자료");
		
		
//		NoticeVO noticeVo = noticeService.selectByNo(noticeNo);
		Map<String, Object> noticemap = noticeService.selectByNoticeNo(noticeVo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin_notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticemap", noticemap);
		
		return "admin_notice/news_detail";
	}
	
	@RequestMapping("/all_detail")
	public String all_detail(@RequestParam(defaultValue = "0") int noticeNo,
			@ModelAttribute NoticeVO noticeVo, Model model) {
		
		logger.info("전체보기에서 detail, 파라미터 noticeNo={}", noticeNo);
		noticeVo.setNoticeNo(noticeNo);

		
//		NoticeVO noticeVo = noticeService.selectByNo(noticeNo);
		Map<String, Object> noticemap = noticeService.selectByNoticeNo(noticeVo);		
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/admin_notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticemap", noticemap);
		
		return "admin_notice/all_detail";
	}
	
	@GetMapping("/notice_write")
	public String notice_write() {
		logger.info("공지사항 등록화면");
		return "/admin_notice/notice_write";
	}
	
	@PostMapping("/notice_write")
	public String notice_write_post(HttpSession session, @ModelAttribute NoticeVO noticeVo,
			Model model, HttpServletRequest request) {
		
		int admin_no = (int) session.getAttribute("adminNo");
		logger.info("공지사항 등록화면");
		
		String fileName="", originalFileName="";
		try {
			List<Map<String, Object>> list = fileupLoad.fileUpload(request, NoticeUtil.UPLOAD_IMAGE_FLAG);
			for(int i=0;i<list.size();i++) {
				Map<String, Object> map =list.get(i);
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
			}
			
			logger.info("공지사항 사진 업로드, fileName={}, originalFileName={}" , fileName, originalFileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//
		
		noticeVo.setNoticeFilename(fileName);
		noticeVo.setNoticeOldfilename(originalFileName);
		
		int cnt = noticeService.insertNotice(noticeVo);
		noticeVo.setAdminNo(admin_no);
		
		String msg="공지사항 등록실패, 다시 시도하세요.", url="/admin_notice/notice_write";
		if(cnt>0) {
			msg="공지사항을 등록하였습니다.";
			url="/admin_notice/notice_tab";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}//
	
	@GetMapping("/notice_edit")
	public String notice_edit(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("공지사항 수정하기 화면, 파라미터 noticeNo={}", noticeNo);
		
		NoticeVO noticeVo = noticeService.selectByNo(noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/admin_notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "admin_notice/notice_edit";
	}
	
	@PostMapping("/notice_edit")
	public String notice_edit_post(@ModelAttribute NoticeVO noticeVo, @RequestParam String noticeOldfilename, 
			HttpSession session, HttpServletRequest request , Model model) {
		
		int adminNo = (int) session.getAttribute("adminNo");
		noticeVo.setAdminNo(adminNo);
		
		String fileName="", originalFileName="";
		List<Map<String, Object>> list = null;
		try {
			list = fileupLoad.fileUpload(request, NoticeUtil.UPLOAD_IMAGE_FLAG);
			for(int i=0;i<list.size();i++) {
				Map<String, Object> map =list.get(i);
				fileName=(String) map.get("fileName");
				originalFileName=(String) map.get("originalFileName");
			}
			
			logger.info("공지사항 사진 업로드, fileName={}, originalFileName={}" , fileName, originalFileName);
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}//
		
		noticeVo.setNoticeFilename(fileName);
		noticeVo.setNoticeOldfilename(originalFileName);
		
		int cnt = noticeService.updateNotice(noticeVo);
		logger.info("공지사항 수정완료, cnt={}", cnt);
		
		String msg="공지사항 수정실패, 다시 시도해주세요.", url="/admin_notice/notice_edit?noticeNo="+noticeVo.getNoticeNo();
		if(cnt>0) {
			msg="공지사항을 수정하였습니다.";
			url="/admin_notice/notice_detail?noticeNo="+noticeVo.getNoticeNo();
			
			if(!list.isEmpty()) {
				if(noticeOldfilename!=null && !noticeOldfilename.isEmpty()) {
					File oldfile = new File(fileupLoad.getUploadPath(request, NoticeUtil.UPLOAD_IMAGE_FLAG), noticeOldfilename);
					if(oldfile.exists()) {
						boolean bool = oldfile.delete();
						logger.info("기존파일 삭제여부 bool={}", bool);
					}
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/deleteNotice")
	public String deleteNotice(@ModelAttribute NoticeVO noticeVo, 
			HttpServletRequest request, Model model) {
		
		logger.info("공지사항 삭제화면");
		int noticeNo = noticeVo.getNoticeNo();
		String fileName = noticeVo.getNoticeFilename();
		
		int cnt = noticeService.deleteNotice(noticeVo);

		String msg="공지사항 삭제 실패, 다시 시도해주세요.", url="/admin_notice/notice_detail?noticeNo="+noticeNo;
		if(cnt>0) {
			msg="공지사항이 삭제되었습니다.";
			url="/admin_notice/notice_tab";
			
			if(fileName!=null && !fileName.isEmpty()) {
				String path = fileupLoad.getUploadPath(request, NoticeUtil.UPLOAD_IMAGE_FLAG);
				File file = new File(path, fileName);
				if(file.exists()) {
					boolean bool=file.delete();
					logger.info("파일 삭제 여부:{}", bool);
				}
			}
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@ResponseBody
	@PostMapping("/notice_image")
	public void summer_image(MultipartFile file, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		// 업로드할 폴더 경로
		String realFolder = request.getSession().getServletContext().getRealPath("project_assets/noticeImg");

		// 업로드할 파일 이름
		String org_filename = file.getOriginalFilename();
		String str_filename = fileupLoad.getUniqueFileName(org_filename);

		System.out.println("원본 파일명 : " + org_filename);
		System.out.println("저장할 파일명 : " + str_filename);

		String filepath = realFolder + "\\" + str_filename;
		System.out.println("파일경로 : " + filepath);

		File f = new File(filepath);
		if (!f.exists()) {
			f.mkdirs();
		}
		file.transferTo(f);
		out.println("/cf/project_assets/project_assets/noticeImg/"+str_filename);
		out.close();
	}
}
