using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class UpdateTeeTimeScheduleResponseDto : BaseResponse
    {
        public  TeeTimeScheduleDto? Data { get; set; }
    }
}