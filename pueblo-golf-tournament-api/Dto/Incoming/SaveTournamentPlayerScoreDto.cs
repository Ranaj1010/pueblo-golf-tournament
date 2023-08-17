namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class SaveTournamentPlayerScoreDto
    {
        public long TournamentId { get; set; }
        public long PlayerId { get; set; }
        public long TeamId { get; set; }
        public long RegistrationId { get; set; }
        public long TournamentHoleId { get; set; }
        public long TeeTimeScheduleId { get; set; }
        public int ActualStrokes { get; set; }
        public long ScorerId { get; set; }
    }
}