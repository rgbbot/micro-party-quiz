package com.micropartyquiz.quiz_game.service;

import com.micropartyquiz.quiz_game.db.entity.Question;
import com.micropartyquiz.quiz_game.db.repository.QuestionRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class QuestionService {

    private final QuestionRepository questionRepository;

    public Question findById(final Long id) {
        return questionRepository.findById(id).orElse(null);
    }

    public List<Question> findAll() {
        return questionRepository.findAll();
    }

    public Long createQuestion(Question question) {
        questionRepository.save(question);
    }
}
