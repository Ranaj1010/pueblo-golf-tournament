using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class SavedTournamentPlayerScoreDto : BaseResponse
    {
        public TournamentPlayerScoreDto Data { get; set; }
    }
}