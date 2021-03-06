package com.it.cf.comments.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.it.cf.comments.model.CommentsService;
import com.it.cf.comments.model.CommentsVO;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/Comments")
@RequiredArgsConstructor
public class CommentsController {

	private static final Logger logger = LoggerFactory.getLogger(CommentsController.class);

	private final CommentsService commentsService;

	
//	  @RequestMapping("/List")
//	  @ResponseBody
//	  public List<CommentsVO> List(@RequestParam int boardNo, Model model) {
//	  
//	  logger.info("댓글 내역 출력");
//	  
//		/* List<Map<Object, Object>> list = commentsService.ShowProfileImg(); */
//	  
//	  return commentsService.selectCommentsList(boardNo);
//	  
//	  }
	 
	  
	  @RequestMapping("/List")
	  @ResponseBody
	  public Map<Object, Object> List(@RequestParam int boardNo, Model model) {
	  
	  logger.info("댓글 내역 출력");
	  
	  Map<Object, Object> map = new HashMap<>();
	  
	  map.put("CommentList", commentsService.selectCommentsList(boardNo));
	  map.put("ProfileImg", commentsService.ShowProfileImg());
	  
	  return map;
	  }

	@RequestMapping("/Write")
	@ResponseBody
	public int Write(@RequestParam(defaultValue = "0") int BoardNo, @RequestParam String userNickName,
			@RequestParam String CommentContent) {

		logger.info("댓글 작성 파라미터 BoardNo={}, UserName={}, CommentContent={}", BoardNo, userNickName, CommentContent);

		CommentsVO vo = new CommentsVO();

		vo.setBoardNo(BoardNo);
		vo.setUserNickName(userNickName);
		vo.setCommentContent(CommentContent);

		return commentsService.CommentsWrite(vo);
	}

	@RequestMapping("/Update")
	@ResponseBody
	public int Update(@RequestParam(defaultValue = "0") int CommentNo, @RequestParam String CommentContent) {

		logger.info("댓글 수정 파라미터 BoardNo={}, CommentContent={}", CommentNo, CommentContent);

		CommentsVO vo = new CommentsVO();
		vo.setCommentNo(CommentNo);
		vo.setCommentContent(CommentContent);

		return commentsService.CommentsUpdate(vo);
	}

	@RequestMapping("/Delete")
	@ResponseBody
	public int Delete(@RequestParam(defaultValue = "0") int CommentNo) {

		logger.info("댓글 삭제 파라미터 CommentNo={}", CommentNo);

		return commentsService.CommentsDelete(CommentNo);
	}

	@RequestMapping("/Reply")
	@ResponseBody
	public int Reply(@RequestParam(defaultValue = "0") int BoardNo, @RequestParam String userNickName,
			@RequestParam(required = false) String CommentReply, @RequestParam(defaultValue = "0") int CommentNo,
			@RequestParam(defaultValue = "0") int CommentGroupNo, @RequestParam(defaultValue = "0") int CommentStep,
			@RequestParam(defaultValue = "0") int CommentSortNo) {

		logger.info("답변 작성 파라미터 BoardNo={},userNickName={},CommentReply={},CommentNo={}", BoardNo, userNickName,
				CommentReply, CommentNo);

		CommentsVO vo = new CommentsVO();

		vo.setBoardNo(BoardNo);
		vo.setCommentNo(CommentNo);
		vo.setUserNickName(userNickName);
		vo.setCommentContent(CommentReply);
		vo.setCommentGroupNo(CommentGroupNo);
		vo.setCommentStep(CommentStep);
		vo.setCommentSortNo(CommentSortNo);

		return commentsService.CommentsReply(vo);
	}
}
