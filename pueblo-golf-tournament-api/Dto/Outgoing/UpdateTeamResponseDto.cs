using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class UpdateTeamResponseDto : BaseResponse
    {
        public TeamDto Data { get; set; }
    }
}