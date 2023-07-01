using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTeeTimeSchedulesResponseDto : BaseResponse
    {
        public List<TeeTimeScheduleDto> Data { get; set; } = new List<TeeTimeScheduleDto>();
    }
}