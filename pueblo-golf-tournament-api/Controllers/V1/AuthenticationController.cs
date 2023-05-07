
using Microsoft.AspNetCore.Mvc;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Modules.Authentications;

namespace pueblo_golf_tournament_api.Controllers.V1
{
    [ApiController]
    [ApiVersion("1.0")]
    [Route("api/v{version:apiVersion}/authentication")]
    public class AuthenticationController : ControllerBase
    {
        private readonly IAuthModule _authModule;
        public AuthenticationController(IAuthModule authModule)
        {
            _authModule = authModule;
        }

        [HttpPost("login")]
        public async Task<ActionResult<AuthenticationLoginDto>> Login(AuthenticateLoginDto payload)
        {
            var response = await _authModule.Login(payload);

            return response.Authenticated ? Ok(response) : BadRequest(response);
        }
    }
}