using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Save;
using pueblo_golf_tournament_api.Utilities.Helpers;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/save")]
    public class SaveController : ControllerBase
    {
        private readonly ISaveModule _saveModule;

        public SaveController(ISaveModule saveModule)
        {
            _saveModule = saveModule;
        }

        [HttpPost("player/score")]
        public async Task<ActionResult<SavedTournamentPlayerScoreDto>> RegisterPaymentChannelAccount(SaveTournamentPlayerScoreDto payload)
        {
            var response = await _saveModule.SavedTournamentPlayerScore(payload);

            return response.Data != null ? Ok(response) : BadRequest(response);
        }

        [HttpPost("test/player/score/{par:int}/{stroke:int}")]
        public async Task<ActionResult> RegisterPaymentChannelAccount(int par, int stroke)
        {
            var score = ScoringHelper.GetMolaveScore(par,stroke);

            return Ok(score);
        }
    }
}