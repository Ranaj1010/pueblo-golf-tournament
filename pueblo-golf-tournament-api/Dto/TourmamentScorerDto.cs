using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TourmamentScorerDto : BaseDto
    {
        public long ScorerId { get; set; }
        public long TournamentId { get; set; }
    }
}