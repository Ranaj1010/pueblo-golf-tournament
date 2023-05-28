using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentDetailsResponseDto : BaseResponse
    {
        public TournamentDto? Tournament { get; set; }
        public List<TeamDto>? Teams { get; set; }
        public int PlayersCount { get; set; }
        public int TeamsCount { get; set; }
    }
}