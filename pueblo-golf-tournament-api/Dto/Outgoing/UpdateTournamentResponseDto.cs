using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class UpdateTournamentResponseDto : BaseResponse
    {
        public TournamentDto Data { get; set; }
    }
}