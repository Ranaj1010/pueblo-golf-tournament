namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterPaymentRequestDto
    {
        public long RegistrationId { get; set; }
        public string? PaymentMethod { get; set; }
        public IFormFile PaymentReferrencePhoto { get; set; }
        public string? ReferrenceId { get; set; }
    }
}