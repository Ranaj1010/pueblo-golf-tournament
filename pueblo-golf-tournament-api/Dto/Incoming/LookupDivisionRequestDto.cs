namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class LookupDivisionRequestDto
    {
        public string? filterName { get; set; }
        public long? tournamentId { get; set; }
    }
}