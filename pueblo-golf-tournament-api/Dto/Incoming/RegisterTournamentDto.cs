using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTournamentDto
    {
        [Required]
        public TournamentRawDto? Tournament { get; set; }
    }
}