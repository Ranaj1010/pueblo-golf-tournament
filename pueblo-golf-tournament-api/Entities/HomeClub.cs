using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class HomeClub : BaseEntity
    {
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? Province { get; set; }
        public string? Country { get; set; }
    }
}