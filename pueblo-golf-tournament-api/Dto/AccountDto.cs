using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class AccountDto : BaseDto
    {
        public string? Username { get; set; }
        public string? Password { get; set; }
        public long PersonId { get; set; }

        public virtual PersonDto? Person { get; set; }
    }
    public class AccountRawDto
    {
        public string? Username { get; set; }
        public string? Password { get; set; }
    }
}