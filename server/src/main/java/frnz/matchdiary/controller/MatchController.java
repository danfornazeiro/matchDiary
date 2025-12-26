package frnz.matchdiary.controller;

import frnz.matchdiary.model.Match;
import frnz.matchdiary.model.Team;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/match")
public class MatchController {

    @GetMapping("/all")
    public String getAllMatches(){
        return "Teste";
    }

    @GetMapping("{id}")
    public String getMatchById(@RequestParam("id") Long id){
        return "";
    }

    @PostMapping()
    public String addMatch(@RequestBody Match match){
        return "";
    }

    @PutMapping
    public String updateMatch(@RequestBody Match match){
        return "";
    }

    @DeleteMapping("{id}")
    public String deleteMatch(@RequestParam("id") Long id){
        return "";
    }
}
