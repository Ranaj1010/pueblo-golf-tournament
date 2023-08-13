using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Setup;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/setup")]
    public class SetupController : ControllerBase
    {
        private readonly ISetupModule _setupModule;

        public SetupController(ISetupModule setupModule)
        {
            _setupModule = setupModule;
        }

        [HttpPost("tournament/schedules")]
        public async Task<ActionResult<SetupTournamentSchedulesResponseDto>> RegisterPaymentChannelAccount(SetupTournamentSchedulesRequestDto payload)
        {
            var response = await _setupModule.SetupTournamentSchedules(payload);

            return response.Success ? Ok(response) : BadRequest(response);
        }

        [HttpPost("tournament/holes")]
        public async Task<ActionResult<SetupTournamentHolesResponseDto>> SetupTournamentHoles(SetupTournamentHolesRequestDto payload)
        {
            var response = await _setupModule.SetupTournamentHoles(payload);

            return response.Data.Count != 0 ? Ok(response) : BadRequest(response);
        }

        [HttpPost("player/schedules")]
        public async Task<ActionResult<SetupPlayerTeeTimeScheduleResponseDto>> SetupPlayerTournamentSchedules(SetupPlayerTeeTimeScheduleRequestDto payload)
        {
            var response = await _setupModule.SetupPlayerTournamentSchedules(payload);

            return response.Data.Count != 0 ? Ok(response) : BadRequest(response);
        }
    }
}