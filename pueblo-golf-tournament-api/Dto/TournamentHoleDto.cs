using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TournamentHoleDto : BaseDto
    {
        public long TournamentId { get; set; }
        public int HoleNumber { get; set; }
        public int MaximumStrokes { get; set; }
    }
}