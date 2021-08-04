package com.it.cf.question.model;

import java.util.List;


public interface QuestionService {
	int insertQuestion(QuestionVO vo);
	List<QuestionVO> questionList(SearchVOQuestion vo);
	int questionCount(SearchVOQuestion vo);
	int questionProjectCount(SearchVOQuestion vo);
	List<QuestionVO> questionbyProjectNo(SearchVOQuestion vo);
	int questionEdit(QuestionVO vo);
	int deleteQuestion(int questionNo);
	
	List<AnswerVO> answerList(int userNo);
	List<AnswerVO> answerListbyProjectNo(int projectNo);
	int insertAnswer(AnswerVO vo);
	int deleteAnswer(int questionNo);
	int answerEdit(AnswerVO vo);
}
