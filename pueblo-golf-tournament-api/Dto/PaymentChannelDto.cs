using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class PaymentChannelDto : BaseDto
    {

        public string Name { get; set; }
        public string Description { get; set; }
    }
}