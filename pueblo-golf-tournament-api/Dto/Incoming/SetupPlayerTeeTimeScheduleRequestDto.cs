using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class SetupPlayerTeeTimeScheduleRequestDto
    {
        public long TournamentId { get; set; }
        public long PlayerId { get; set; }
        public List<TeeTimeSchedulePayload> TeeTimeSchedules { get; set; } = new List<TeeTimeSchedulePayload>();
    }
    public class TeeTimeSchedulePayload {
        public HoleTypeEnum HoleType { get; set; }
        public required TeeTimeScheduleDto TeeTimeSchedule { get; set; }
    }
}