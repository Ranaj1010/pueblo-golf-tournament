using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTeeTimeSchedulesResponseDto : BaseResponse
    {
        public List<TournamentScheduleDate> Data { get; set; } = new List<TournamentScheduleDate>();
    }

    public class TournamentScheduleDate
    {
        public HoleTypeEnum HoleType { get; set; }
        public DateTime? Date { get; set; }
        public List<TeeTimeScheduleDto> TimeSchedules { get; set; } = new List<TeeTimeScheduleDto>();
    }
}