using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class UploadedTeamLogoDto : BaseResponse
    {
        public string? LogoUrl { get; set; }
        public bool IsUploaded { get; set; }
    }
}