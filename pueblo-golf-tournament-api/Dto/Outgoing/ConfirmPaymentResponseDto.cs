using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class ConfirmPaymentResponseDto : BaseResponse
    {
        public PaymentDto Payment { get; set; }
        public RegistrationDto Registration { get; set; }

    }
}