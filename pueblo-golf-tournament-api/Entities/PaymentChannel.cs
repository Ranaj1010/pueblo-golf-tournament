using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Entities
{
    public class PaymentChannel : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
    }
}