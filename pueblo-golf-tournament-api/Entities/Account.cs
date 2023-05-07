using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class Account : BaseEntity
    {
        public string Username { get; set; } = "";
        public string Password { get; set; } = "";
        public long PersonId { get; set; }
        
        public virtual Person? Person { get; set; }
    }
}