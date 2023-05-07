using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterDivisionDto
    {
        [Required]
        public string? Name { get; set; }
        public long TournamentId { get; set; }
    }
}