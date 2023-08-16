using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class TournamentScorer : BaseEntity
    {
        public long ScorerId { get; set; }
        public long TournamentId { get; set; }
    }
}