namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterPaymentRequestDto
    {
        public long RegistrationId { get; set; }
        public string? PaymentMethod { get; set; }
        public long PaymentChannelAccountId { get; set; }
        public string? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? ReferrenceId { get; set; }
        public IFormFile PaymentReferrencePhoto { get; set; }
    }
}