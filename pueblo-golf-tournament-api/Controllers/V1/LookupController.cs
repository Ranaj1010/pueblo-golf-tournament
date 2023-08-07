using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Lookups;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/lookup")]
    public class LookupController : ControllerBase
    {
        private readonly ILookupModule _lookupModule;

        public LookupController(ILookupModule lookupModule)
        {
            _lookupModule = lookupModule;
        }

        [HttpPost("tournament")]
        public async Task<ActionResult<LookupTournamentsDto>> LookupTournaments(LookupTournamentsRequestDto payload)
        {
            var response = await _lookupModule.LookupTournaments(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
       
        [HttpPost("tournament-details")]
        public async Task<ActionResult<LookupTournamentDetailsResponseDto>> LookupTournamentDetails(LookupTournamentDetailsDto payload)
        {
            var response = await _lookupModule.LookupTournamentDetails(payload);

            return response.Tournament != null ? Ok(response) : BadRequest(response);
        }

        [HttpPost("divisions")]
        public async Task<ActionResult<LookupDivisionsDto>> LookupDivisions(LookupDivisionRequestDto payload)
        {
            var response = await _lookupModule.LookupDivisions(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        
        [HttpPost("homeclubs")]
        public async Task<ActionResult<LookupHomeClubsDto>> LookupHomeClubs()
        {
            var response = await _lookupModule.LookupHomeClubs();

            return response.Data != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("tournament-team")]
        public async Task<ActionResult<LookupTournamentTeamResponseDto>> LookupTournamentTeam(LookupTournamentTeamRequestDto payload)
        {
            var response = await _lookupModule.LookupTournamentTeam(payload.TournamentId, payload.TeamCaptainId);

            return Ok(response);
        }
        [HttpPost("player-profile")]
        public async Task<ActionResult<LookupPlayerProfileResponseDto>> LookupPlayerProfile(LookupPlayerProfileRequestDto payload)
        {
            var response = await _lookupModule.LookupPlayerProfile(payload.PlayerExternalId);

            return Ok(response);
        }
        [HttpPost("player-profile-by-person")]
        public async Task<ActionResult<LookupPlayerProfileResponseDto>> LookupPlayerProfileByPersonId(LookupPlayerProfileByPersonIdRequestDto payload)
        {
            var response = await _lookupModule.LookupPlayerProfileByPersonId(payload.PersonId);

            return Ok(response);
        }
        [HttpPost("payment-channels")]
        public async Task<ActionResult<LookupPaymentChannelsResponseDto>> LookupPaymentChannels(LookupPaymentChannelsRequestDto payload)
        {
            var response = await _lookupModule.LookupPaymentChannels(payload);

            return Ok(response);
        }
        
        [HttpPost("payment-channel-accounts")]
        public async Task<ActionResult<LookupPaymentChannelAccountsResponseDto>> LookupPaymentChannelAccounts(LookupPaymentChannelAccountsRequestDto payload)
        {
            var response = await _lookupModule.LookupPaymentChannelAccounts(payload);

            return Ok(response);
        }
        [HttpPost("tee-time-schedules")]
        public async Task<ActionResult<LookupTeeTimeSchedulesResponseDto>> LookupTeeTimeSchedules(LookupTeeTimeSchedulesRequestDto payload)
        {
            var response = await _lookupModule.LookupTeeTimeSchedules(payload);

            return Ok(response);
        }
        [HttpPost("player-tee-time-schedules")]
        public async Task<ActionResult<LookupPlayerScheduleResponseDto>> LookupPlayerSchedule(LookupPlayerScheduleRequestDto payload)
        {
            var response = await _lookupModule.LookupPlayerSchedule(payload);

            return Ok(response);
        }
        [HttpPost("team-captain-teams")]
        public async Task<ActionResult<LookupTeamsForCaptainResponseDto>> LookupTeamsForCaptain(LookupTeamsForCaptainRequestDto payload)
        {
            var response = await _lookupModule.LookupTeamsForCaptain(payload);

            return Ok(response);
        }
    }
}