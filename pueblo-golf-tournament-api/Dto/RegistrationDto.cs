using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto
{
    public class RegistrationDto : BaseDto
    {
        public long? TeamId { get; set; }
        public long TeamCaptainId { get; set; }
        public long? TournamentId { get; set; }
        public long? DivisionId { get; set; }
        public RegistrationStatusEnum Status { get; set; }
        public DateTime RegistrationDate { get; set; }
        public long? PaymentId { get; set; }
        public virtual Payment? Payment { get; set; }
    }
    public class RegistrationRawDto
    {
        public long? TeamId { get; set; }
        public long TeamCaptainId { get; set; }
        public long? TournamentId { get; set; }
        public long? DivisionId { get; set; }
        public RegistrationStatusEnum Status { get; set; }
        public DateTime RegistrationDate { get; set; }
    }
}