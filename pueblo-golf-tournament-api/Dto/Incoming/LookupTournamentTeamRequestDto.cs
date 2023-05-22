namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class LookupTournamentTeamRequestDto
    {
        public long TournamentId { get; set; }
        public long TeamCaptainId { get; set; }
    }
}