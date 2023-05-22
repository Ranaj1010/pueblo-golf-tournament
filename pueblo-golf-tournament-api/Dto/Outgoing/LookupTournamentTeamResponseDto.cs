using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentTeamResponseDto : BaseResponse
    {
        public long TournamentId { get; set; }
        public TournamentDto Tournament { get; set; }
        public RegistrationDto? Registration { get; set; }
        public TeamDto? Team { get; set; }
        public DivisionDto? Division { get; set; }
    }


}