using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredPlayerDto : BaseResponse
    {
        public PlayerProfile? PlayerProfile { get; set; }
    }
}