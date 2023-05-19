namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegistrationTeamImagesDto
    {
        public double TeamId { get; set; }
        public IFormFile? LogoImageFile { get; set; }
        public IFormFile? PaymentImageFile { get; set; }
    }
}