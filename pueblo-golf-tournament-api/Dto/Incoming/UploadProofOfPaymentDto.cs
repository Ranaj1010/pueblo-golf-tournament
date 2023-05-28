namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class UploadProofOfPaymentDto
    {
        public double PaymentId { get; set; }
        public IFormFile? PaymentImage { get; set; }
    }
}