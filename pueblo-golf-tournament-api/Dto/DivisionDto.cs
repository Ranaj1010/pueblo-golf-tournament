using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class DivisionDto : BaseDto
    {
        public string? Name { get; set; }
        public long TournamentId { get; set; }
    }
    public class DivisionRawDto
    {
        public string? Name { get; set; }
        public long TournamentId { get; set; }
    }
}