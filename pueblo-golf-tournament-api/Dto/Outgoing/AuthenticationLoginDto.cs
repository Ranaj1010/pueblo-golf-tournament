using pueblo_golf_tournament_api.Base;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class AuthenticationLoginDto : BaseResponse
    {
        public AuthenticationLoginDto()
        {
            Data = new AuthenticatedUserData();
        }
        public bool Authenticated { get; set; } = false;
        public AuthenticatedUserData Data { get; set; }
    }
    public class AuthenticatedUserData
    {
        public PersonDto PersonalDetails { get; set; }
        public PlayerDto PlayerDetails { get; set; }
        public string Username { get; set; } = "";
    }
}