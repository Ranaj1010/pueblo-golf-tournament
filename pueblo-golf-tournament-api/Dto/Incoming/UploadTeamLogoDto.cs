namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class UploadTeamLogoDto
    {
        public double TeamId { get; set; }
        public IFormFile? LogoImageFile { get; set; }
    }
}