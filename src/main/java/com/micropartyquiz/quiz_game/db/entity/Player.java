package com.micropartyquiz.quiz_game.db.entity;

import lombok.Data;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters.LocalDateTimeConverter;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "player")
@Data
public class Player implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        private String username;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime created;

        private String state;
        private int points;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<GamePlayer> gamePlayers;

}
