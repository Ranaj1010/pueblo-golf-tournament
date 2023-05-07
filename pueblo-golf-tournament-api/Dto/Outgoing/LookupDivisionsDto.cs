using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupDivisionsDto : BaseResponse
    {
        public LookupDivisionsDto()
        {
            Data = new List<DivisionDto>();
        }
        public List<DivisionDto> Data { get; set; }
    }
}