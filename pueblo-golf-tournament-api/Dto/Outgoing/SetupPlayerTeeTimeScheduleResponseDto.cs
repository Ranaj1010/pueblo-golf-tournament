using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class SetupPlayerTeeTimeScheduleResponseDto : BaseResponse
    {
        public List<PlayerTeeTimeScheduleDto> Data { get; set; } = new List<PlayerTeeTimeScheduleDto>();
        public List<TeeTimeScheduleDto> AvailableSlots { get; set; } = new List<TeeTimeScheduleDto>();
        public List<TeeTimeScheduleDto> UnavailableSlots { get; set; } = new List<TeeTimeScheduleDto>();
    }
}