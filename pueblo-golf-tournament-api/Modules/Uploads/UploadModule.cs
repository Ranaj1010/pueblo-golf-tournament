namespace pueblo_golf_tournament_api.Modules.Uploads
{
    public class UploadModule : IUploadModule
    {
        private readonly IConfiguration _configuration;
        public UploadModule(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string UploadImage(IFormFile file, string fileName, string folderName)
        {
            var savedFilePath = Path.Combine(Directory.GetCurrentDirectory(), $"wwwroot/images/{folderName}", fileName);

            using (var stream = new FileStream(savedFilePath, FileMode.Create))
            {
                file.CopyTo(stream);
            }

            return $"/images/{folderName}/{fileName}";
        }
    }
}