using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupHomeClubsDto : BaseResponse
    {
        public LookupHomeClubsDto()
        {
            Data = new List<HomeClubDto>();
        }
        public List<HomeClubDto> Data { get; set; }
    }
}