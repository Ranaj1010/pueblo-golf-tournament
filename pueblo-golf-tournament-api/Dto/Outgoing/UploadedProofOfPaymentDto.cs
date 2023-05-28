using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class UploadedProofOfPaymentDto : BaseResponse
    {
        public string? PaymentImageUrl { get; set; }
        public bool IsUploaded { get; set; }
    }
}