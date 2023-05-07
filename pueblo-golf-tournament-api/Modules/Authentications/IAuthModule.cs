using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Authentications
{
    public interface IAuthModule
    {
         Task<AuthenticationLoginDto> Login(AuthenticateLoginDto payload);
    }
}