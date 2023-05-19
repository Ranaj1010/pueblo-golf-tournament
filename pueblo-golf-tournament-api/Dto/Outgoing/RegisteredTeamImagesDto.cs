using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredTeamImagesDto : BaseResponse
    {
        public String? PaymentImageUrl { get; set; }
        public String? LogoImageUrl { get; set; }
    }
}