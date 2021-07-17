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
import com.it.cf.common.ConstUtil;
import com.it.cf.common.FileUploadUtil;
import com.it.cf.common.Utility;

import lombok.RequiredArgsConstructor;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
@RequestMapping("/board")
@Controller
@RequiredArgsConstructor
public class BoardController {
	
	private static final Logger logger
		= LoggerFactory.getLogger(BoardController.class);
	
	private final BoardService boardService;
	private final FileUploadUtil fileUploadUtil;
	
	// List 화면 출력
	@GetMapping("/List")
	public void List(Model model) {
		logger.info("게시판 목록 화면 출력");
		
		List<BoardVO> list = boardService.selectAll();
		logger.info("게시판 목록 출력 list.size={}",list.size());
		
		model.addAttribute("list",list);
	}
	
	// Write 화면 출력 / 등록
	@GetMapping("/Write")
	public void Write() {
		logger.info("게시판 글쓰기 화면 출력");
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
	public String Detail(@RequestParam (defaultValue = "0") int boardNo,HttpServletRequest request, Model model) {
		
		logger.info("detail 화면 출력 파라미터 boardNo={}", boardNo);
		
		BoardVO vo = boardService.selectByNo(boardNo);
		logger.info("detail 조회 결과 vo={}",vo);
		
		if(vo.getBoardFilename() != null) {
			String fileInfo = Utility.getFileInfo(vo.getBoardOldfilename(), request, vo.getBoardFilesize());
			model.addAttribute("fileInfo",fileInfo);
		}
		
		model.addAttribute("vo",vo);
		
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
}
