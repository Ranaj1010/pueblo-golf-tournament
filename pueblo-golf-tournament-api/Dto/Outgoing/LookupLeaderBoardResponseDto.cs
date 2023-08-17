using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupLeaderBoardResponseDto : BaseResponse
    {
        public List<DivisionLeaderBoard> Data { get; set; }
    }
}