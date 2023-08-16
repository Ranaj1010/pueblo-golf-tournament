using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TournamentTeamDivisionDto : BaseDto
    {
        public long TeamId { get; set; }
        public long TournamentId { get; set; }
        public long DivisionId { get; set; }
    }
}