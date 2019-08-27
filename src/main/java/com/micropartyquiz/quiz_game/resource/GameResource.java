package com.micropartyquiz.quiz_game.resource;

import com.micropartyquiz.quiz_game.model.QuestionModel;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class GameResource {

    @RequestMapping(method = RequestMethod.POST, value = "/api/quiz_game/v1/init_game")
    public ResponseEntity<String> initGame() {
        // Init game workflow
        return new ResponseEntity<>("Game id", HttpStatus.OK);
    }

    @RequestMapping(method = RequestMethod.GET, value = "/api/quiz_game/v1/getQuestion/{id}")
    public ResponseEntity<String> getQuestion(@PathVariable final Long questionId) {
        //
        return new ResponseEntity<>("Game id", HttpStatus.OK);
    }

//    @RequestMapping(method = RequestMethod.POST, value = "/api/quiz_game/v1/submitAnswer")
//    public ResponseEntity<String> submitAnswer(
//            @RequestBody final Answer answer) {
//        return new ResponseEntity<>("Correct", HttpStatus.OK);
//    }

}
