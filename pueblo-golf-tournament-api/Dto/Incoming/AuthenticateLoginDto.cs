using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class AuthenticateLoginDto
    {
        [Required]
        public string Username { get; set; } = "";
        [Required]
        public string Password { get; set; } = "";
    }
}