using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterTournamentDto
    {
        public string? Name { get; set; }
        public DateTime StartDate { get; set; }
        public DateTime EndDate { get; set; }
        public string? VenuePlace { get; set; }
        public string? VenueAddress { get; set; }
        public string? VenueCity { get; set; }
        public string? VenueCountry { get; set; }
        public int NumberOfSlots { get; set; }
    }
}