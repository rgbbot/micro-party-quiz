package com.micropartyquiz.quiz_game.db.entity;

import lombok.Data;
import org.springframework.data.jpa.convert.threeten.Jsr310JpaConverters.LocalDateTimeConverter;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "manager")
@Data
public class Manager implements Serializable {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        private Long id;

        private String login;
        private String password;
        private String salt;
        private String state;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime lastLogin;

        private String shortName;
        private String fullName;

        private boolean isMultiSession;

        @Convert(converter = LocalDateTimeConverter.class)
        private LocalDateTime created;

        @OneToMany(cascade = CascadeType.ALL, mappedBy = "id", fetch = FetchType.LAZY)
        private List<Game> games;

}
