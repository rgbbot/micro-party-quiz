package com.micropartyquiz.quiz_game.db.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

@Entity
@Table(name = "question_field")
@Data
public class QuestionField implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;
        private String code;
        private boolean isMultiValue;
        private boolean isDeleted;
        private boolean isReadOnly;
        private String fieldType;
        private Integer displayOrder;
        private String values;
        private Long masterQuestionFieldId;
        private boolean isCorrect;
        private String questionFieldDescription;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "question_id", insertable = false, updatable = false)
        @Fetch(FetchMode.JOIN)
        private Question question;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<QuestionFieldData> questionFieldData;
}
