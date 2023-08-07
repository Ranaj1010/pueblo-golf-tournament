using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Manage;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/manage")]
    public class ManageController : ControllerBase
    {

        private readonly IManageModule _manageModule;

        public ManageController(IManageModule manageModule)
        {
            _manageModule = manageModule;
        }

        [HttpPost("update/person")]
        public async Task<ActionResult<UpdatePersonResponseDto>> UpdatePerson(UpdatePersonRequestDto dto)
        {
            var updated = await _manageModule.UpdatePerson(dto.Person);

            var response = new UpdatePersonResponseDto
            {
                Data = updated,
                Message = updated != null ? "Person is successfully updated." : "Failed to update info"
            };

            return response != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("update/player")]
        public async Task<ActionResult<UpdatePlayerResponseDto>> UpdatePlayer(UpdatePlayerRequestDto dto)
        {
            var updated = await _manageModule.UpdatePlayer(dto.Player);

            var response = new UpdatePlayerResponseDto
            {
                Data = updated,
                Message = updated != null ? "Player is successfully updated." : "Failed to update info. Please try again."
            };

            return response != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("update/team")]
        public async Task<ActionResult<UpdateTeamResponseDto>> UpdateTeam(UpdateTeamRequestDto dto)
        {
            var updated = await _manageModule.UpdateTeam(dto.Team);

            var response = new UpdateTeamResponseDto
            {
                Data = updated,
                Message = updated != null ? "Team is successfully updated." : "Failed to update info. Please try again."
            };

            return response != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("update/tournament")]
        public async Task<ActionResult<UpdateTournamentResponseDto>> UpdateTournament(UpdateTournamentRequestDto dto)
        {
            var updated = await _manageModule.UpdateTournament(dto.Tournament);

            var response = new UpdateTournamentResponseDto
            {
                Data = updated,
                Message = updated != null ? "Tournament is successfully updated." : "Failed to update info. Please try again."
            };

            return response != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("update/tee-time-schedule")]
        public async Task<ActionResult<UpdateTeeTimeScheduleResponseDto>> UpdateTeeTimeSchedule(UpdateTeeTimeScheduleRequestDto dto)
        {
            var updated = await _manageModule.UpdateTeeTimeSchedule(dto.TeeTimeSchedule);

            if(updated != null){
                Console.WriteLine(updated.Id);
                Console.WriteLine(updated.TournamentId);
                Console.WriteLine(updated.DateTimeSlot.ToString());
                Console.WriteLine(updated.IsSelected);
                Console.WriteLine(updated.IsEnabled);
                Console.WriteLine(updated.IsFull);
            }

            var response = new UpdateTeeTimeScheduleResponseDto
            {
                Data = updated,
                Message = updated != null ? "Tee Time Schedule is successfully updated." : "Failed to update info. Please try again."
            };

            return response != null ? Ok(response) : BadRequest(response);
        }
        [HttpPost("confirm/payment")]
        public async Task<ActionResult<ConfirmPaymentResponseDto>> ConfirmPayment(ConfirmPaymentRequestDto dto)
        {
            var updated = await _manageModule.ConfirmPayment(dto);

            return updated != null ? Ok(updated) : BadRequest(updated);
        }
    }
}