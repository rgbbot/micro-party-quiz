package com.micropartyquiz.quiz_game.model;

import lombok.ToString;

import java.util.List;

@ToString
public class QuestionModel {

    public Long id;
    public String category;
    public Long managerId;
    public String questionLabel;
    public String questionPicture;

    public List<QuestionFieldModel> questionFieldModels;

}
