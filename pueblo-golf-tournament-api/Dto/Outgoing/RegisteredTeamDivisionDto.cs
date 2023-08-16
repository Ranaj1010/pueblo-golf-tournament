using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredTeamDivisionDto : BaseResponse
    {
        public TournamentTeamDivisionDto? Data { get; set; }
    }
}