namespace pueblo_golf_tournament_api.Base
{
    public abstract class BaseEntity
    {
        private bool _Active = true;
        private DateTime _CreatedAt = DateTime.UtcNow;
        public long Id { get; set; }
        public bool Active
        {
            get { return _Active; }
            set
            {
                _Active = value;
            }
        }
        public DateTime CreatedAt
        {
            get { return _CreatedAt; }
            set
            {
                _CreatedAt = value;
            }
        }
        public DateTime ArchivedAt { get; set; }
    }
}