using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredDivisionDto : BaseResponse
    {
        public DivisionDto? Data { get; set; }
    }
}