namespace pueblo_golf_tournament_api.Modules.Uploads
{
    public interface IUploadModule
    {
        string UploadImage(IFormFile file, string fileName, string folderName);
    }
}