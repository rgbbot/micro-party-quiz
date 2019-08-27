package com.micropartyquiz.quiz_game.resource;

import com.micropartyquiz.quiz_game.db.entity.Question;
import com.micropartyquiz.quiz_game.db.entity.QuestionField;
import com.micropartyquiz.quiz_game.db.entity.QuestionFieldData;
import com.micropartyquiz.quiz_game.model.QuestionFieldDataModel;
import com.micropartyquiz.quiz_game.model.QuestionFieldModel;
import com.micropartyquiz.quiz_game.model.QuestionModel;
import com.micropartyquiz.quiz_game.service.QuestionService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.stream.Collectors;

@RestController
@RequiredArgsConstructor
public class QuestionResource {

    private final QuestionService questionService;

    @RequestMapping(method = RequestMethod.GET, value = "/api/quiz_game/v1/question/{id}")
    public ResponseEntity<QuestionModel> getQuestionById(@PathVariable final Long id) {
        return new ResponseEntity<>(this.toModel(questionService.findById(id)), HttpStatus.OK);
    }

    public List<QuestionModel> toModel(final List<Question> questions) {
        return questions.stream().map(this::toModel).collect(Collectors.toList());
    }

    public QuestionModel toModel(final Question question) {
        final QuestionModel questionModel = new QuestionModel();
        questionModel.id = question.getId();
        questionModel.category = question.getCategory().getCategory();
        questionModel.managerId = question.getManagerId();
        questionModel.questionLabel = question.getQuestionLabel();
        questionModel.questionPicture = question.getQuestionPicture();
        questionModel.questionFieldModels = toFieldModel(question.getQuestionFields());

        return questionModel;
    }

    public List<QuestionFieldModel> toFieldModel(final List<QuestionField> questionFields) {
        return questionFields.stream().map(this::toFieldModel).collect(Collectors.toList());
    }

    public QuestionFieldModel toFieldModel(final QuestionField questionField) {
        final QuestionFieldModel questionFieldModel = new QuestionFieldModel();
        questionFieldModel.id = questionField.getId();
        questionFieldModel.code = questionField.getCode();
        questionFieldModel.isMultiValue = questionField.isMultiValue();
        questionFieldModel.isReadOnly = questionField.isReadOnly();
        questionFieldModel.fieldType = questionField.getFieldType();
        questionFieldModel.displayOrder = questionField.getDisplayOrder();
        questionFieldModel.values = questionField.getValues();
        questionFieldModel.masterQuestionFieldId = questionField.getMasterQuestionFieldId();
        questionFieldModel.isCorrect = questionField.isCorrect();
        questionFieldModel.questionFieldDescription = questionField.getQuestionFieldDescription();
        questionFieldModel.questionId = questionField.getQuestion().getId();
        questionFieldModel.questionFieldDataModel = toFieldDataModel(questionField.getQuestionFieldData());

        return questionFieldModel;
    }

    public List<QuestionFieldDataModel> toFieldDataModel(final List<QuestionFieldData> questionFieldDataList) {
        return questionFieldDataList.stream().map(this::toFieldDataModel).collect(Collectors.toList());
    }

    public QuestionFieldDataModel toFieldDataModel(final QuestionFieldData questionFieldData) {
        final QuestionFieldDataModel questionFieldDataModel = new QuestionFieldDataModel();
        questionFieldDataModel.id = questionFieldData.getId();
        questionFieldDataModel.questionFieldId = questionFieldData.getQuestionField().getId();
        questionFieldDataModel.textValue = questionFieldData.getTextValue();
        questionFieldDataModel.numericValue = questionFieldData.getNumericValue();
        questionFieldDataModel.dateTimeValue = questionFieldData.getDateTimeValue();
        questionFieldDataModel.booleanValue = questionFieldData.isBooleanValue();
        questionFieldDataModel.playerId = questionFieldData.getPlayerId();
        questionFieldDataModel.managerComment = questionFieldData.getManagerComment();

        return questionFieldDataModel;
    }

}
