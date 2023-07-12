using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class Tournament : BaseEntity
    {
        public string? Name { get; set; }
        public string? BannerPhoto { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public double RegistrationFee { get; set; }
        public string? VenuePlace { get; set; }
        public string? VenueAddress { get; set; }
        public string? VenueCity { get; set; }
        public string? VenueCountry { get; set; }
        public int NumberOfSlots { get; set; }
        public string? NameOfTournamentSupport { get; set; }
        public string? ContactNumberOfTournamentSupport { get; set; }

    }
}