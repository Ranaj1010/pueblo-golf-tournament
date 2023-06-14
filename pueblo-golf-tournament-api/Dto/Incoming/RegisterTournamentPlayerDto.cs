namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTournamentPlayerDto
    {
        public long PlayerId { get; set; }
        public long RegistrationId { get; set; }
        public long TeamId { get; set; }
        public long TournamentId { get; set; }

    }
}