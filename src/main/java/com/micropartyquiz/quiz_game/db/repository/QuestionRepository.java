package com.micropartyquiz.quiz_game.db.repository;

import com.micropartyquiz.quiz_game.db.entity.Question;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface QuestionRepository extends CrudRepository<Question, Long> {

    Optional<Question> findById(final Long id);
}
