package com.it.cf.question.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionDAO {
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
	int questionFlagY(int questionNo);
	int questionFlagN(int questionNo);
	int deleteAnswer(int questionNo);
	int answerEdit(AnswerVO vo);
}
