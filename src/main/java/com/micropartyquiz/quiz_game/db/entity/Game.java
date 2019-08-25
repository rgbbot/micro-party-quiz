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
@Table(name = "game")
@Data
public class Game implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        private String name;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime created;

        @ManyToOne(fetch = FetchType.LAZY)
        @JoinColumn(name = "manager_id", insertable = false, updatable = false)
        @Fetch(FetchMode.JOIN)
        private Manager manager;

        private Integer maxPoints;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<GamePlayer> gamePlayers;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<GameQuestion> gameQuestions;

}
