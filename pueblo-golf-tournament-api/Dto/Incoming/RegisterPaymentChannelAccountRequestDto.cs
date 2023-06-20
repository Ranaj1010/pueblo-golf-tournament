namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterPaymentChannelAccountRequestDto
    {
        public long PaymentChannelId { get; set; }
        public long TournamentId { get; set; }
        public string AccountName { get; set; }
        public string AccountNumber { get; set; }
    }
}