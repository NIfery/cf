package com.it.cf.notice.contoroller;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

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

import com.it.cf.notice.model.NoticeFileUpload;
import com.it.cf.notice.model.NoticeService;
import com.it.cf.notice.model.NoticeVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/notice")
public class NoticeContoller {

	private static final Logger logger
		= LoggerFactory.getLogger(NoticeContoller.class);
	
	private final NoticeService noticeService;
	private final NoticeFileUpload fileupLoad;
	
	@RequestMapping("/notice_tab")
	public String notices(Model model) {
		logger.info("공지사항 화면");
		
		String category = "공지사항";
		
		List<NoticeVO> noticelist = noticeService.selectNotice(category);
		logger.info("공지사항 조회결과, noticelist.size={}", noticelist.size());
		
		model.addAttribute("noticelist", noticelist);
		
		return "notice/notice_tab";
	}//
	
	@RequestMapping("/notices")
	public String noticess(Model model) {
		logger.info("공지사항 화면");
		
		String category = "공지사항";
		
		List<NoticeVO> noticelist = noticeService.selectNotice(category);
		logger.info("공지사항 조회결과, noticelist.size={}", noticelist.size());
		
		model.addAttribute("noticelist", noticelist);
		
		return "notice/notices";
	}//
	
	@RequestMapping("/event")
	public String event(Model model) {
		logger.info("공지사항 - 이벤트화면");
		
		String category = "이벤트";
		
		List<NoticeVO> eventlist = noticeService.selectNotice(category);
		logger.info("이벤트 조회결과, noticelist.size={}", eventlist.size());
		
		model.addAttribute("eventlist", eventlist);
		
		return "notice/event";
	}//
	
	@RequestMapping("/news")
	public String news(Model model) {
		logger.info("공지사항 - 보도자료 화면");
		
		String category = "보도자료";
		
		List<NoticeVO> newslist = noticeService.selectNotice(category);
		logger.info("보도자료 조회결과, newslist.size={}", newslist.size());
		
		model.addAttribute("newslist", newslist);
		
		return "notice/news";
	}//
	
	@RequestMapping("/notice_detail")
	public String notice_detail(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("공지사항 내용보기, 파라미터 noticeNo={}", noticeNo);
		
		NoticeVO noticeVo = noticeService.selectByNoticeNo(noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "notice/notice_detail";
	}
	
	@RequestMapping("/event_detail")
	public String event_detail(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("이벤트 detail, 파라미터 noticeNo={}", noticeNo);
		
		NoticeVO noticeVo = noticeService.selectByNoticeNo(noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "notice/event_detail";
	}
	
	@RequestMapping("/news_detail")
	public String news_detail(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("보도자료 detail, 파라미터 noticeNo={}", noticeNo);
		
		NoticeVO noticeVo = noticeService.selectByNoticeNo(noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다");
			model.addAttribute("url", "/notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "notice/news_detail";
	}
	
	@GetMapping("/notice_write")
	public String notice_write() {
		logger.info("공지사항 등록화면");
		return "/notice/notice_write";
	}
	
	@PostMapping("/notice_write")
	public String notice_write_post(HttpSession session, @ModelAttribute NoticeVO noticeVo, Model model) {
		
		int admin_no = (int) session.getAttribute("userNo");
		logger.info("공지사항 등록화면");
		
		int cnt = noticeService.insertNotice(noticeVo);
		noticeVo.setAdminNo(admin_no);
		
		String msg="공지사항 등록실패, 다시 시도하세요.", url="/notice/notice_write";
		if(cnt>0) {
			msg="공지사항을 등록하였습니다.";
			url="/notice/notice_tab";
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}//
	
	@GetMapping("/notice_edit")
	public String notice_edit(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("공지사항 수정하기 화면, 파라미터 noticeNo={}", noticeNo);
		
		NoticeVO noticeVo = noticeService.selectByNoticeNo(noticeNo);
		
		if(noticeNo==0) {
			model.addAttribute("msg", "잘못된 url입니다.");
			model.addAttribute("url", "/notice/notice_tab");
			
			return "common/message";
		}
		
		model.addAttribute("noticeVo", noticeVo);
		
		return "/notice/notice_edit";
	}
	
	@PostMapping("/notice_edit")
	public String notice_edit_post(@ModelAttribute NoticeVO noticeVo, 
			HttpSession session, Model model) {
		
		int adminNo = (int) session.getAttribute("userNo");
		noticeVo.setAdminNo(adminNo);
		
		int cnt = noticeService.updateNotice(noticeVo);
		logger.info("공지사항 수정완료, cnt={}", cnt);
		
		String msg="공지사항 수정실패, 다시 시도해주세요.", url="/notice/notice_edit?noticeNo="+noticeVo.getNoticeNo();
		if(cnt>0) {
			msg="공지사항을 수정하였습니다.";
			url="/notice/notice_detail?noticeNo="+noticeVo.getNoticeNo();
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}//
	
	@RequestMapping("/deleteNotice")
	public String deleteNotice(@RequestParam(defaultValue = "0") int noticeNo, Model model) {
		
		logger.info("공지사항 삭제화면, 파라미터 noticeNo={}", noticeNo );
		
		int cnt = noticeService.deleteNotice(noticeNo);

		String msg="공지사항 삭제 실패, 다시 시도해주세요.", url="/notice/notice_detail?noticeNo="+noticeNo;
		if(cnt>0) {
			msg="공지사항이 삭제되었습니다.";
			url="/notice/notice_tab";
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
