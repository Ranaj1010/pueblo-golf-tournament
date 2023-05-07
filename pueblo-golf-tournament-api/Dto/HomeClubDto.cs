using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class HomeClubDto : BaseDto
    {
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? Province { get; set; }
        public string? Country { get; set; }
    }
    public class HomeClubRawDto
    {
        public string? Name { get; set; }
        public string? Address { get; set; }
        public string? City { get; set; }
        public string? Province { get; set; }
        public string? Country { get; set; }
    }
}