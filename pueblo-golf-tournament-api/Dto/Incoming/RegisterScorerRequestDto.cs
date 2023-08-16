using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterScorerRequestDto
    {
        [Required]
        public RegisterPersonDto? Person { get; set; }
        public AccountRawDto? Account { get; set; }
    }
}