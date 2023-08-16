using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class TournamentTeamDivision : BaseEntity
    {
        public long TeamId { get; set; }
        public long TournamentId { get; set; }
        public long DivisionId { get; set; }
    }
}