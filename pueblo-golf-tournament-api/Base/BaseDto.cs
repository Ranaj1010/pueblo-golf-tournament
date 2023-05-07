using System.ComponentModel.DataAnnotations;

namespace pueblo_golf_tournament_api.Base
{
    public abstract class BaseDto
    {
        [Required]
        public long Id { get; set; }
    }
}