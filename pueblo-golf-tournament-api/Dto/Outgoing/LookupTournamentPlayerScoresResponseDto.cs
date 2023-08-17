using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentPlayerScoresResponseDto : BaseResponse
    {
        public List<TournamentPlayerScoreDto> Data { get; set; } = new List<TournamentPlayerScoreDto>();
    }
}