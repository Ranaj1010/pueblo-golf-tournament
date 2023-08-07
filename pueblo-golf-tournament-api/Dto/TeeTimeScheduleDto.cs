using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TeeTimeScheduleDto : BaseDto
    {
        public long TournamentId { get; set; }
        public DateTime DateTimeSlot { get; set; }
        public bool IsSelected { get; set; }
        public bool IsFull { get; set; }
        public bool IsEnabled { get; set; }
    }
}