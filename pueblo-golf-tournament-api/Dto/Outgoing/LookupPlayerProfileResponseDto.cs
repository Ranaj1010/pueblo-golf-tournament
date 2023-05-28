using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupPlayerProfileResponseDto : BaseResponse
    {
        public PlayerProfile? Profile { get; set; }
    }

    public class PlayerProfile
    {
        public PersonDto? Person { get; set; }
        public PlayerDto? Player { get; set; }
    }

    
}