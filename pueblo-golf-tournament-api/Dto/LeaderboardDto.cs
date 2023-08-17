namespace pueblo_golf_tournament_api.Dto
{
    public class LeaderboardDto
    {
        public long TournamentId { get; set; }
        public required TeamDto Team { get; set; }
        public int Score { get; set; }
    }
}