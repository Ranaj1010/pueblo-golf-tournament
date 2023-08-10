using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto
{
    public class PlayerTeeTimeScheduleDto : BaseDto
    {
        public long PlayerId { get; set; }
        public long TeeTimeScheduleId { get; set; }
        public HoleTypeEnum HoleType { get; set; }
    }
}