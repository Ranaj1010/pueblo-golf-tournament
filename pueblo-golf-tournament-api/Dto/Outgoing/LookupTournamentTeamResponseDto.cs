using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentTeamResponseDto : BaseResponse
    {
        public LookupTournamentTeamResponseDto()
        {
            RegisteredTeams = new List<RegisteredTeam>();
        }
        public long TournamentId { get; set; }
        public TournamentDto Tournament { get; set; }
        public List<RegisteredTeam> RegisteredTeams { get; set; }
    }

    public class RegisteredTeam
    {
        public RegistrationDto? Registration { get; set; }
        public PaymentDto? Payment { get; set; }
        public TeamDto? Team { get; set; }
        public DivisionDto? Division { get; set; }
        public PlayerProfile CaptainProfile { get; set; }
        public List<PlayerProfile> MemberProfiles { get; set; }
    }

  

}