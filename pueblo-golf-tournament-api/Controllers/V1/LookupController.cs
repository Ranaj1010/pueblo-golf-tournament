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
    }
}