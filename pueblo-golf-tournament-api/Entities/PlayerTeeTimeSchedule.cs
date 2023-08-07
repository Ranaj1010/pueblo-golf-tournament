using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class PlayerTeeTimeSchedule : BaseEntity
    {
        public long PlayerId { get; set; }
        public long TeeTimeScheduleId { get; set; }
    }
}