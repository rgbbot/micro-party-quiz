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
@Table(name = "question")
@Data
public class Question implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "category", insertable = false, updatable = false)
        @Fetch(FetchMode.JOIN)
        private QuestionCategory category;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime created;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime updated;

        private Long managerId;
        private String questionLabel;
        private String questionPicture;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<QuestionField> questionFields;

}
