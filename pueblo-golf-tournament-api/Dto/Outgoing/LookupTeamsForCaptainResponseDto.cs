using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTeamsForCaptainResponseDto : BaseResponse
    {
        public List<TeamForCaptainData> Teams { get; set; } = new List<TeamForCaptainData>();
    }

    public class TeamForCaptainData
    {
        public List<TeamCaptainsTournament> Tournaments { get; set; } = new List<TeamCaptainsTournament>();
    }

    public class TeamCaptainsTournament
    {
        public required TournamentDto Tournament { get; set; }
        public List<TeamCaptainsTeam> Teams { get; set; } = new List<TeamCaptainsTeam>();

    }

    public class TeamCaptainsTeam
    {
        public required TeamDto Team { get; set; }
        public required RegistrationDto Registration { get; set; }
        public List<PlayerProfile> Members { get; set; } = new List<PlayerProfile>();

    }


}