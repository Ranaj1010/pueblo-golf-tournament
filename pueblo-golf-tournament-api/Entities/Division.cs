using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class Division : BaseEntity
    {
        public string? Name { get; set; }
        public long TournamentId { get; set; }

        
        public virtual Tournament? Tournament { get; set; }
    }
}