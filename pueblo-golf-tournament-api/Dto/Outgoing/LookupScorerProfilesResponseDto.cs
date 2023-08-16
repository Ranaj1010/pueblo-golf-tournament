using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupScorerProfilesResponseDto : BaseResponse
    {
        public List<ScorerProfile> Data { get; set; } = new List<ScorerProfile>();
    }
    public class ScorerProfile
    {
        public PersonDto? Person { get; set; }
        public ScorerDto? Scorer { get; set; }
    }

}