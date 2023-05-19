using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTeamDto
    {
        public RegisterTeamDto()
        {
            Members = new List<RegisterPlayerDto>();
            Team = new TeamRawDto();
            TeamCaptain = new TeamCaptainRegistration();
        }
        public long TournamentId { get; set; }
        public long DivisionId { get; set; }
        public TeamRawDto Team { get; set; }
        public PaymentDto Payment { get; set; }
        public TeamCaptainRegistration TeamCaptain { get; set; }
        public List<RegisterPlayerDto> Members { get; set; }
    }

    public class TeamCaptainRegistration
    {   
        public long PersonId { get; set; }
        public PlayerRawDto? PlayerDetails { get; set; }
    }
}