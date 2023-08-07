namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class LookupPlayerScheduleRequestDto
    {
        public long TournamentId { get; set; }
        public long PlayerId { get; set; }
    }
}