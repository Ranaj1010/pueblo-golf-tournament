using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TournamentPlayerScoreDto : BaseDto
    {
        public long TournamentId { get; set; }
        public long PlayerId { get; set; }
        public long TeamId { get; set; }
        public long RegistrationId { get; set; }
        public long TournamentHoleId { get; set; }
        public long PlayerTeeTimeScheduleId { get; set; }
        public long TeeTimeScheduleId { get; set; }
        public int ActualStrokes { get; set; }
        public int MolaveScore { get; set; }
        public long ScorerId { get; set; }
    }
}