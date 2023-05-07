using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredTournamentDto : BaseResponse
    {
        public TournamentDto? Data { get; set; }
    }
}