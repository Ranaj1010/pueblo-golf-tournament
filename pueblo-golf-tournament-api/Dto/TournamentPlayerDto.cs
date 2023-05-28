using Microsoft.AspNetCore.Mvc.RazorPages.Infrastructure;
using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto
{
    public class TournamentPlayerDto : BaseDto
    {
        public long RegistrationId { get; set; }
        public long TournamentId { get; set; }
        public long TeamId { get; set; }
        public long DivisionId { get; set; }
        public long PlayerId { get; set; }
        public PlayerTypeEnum PlayerType { get; set; }
    }
}