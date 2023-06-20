using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto
{
    public class PaymentChannelAccountDto : BaseDto
    {
        public long PaymentChannelId { get; set; }
        public long? TournamentId { get; set; }
        public string? AccountName { get; set; }
        public string? AccountNumber { get; set; }
        public virtual PaymentChannelDto? PaymentChannel { get; set; }
    }
}