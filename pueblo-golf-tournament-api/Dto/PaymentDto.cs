using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class PaymentDto : BaseDto
    {
        public string? PaymentMethod { get; set; }
        public string? PaymentReferrencePhoto { get; set; }
        public string? ReferrenceId { get; set; }
        public DateTime PaymentDate { get; set; }
    }

    public class PaymentRawDto  {
        public string? PaymentMethod { get; set; }
        public string? ReferrenceId { get; set; }
        public DateTime PaymentDate { get; set; }
    }
}