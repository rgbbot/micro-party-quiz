package com.micropartyquiz.quiz_game.db.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters.LocalDateTimeConverter;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "question_category")
@Data
public class QuestionCategory implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String category;
        private Long nameId;
        private boolean isDeleted;

        @OneToMany(targetEntity = Question.class, mappedBy = "id", orphanRemoval = false, fetch = FetchType.LAZY)
        @Transient
        private List<Question> questions;

}
