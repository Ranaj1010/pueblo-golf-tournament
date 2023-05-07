using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterAccountDto
    {
        [Required]
        public PersonRawDto? Person { get; set; }
        [Required]
        public AccountRawDto? Account { get; set; }
    }
}