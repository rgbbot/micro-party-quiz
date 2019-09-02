package com.micropartyquiz.quiz_game.model;

import lombok.ToString;

import java.util.List;

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
    public String questionFieldDescription;
    public Long questionId;

    public List<QuestionFieldModel> subFields;

    public List<QuestionFieldDataModel> questionFieldDataModel;

}
