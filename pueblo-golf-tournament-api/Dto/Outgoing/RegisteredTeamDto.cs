using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredTeamDto : BaseResponse
    {
        public RegisteredTeamDto()
        {
            Data = new RegisteredTeamDataDto();
        }
        public RegisteredTeamDataDto? Data { get; set; }
    }
    public class RegisteredTeamDataDto
    {
        public RegisteredTeamDataDto()
        {
            Team = new TeamDto();
            TeamCaptain = new PlayerDto();
            Members = new List<PlayerDto>();
            Registration = new RegistrationDto();
        }
        public RegistrationDto Registration { get; set; }
        public TeamDto Team { get; set; }
        public PlayerDto TeamCaptain { get; set; }
        public List<PlayerDto> Members { get; set; }
    }
}