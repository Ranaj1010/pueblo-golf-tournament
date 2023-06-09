using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class Payment : BaseEntity
    {
        public string? PaymentMethod { get; set; }
        public long PaymentChannelAccountId { get; set; }
        public string? PaymentReferrencePhoto { get; set; }
        public string? AccountNumber { get; set; }
        public string? AccountName { get; set; }
        public string? ReferrenceId { get; set; }
        public DateTime PaymentDate  { get; set; }
    }
}