using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupPaymentChannelsResponseDto : BaseResponse
    {
        public LookupPaymentChannelsResponseDto()
        {
            Data = new List<PaymentChannelDto>();
        }
        
        public List<PaymentChannelDto> Data { get; set; }
    }
}