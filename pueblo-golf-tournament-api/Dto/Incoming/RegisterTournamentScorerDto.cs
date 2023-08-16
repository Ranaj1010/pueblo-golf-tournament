using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTournamentScorerDto
    {
        [Required]
        public long TournamentId { get; set; }
        [Required]
        public long ScorerId { get; set; }
        
    }
}