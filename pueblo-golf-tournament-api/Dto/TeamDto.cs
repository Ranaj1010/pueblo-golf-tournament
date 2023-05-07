using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class TeamDto : BaseDto
    {
        public string? Name { get; set; }
        public string? LogoUrl { get; set; }
    }
    public class TeamRawDto
    {
        public string? Name { get; set; }
        public string? LogoUrl { get; set; }
    }
}