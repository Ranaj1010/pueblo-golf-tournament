using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class PlayerTeeTimeScheduleDto : BaseDto
    {
        public long PlayerId { get; set; }
        public long TeeTimeScheduleId { get; set; }
    }
}