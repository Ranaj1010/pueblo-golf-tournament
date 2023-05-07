using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredAccountDto : BaseResponse
    {
        public PersonDto? Data { get; set; }
    }
}