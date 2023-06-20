using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredPaymentChannelAccountResponseDto : BaseResponse
    {
        public PaymentChannelAccountDto? Data { get; set; }
    }
}