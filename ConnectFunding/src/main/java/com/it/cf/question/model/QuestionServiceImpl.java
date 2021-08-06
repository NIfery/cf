package com.it.cf.question.model;

import java.util.List;

import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class QuestionServiceImpl implements QuestionService{
	private final QuestionDAO questiondao;
	
	@Override
	public int insertQuestion(QuestionVO vo) {
		return questiondao.insertQuestion(vo);
	}

	@Override
	public List<QuestionVO> questionList(SearchVOQuestion vo) {
		return questiondao.questionList(vo);
	}

	@Override
	public int questionCount(SearchVOQuestion vo) {
		return questiondao.questionCount(vo);
	}

	@Override
	public List<AnswerVO> answerList(int userNo) {
		return questiondao.answerList(userNo);
	}

	@Override
	public List<QuestionVO> questionbyProjectNo(SearchVOQuestion vo) {
		return questiondao.questionbyProjectNo(vo);
	}

	@Override
	public int insertAnswer(AnswerVO vo) {
		int cnt=questiondao.insertAnswer(vo);
		cnt=questiondao.questionFlagY(vo.getQuestionNo());
		return cnt;
	}

	@Override
	public int questionEdit(QuestionVO vo) {
		return questiondao.questionEdit(vo);
	}

	@Override
	public int questionProjectCount(SearchVOQuestion vo) {
		return questiondao.questionProjectCount(vo);
	}

	@Override
	public List<AnswerVO> answerListbyProjectNo(int projectNo) {
		return questiondao.answerListbyProjectNo(projectNo);
	}

	@Override
	public int deleteQuestion(int questionNo) {
		return questiondao.deleteQuestion(questionNo);
	}

	@Override
	public int deleteAnswer(int questionNo) {
		int cnt=questiondao.deleteAnswer(questionNo);
		cnt=questiondao.questionFlagN(questionNo);
		return cnt;
	}

	@Override
	public int answerEdit(AnswerVO vo) {
		return questiondao.answerEdit(vo);
	}

}
