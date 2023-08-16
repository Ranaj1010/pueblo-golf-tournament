using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredScorerDto : BaseResponse
    {
        public ScorerData? Data { get; set; }
    }
    public class ScorerData {
        public required ScorerDto Scorer { get; set; }
        public required PersonDto Person { get; set; }
    }
}