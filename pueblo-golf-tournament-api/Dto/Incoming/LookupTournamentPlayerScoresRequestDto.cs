namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class LookupTournamentPlayerScoresRequestDto
    {
        public long PlayerId { get; set; }
        public long TournamentId { get; set; }
        public long TeeTimeScheduleId { get; set; }
        public long TeamId { get; set; }
    }
}