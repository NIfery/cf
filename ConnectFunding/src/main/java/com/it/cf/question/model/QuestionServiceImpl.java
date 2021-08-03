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
	public List<AnswerVO> answerList(SearchVOQuestion vo) {
		return questiondao.answerList(vo);
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

}
