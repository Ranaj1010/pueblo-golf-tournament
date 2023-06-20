using Microsoft.AspNetCore.Mvc.RazorPages.Infrastructure;
using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class PaymentChannelAccount : BaseEntity
    {
        public long PaymentChannelId { get; set; }
        public long TournamentId { get; set; }
        public string AccountName { get; set; }
        public string AccountNumber { get; set; }
        public virtual PaymentChannel? PaymentChannel { get; set; }

    }
}