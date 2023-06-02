using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTeamDto
    {
        public RegisterTeamDto()
        {
            Members = new List<long>();
        }
        public long TournamentId { get; set; }
        public long TeamCaptainId { get; set; }
        public string? Name{ get; set; }
        public string? BackgroundColor { get; set; }
        public List<long> Members { get; set; }
    }
}