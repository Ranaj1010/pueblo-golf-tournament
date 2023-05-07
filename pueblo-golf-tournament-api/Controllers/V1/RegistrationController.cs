using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Registrations;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/registration")]
    public class RegistrationController : ControllerBase
    {
        private readonly IRegistrationModule _registrationModule;

        public RegistrationController(IRegistrationModule registrationModule)
        {
            _registrationModule = registrationModule;
        }

        [HttpPost("tournament")]
        public async Task<ActionResult<RegisteredTournamentDto>> RegisterTournament(RegisterTournamentDto payload)
        {
            var response = await _registrationModule.RegisterTournament(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("division")]
        public async Task<ActionResult<RegisteredDivisionDto>> RegisterDivision(RegisterDivisionDto payload)
        {
            var response = await _registrationModule.RegisterDivision(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        
        [HttpPost("homeclub")]
        public async Task<ActionResult<RegisteredHomeClubDto>> RegisterHomeClub(RegisterHomeClubDto payload)
        {
            var response = await _registrationModule.RegisterHomeClub(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        
        [HttpPost("team")]
        public async Task<ActionResult<RegisteredTeamDto>> RegisterTeam(RegisterTeamDto payload)
        {
            var response = await _registrationModule.RegisterTeam(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("acount")]
        public async Task<ActionResult<RegisteredAccountDto>> RegisterTeam(RegisterAccountDto payload)
        {
            var response = await _registrationModule.RegisterAccount(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }

    }
}