using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentsDto : BaseResponse
    {
        public LookupTournamentsDto()
        {
            Data = new List<TournamentDto>();
        }
        public List<TournamentDto> Data { get; set; }
    }
}