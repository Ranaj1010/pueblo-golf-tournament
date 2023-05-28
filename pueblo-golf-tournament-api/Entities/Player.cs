using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Entities
{
    public class Player : BaseEntity
    {
        public PlayerTypeEnum PlayerType { get; set; }
        public string? PlayerExternalId { get; set; }
        public string? WorldHandicapSystemId { get; set; }
        public double Handicap { get; set; }
        public string? HomeClub { get; set; }
        public double PersonId { get; set; }
        public virtual Person? Person { get; set; }
    }
}