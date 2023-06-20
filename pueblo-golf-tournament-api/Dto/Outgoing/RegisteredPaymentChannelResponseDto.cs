using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredPaymentChannelResponseDto : BaseResponse
    {
        public PaymentChannelDto? Data { get; set; }
    }
}