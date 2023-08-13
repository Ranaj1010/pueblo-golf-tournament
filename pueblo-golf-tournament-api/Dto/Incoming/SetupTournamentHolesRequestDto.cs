namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class SetupTournamentHolesRequestDto
    {
        public long TournamentId { get; set; }
        public List<HoleRequestDto> Holes { get; set; } = new List<HoleRequestDto>();
    }
    public class HoleRequestDto {
        public int HoleNumber { get; set; }
        public int MaximumStrokes { get; set; }
    }
}