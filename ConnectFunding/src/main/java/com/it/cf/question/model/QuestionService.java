package com.it.cf.question.model;

import java.util.List;


public interface QuestionService {
	int insertQuestion(QuestionVO vo);
	List<QuestionVO> questionList(SearchVOQuestion vo);
	int questionCount(SearchVOQuestion vo);
	List<QuestionVO> questionbyProjectNo(SearchVOQuestion vo);
	List<AnswerVO> answerList(SearchVOQuestion vo);
	
	int insertAnswer(AnswerVO vo);
}
