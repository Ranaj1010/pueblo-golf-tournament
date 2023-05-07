using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Entities
{
    public class Player : BaseEntity
    {
        public PlayerTypeEnum PlayerType { get; set; }
        public string? WorldHandicapSystemId { get; set; }
        public double Handicap { get; set; }
        public double DivisionId { get; set; }
        public double HomeClubId { get; set; }
        public double TeamId { get; set; }
        public double PersonId { get; set; }
        public virtual Person? Person { get; set; }
        public virtual HomeClub? HomeClub { get; set; }
        public virtual Team? Team { get; set; }
    }
}