namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTeamDivisionDto
    {
        public long TournamentId { get; set; }
        public long TeamId { get; set; }
        public long DivisionId { get; set; }
    }
}