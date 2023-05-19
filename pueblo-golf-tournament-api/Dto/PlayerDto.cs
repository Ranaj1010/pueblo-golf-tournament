using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto
{
    public class PlayerDto : BaseDto
    {
        public PlayerTypeEnum PlayerType { get; set; }
        public string? WorldHandicapSystemId { get; set; }
        public double Handicap { get; set; }
        public double DivisionId { get; set; }
        public string? HomeClub { get; set; }
        public double TeamId { get; set; }
        public double PersonId { get; set; }
        public virtual PersonDto? Person { get; set; }
        public virtual DivisionDto? Division { get; set; }
        public virtual TeamDto? Team { get; set; }
    }
    
    public class PlayerRawDto
    {
        public string? WorldHandicapSystemId { get; set; }
        public double Handicap { get; set; }
        public string? HomeClub { get; set; }
    }

}