package com.it.cf.board.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.it.cf.board.model.BoardService;
import com.it.cf.board.model.BoardVO;
import com.it.cf.comments.model.CommentsService;
import com.it.cf.comments.model.CommentsVO;
import com.it.cf.common.ConstUtil;
import com.it.cf.common.FileUploadUtil;
import com.it.cf.common.PaginationInfo;
import com.it.cf.common.SearchVO;
import com.it.cf.common.Utility;

import lombok.RequiredArgsConstructor;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
@RequestMapping("/board")
@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final CommentsService commentsService;
	private final FileUploadUtil fileUploadUtil;
	
	// List 화면 출력
	@RequestMapping("/List")
	public String List(@ModelAttribute SearchVO searchVo, Model model) {
		logger.info("게시판 목록 화면 출력 파라미터 searchVo={}",searchVo);
		
		//[1]
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());
		pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		//[2]
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
		logger.info("페이징 처리 적용후 파라미터 searchVo={}",searchVo);
		
		List<BoardVO> list = boardService.selectAll(searchVo);
		logger.info("게시판 목록 출력 list.size={}",list.size());
		
		int TotalRecord = boardService.TotalRecord(searchVo);
		logger.info("게시판 레코드 수 TotalRecord ={}",TotalRecord);
		pagingInfo.setTotalRecord(TotalRecord);
		
		List<Map<Object, Object>> countList = commentsService.CommentsCount();
		
		model.addAttribute("list",list);
		model.addAttribute("pagingInfo",pagingInfo);
		 model.addAttribute("countList",countList);
		return "board/List";
	}
	
	// Write 화면 출력 / 등록
	@GetMapping("/Write")
	public String Write(HttpSession session, Model model) {
		String userNickName = (String) session.getAttribute("userNickName");
		model.addAttribute("userNickName",userNickName);
		
		logger.info("게시판 글쓰기 화면 출력");
		
		return "board/Write";
	}
	
	@PostMapping("/Write")
	public String Write_post(@ModelAttribute BoardVO vo,HttpServletRequest request, Model model) {
		
		logger.info("게시판 글쓰기 등록 파라미터 vo={}",vo);
		
		String boardFilename = "", boardOldfilename = "";
		long fileSize = 0;
		
		try {
			List<Map<String, Object>> list = fileUploadUtil.fileUpload(request, ConstUtil.UPLOAD_FILE_FLAG);
			
			for(int i=0; i<list.size(); i++) {
				Map<String, Object> map = list.get(i);
				boardFilename = (String) map.get("fileName");
				boardOldfilename = (String) map.get("originalFileName");
				fileSize = (long) map.get("fileSize");
			}
			
			logger.info("파일 업로드 성공, boardFilename={}, fileSize={}",boardFilename,fileSize);
			
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		vo.setBoardFilename(boardFilename);
		vo.setBoardFilesize(fileSize);
		vo.setBoardOldfilename(boardOldfilename);
		
		String msg ="글 등록 실패 다시 시도하여주십시오.", url ="/board/Write";
		int cnt = boardService.boardWrite(vo);
		
		if(cnt > 0) {
			msg ="글 등록 성공.";
			url ="/board/List";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	// 조회수 증가
	@RequestMapping("/CountUpdate")
	public String CountUpdate(@RequestParam (defaultValue = "0") int boardNo, Model model) {
		
		logger.info("조회수 증가 파라미터 boardNo={}",boardNo);
		if(boardNo == 0) {
			model.addAttribute("msg","잘못된 url 접근입니다.");
			model.addAttribute("url","/board/List");
			
			return "common/message";
		}
		int cnt = boardService.updateReadCount(boardNo);
		logger.info("조회수 증가 결과 cnt={}", cnt);
		
		return "redirect:/board/Detail?boardNo="+boardNo;
	}
	
	// Detail 상세보기
	@RequestMapping("/Detail")
	public String Detail(@RequestParam (defaultValue = "0") int boardNo,HttpServletRequest request,
						HttpSession session, Model model) {
		
		String userNickName = (String) session.getAttribute("userNickName");
		logger.info("detail 화면 출력 파라미터 boardNo={}, userNickName", boardNo, userNickName);
		
		BoardVO vo = boardService.selectByNo(boardNo);
		logger.info("detail 조회 결과 vo={}",vo);
		
		if(vo.getBoardFilename() != null) {
			String fileInfo = Utility.getFileInfo(vo.getBoardOldfilename(), request, vo.getBoardFilesize());
			model.addAttribute("fileInfo",fileInfo);
		}
		
		BoardVO vo2 = boardService.SelectNextAndPre(boardNo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("userNickName",userNickName);
		model.addAttribute("vo2",vo2);
		return "board/Detail";
	}
	
	// Detail 파일 다운로드
	@RequestMapping("/Download")
	public ModelAndView Download(@ModelAttribute BoardVO vo, HttpServletRequest request) {
		
		logger.info("파일 다운로드 처리 파라미터 vo={}",vo);
		
		int cnt = boardService.updateDownCount(vo.getBoardNo());
		logger.info("파일 다운로드수 증가 결과 cnt={}",cnt);
		
		Map<String, Object> map = new HashMap<>();
		
		String uploadPath = fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG);
		File file = new File(uploadPath,vo.getBoardFilename());
		map.put("file", file);
		map.put("boardOldfilename", vo.getBoardOldfilename());
		
		logger.info("boardOldfilename ={}",vo.getBoardOldfilename());
		
		ModelAndView mav = new ModelAndView("DownloadView",map);
		return mav;
	}
	
	@GetMapping("/Edit")
	public String Edit(@RequestParam(defaultValue ="0") int boardNo,
					HttpServletRequest request,Model model) {
		
		logger.info("수정 화면 출력 파라미터 boardNo={}",boardNo);
	      if(boardNo==0) {
	          model.addAttribute("msg", "잘못된 url 방식의 접근입니다!");
	          model.addAttribute("url", "/Board/List");
	          return "common/message";
	       }
		
		BoardVO vo = boardService.selectByNo(boardNo);
		
		String FileInfo = Utility.getFileInfo(vo.getBoardFilename(),request , boardNo);
		
		model.addAttribute("vo",vo);
		model.addAttribute("FileInfo",FileInfo);
		
		return "board/Edit";
	}
	
	@PostMapping("/Edit")
	public String Edit_post(@ModelAttribute BoardVO vo, @RequestParam String boardOldfilename,
							HttpServletRequest request, Model model) {
		
		logger.info("게시글 수정 처리 파라미터 vo={}, boardOldfilename={}",vo,boardOldfilename );
		
		String Filename = "", Oldfilename = "";
		long fileSize = 0;
		List<Map<String, Object>> list = null;
		
		try {
    		list =fileUploadUtil.fileUpload(request,ConstUtil.UPLOAD_FILE_FLAG);
    		
    		for(Map<String, Object> map : list) {
    			Filename= (String) map.get("fileName");
    			Oldfilename = (String) map.get("originalFileName");
    			fileSize = (long) map.get("fileSize");
    			
    		}
    		
    	} catch (IllegalStateException e) {
    		e.printStackTrace();
    	} catch (IOException e) {
    		e.printStackTrace();
    	}
		
		vo.setBoardFilename(Filename);
        vo.setBoardOldfilename(Oldfilename);
        vo.setBoardFilesize(fileSize);
        
        int result = boardService.EditBoard(vo);
        String msg ="수정에 실패하였습니다.", url="/board/Edit?boardNo="+vo.getBoardNo();
        if(result > 0) {
        	msg ="수정 성공하였습니다.";
        	url="/board/Detail?boardNo="+vo.getBoardNo();
        	
        	if(!list.isEmpty()) {
        		if(Oldfilename !=null && !Oldfilename.isEmpty()) {
        			File oldFile = new File(fileUploadUtil.getUploadPath(request, ConstUtil.UPLOAD_FILE_FLAG),Oldfilename);
        			if(oldFile.exists()) {
        				boolean bool = oldFile.delete();
        				logger.info("기존 업로드 자료 삭제 결과 ={}",bool);
        			}
        		}
        	}
        }
        model.addAttribute("msg", msg);
        model.addAttribute("url", url);
        
        return "common/message";
	}

	
	@RequestMapping("/DeleteOk")
	public String DeleteOk(@ModelAttribute BoardVO vo, HttpServletRequest request,
						  Model model) {
		
		logger.info("boardVO={}",vo);
		
		String msg ="게시글 삭제에 실패하였습니다 다시 시도해주세요.";
		String url ="/board/Detail?"+vo.getBoardNo();
		
		logger.info("게시글 삭제 파라미터 vo={}",vo);
		int result = boardService.DeleteBoard(vo);
		
		if(result > 0) {
			msg ="게시글 삭제 완료.";
			url ="/board/List";
		}
		
		String fileName = vo.getBoardOldfilename();
		
		logger.info("fileName={}",fileName);
        if(fileName != null && !fileName.isEmpty()) {
        	File file = new File(fileUploadUtil.getUploadPath(request,ConstUtil.UPLOAD_FILE_FLAG),fileName);
    		if(file.exists()) {
    			boolean bool = file.delete();
    			logger.info("파일 삭제 여부 :{}", bool);
    		}
        }
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("UserBoard")
	public String UserBoard(@ModelAttribute SearchVO searchVo,Model model) {
				//[1]
				PaginationInfo pagingInfo = new PaginationInfo();
				pagingInfo.setCurrentPage(searchVo.getCurrentPage());
				pagingInfo.setBlockSize(ConstUtil.BLOCK_SIZE);
				pagingInfo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
				//[2]
				searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
				searchVo.setRecordCountPerPage(ConstUtil.RECORD_COUNT);
				logger.info("페이징 처리 적용후 파라미터 searchVo={}",searchVo);
				
				List<Map<Object, Object>> list = boardService.UserBoard(searchVo);
				logger.info("게시판 목록 출력 list.size={}",list.size());
				
				int TotalRecord = boardService.TotalRecord(searchVo);
				logger.info("게시판 레코드 수 TotalRecord ={}",TotalRecord);
				pagingInfo.setTotalRecord(TotalRecord);
				
				List<Map<Object, Object>> countList = commentsService.CommentsCount();
				
				model.addAttribute("list",list);
				model.addAttribute("pagingInfo",pagingInfo);
				model.addAttribute("countList",countList);
				return "board/UserBoard";
	}
}
