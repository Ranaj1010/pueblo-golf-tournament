using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Uploads;
using pueblo_golf_tournament_api.Services.Payments;
using pueblo_golf_tournament_api.Services.Teams;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/upload")]
    public class UploadController : ControllerBase
    {
        private readonly IUploadModule _uploadModule;
        private readonly ITeamService _teamService;
        private readonly IPaymentService _paymentService;

        public UploadController(IUploadModule uploadModule, ITeamService teamService, IPaymentService paymentService)
        {
            _uploadModule = uploadModule;
            _paymentService = paymentService;
            _teamService = teamService;
        }

        [HttpPost("team-logo")]
        public async Task<ActionResult<UploadedTeamLogoDto>> UploadTeamLogo([FromForm] UploadTeamLogoDto payload)
        {
            var response = new UploadedTeamLogoDto();

            var team = await _teamService.GetAsync(team => team.Id == payload.TeamId);

            if (team == null)
            {
                response = new UploadedTeamLogoDto
                {
                    LogoUrl = "",
                    Message = "Failed to upload Team Logo. Team not found."
                };

                return BadRequest(response);
            }

            if (payload.LogoImageFile == null)
            {
                response = new UploadedTeamLogoDto
                {
                    LogoUrl = "",
                    Message = "Failed to upload Team Logo. Image not found."
                };

                return BadRequest(response);
            }

            team.LogoUrl = _uploadModule.UploadImage(payload.LogoImageFile!, payload.LogoImageFile!.FileName,"logo");

            var updatedTeam = await _teamService.UpdateAsync(team);

            response = new UploadedTeamLogoDto
            {
                LogoUrl = team.LogoUrl,
                Message = updatedTeam ? "Team Logo uploaded successfully." : "Failed to upload team logo"
            };

            return updatedTeam ? Ok() : BadRequest();
        }

        [HttpPost("proof-of-payment")]
        public async Task<ActionResult<UploadedProofOfPaymentDto>> UploadProofOfPayment([FromForm] UploadProofOfPaymentDto payload)
        {
            var response = new UploadedProofOfPaymentDto();

            var payment = await _paymentService.GetAsync(payment => payment.Id == payload.PaymentId);

            if (payment == null)
            {
                response = new UploadedProofOfPaymentDto
                {
                    PaymentImageUrl = "",
                    Message = "Failed to upload Proof of Payment. Payment Referrence not found."
                };

                return BadRequest(response);
            }

            if (payload.PaymentImage == null)
            {
                response = new UploadedProofOfPaymentDto
                {
                    PaymentImageUrl = "",
                    Message = "Failed to upload Proof of Payment. Image not found."
                };

                return BadRequest(response);
            }

            payment!.PaymentReferrencePhoto = _uploadModule.UploadImage(payload.PaymentImage!, payload.PaymentImage!.FileName,"payments");

            var updatedPayment = await _paymentService.UpdateAsync(payment);

            response = new UploadedProofOfPaymentDto
            {
                PaymentImageUrl = payment.PaymentReferrencePhoto,
                Message = updatedPayment ? "Proof of Payment uploaded successfully." : "Failed to upload Proof of Payment."
            };

            return updatedPayment ? Ok(response) : BadRequest(response);
        }
    }
}