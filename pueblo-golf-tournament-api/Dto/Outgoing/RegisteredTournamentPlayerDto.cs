using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredTournamentPlayerDto : BaseResponse
    {
        public TournamentPlayerDto Data { get; set; }
    }
}