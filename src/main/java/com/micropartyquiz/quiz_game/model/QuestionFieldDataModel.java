package com.micropartyquiz.quiz_game.model;

import lombok.ToString;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@ToString
public class QuestionFieldDataModel {

    public Long id;
    public Long questionFieldId;
    public String textValue;
    public BigDecimal numericValue;
    public LocalDateTime dateTimeValue;
    public boolean booleanValue;
    public Long playerId;
    public String managerComment;

}
