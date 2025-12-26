package frnz.matchdiary.service;

import frnz.matchdiary.dto.team.TeamRequestDTO;
import frnz.matchdiary.dto.team.TeamResponseDTO;
import frnz.matchdiary.model.Team;
import frnz.matchdiary.repository.TeamRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TeamService {

    @Autowired
    private TeamRepository teamRepository;

    public TeamResponseDTO getTeamById(final Long id) {

        if (id <= 0) {
            return new TeamResponseDTO();
        }

        Optional<Team> response = this.teamRepository.findById(id);

        if (response.isPresent()) {
            return new TeamResponseDTO(response.get());
        } else {
            return new TeamResponseDTO();
        }
    }

    public List<Team> getAllTeams() {
        return this.teamRepository.findAll();
    }

    public Team registerTeam(final TeamRequestDTO teamRequestDTO) {

        if (teamRequestDTO.getName().isEmpty() || teamRequestDTO.getState().isEmpty() || teamRequestDTO
                .getPhotoUrl().isEmpty()) {
            return null;
        }

        Team team = new Team(teamRequestDTO);
        return this.teamRepository.save(team);
    }

    public Team updateTeam(final TeamRequestDTO teamRequestDTO) {

        if (teamRequestDTO.getName().isEmpty() || teamRequestDTO.getState().isEmpty() || teamRequestDTO
                .getPhotoUrl().isEmpty()) {
            return null;
        }

        Team team = new Team(teamRequestDTO);
        return this.teamRepository.save(team);
    }

    public void deleteTeam(Long id) {

       teamRepository.deleteById(id);
    }

}
