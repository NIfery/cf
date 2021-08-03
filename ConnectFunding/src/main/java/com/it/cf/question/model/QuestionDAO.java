package com.it.cf.question.model;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface QuestionDAO {
	int insertQuestion(QuestionVO vo);
	List<QuestionVO> questionList(SearchVOQuestion vo);
	int questionCount(SearchVOQuestion vo);
	List<QuestionVO> questionbyProjectNo(SearchVOQuestion vo);
	List<AnswerVO> answerList(SearchVOQuestion vo);
	
	int insertAnswer(AnswerVO vo);
	int questionFlagY(int questionNo);
}
