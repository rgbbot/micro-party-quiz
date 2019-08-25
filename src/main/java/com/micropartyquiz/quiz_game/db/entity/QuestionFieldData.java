package com.micropartyquiz.quiz_game.db.entity;

import lombok.Data;
import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;

import javax.persistence.*;
import java.io.Serializable;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "question_field_data")
@Data
public class QuestionFieldData implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "question_field_id", insertable = false, updatable = false)
        @Fetch(FetchMode.JOIN)
        private QuestionField questionField;

        private String text_value;
        private BigDecimal numericValue;
        private LocalDateTime dateTimeValue;
        private boolean booleanValue;
        private Long playerId;
        private String managerComment;

}
