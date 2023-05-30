using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class Team : BaseEntity
    {
        public string? Name { get; set; }
        public string? LogoUrl { get; set; }
        public string? DefaultBackgroundColor { get; set; }
        public long TeamCaptainId { get; set; }
    }
}