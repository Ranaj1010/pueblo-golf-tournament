using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupPaymentChannelAccountsResponseDto : BaseResponse
    {
        public LookupPaymentChannelAccountsResponseDto()
        {
            Data = new List<PaymentChannelAccountDto>();
        }
        public List<PaymentChannelAccountDto> Data { get; set; }
    }
}