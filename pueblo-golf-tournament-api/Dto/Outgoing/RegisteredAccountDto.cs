using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredAccountDto : BaseResponse
    {
        public RegisteredAccountDataDto? Data { get; set; }
    }

    public class RegisteredAccountDataDto {
        public PersonDto? Person { get; set; }
        public PlayerDto? Player { get; set; }
    }
}