using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterHomeClubDto
    {
        [Required]
        public string? Name { get; set; }
        [Required]
        public string? Address { get; set; }
        [Required]
        public string? City { get; set; }
        public string? Province { get; set; }
        public string? Country { get; set; }
    }
}