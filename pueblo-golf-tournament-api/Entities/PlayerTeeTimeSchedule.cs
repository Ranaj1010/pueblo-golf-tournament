using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Entities
{
    public class PlayerTeeTimeSchedule : BaseEntity
    {
        public long PlayerId { get; set; }
        public long TeeTimeScheduleId { get; set; }
        public HoleTypeEnum HoleType { get; set; }
    }
}