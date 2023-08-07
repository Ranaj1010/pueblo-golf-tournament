using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupPlayerScheduleResponseDto : BaseResponse
    {
        public long PlayerId { get; set; }
        public List<TournamentScheduleDate> Data { get; set; } = new List<TournamentScheduleDate>();
    }
}