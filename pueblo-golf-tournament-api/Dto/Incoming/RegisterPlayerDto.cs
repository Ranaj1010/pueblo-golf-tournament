using System.ComponentModel.DataAnnotations;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class RegisterPlayerDto
    {
        public PersonRawDto? PersonalDetails { get; set; }
        public PlayerRawDto? PlayerDetails { get; set; }
    }
}