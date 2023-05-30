using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Entities
{
    public class Registration : BaseEntity
    {
        public long? TeamId { get; set; }
        public long TeamCaptainId { get; set; }
        public long? TournamentId { get; set; }
        public RegistrationStatusEnum Status { get; set; }
        public DateTime RegistrationDate { get; set; }
        public bool IsPayed { get; set; }
        public long? PaymentId { get; set; }
    }
}