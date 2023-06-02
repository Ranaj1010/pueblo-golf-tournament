using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredPaymentResponseDto : BaseResponse
    {
        public PaymentDto Data { get; set; }
    }
}