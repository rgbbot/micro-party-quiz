package com.micropartyquiz.quiz_game.model;

import lombok.ToString;

@ToString
public class QuestionFieldModel {

    public Long id;
    public String code;
    public boolean isMultiValue;
    public boolean isReadOnly;
    public String fieldType;
    public Integer displayOrder;
    public String values;
    public Long masterQuestionFieldId;
    public boolean isCorrect;
    public String questionDescription;
    public Long questionId;

    public QuestionFieldDataModel questionFieldDataModel;

}
