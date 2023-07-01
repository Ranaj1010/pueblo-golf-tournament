using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class TeeTimeSchedule : BaseEntity
    {
        public long TournamentId { get; set; }
        public DateTime DateTimeSlot { get; set; }
        public bool IsFull { get; set; }
        public bool IsDisabled { get; set; }
    }
}