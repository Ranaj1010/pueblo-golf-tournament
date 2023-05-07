using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class RegisteredHomeClubDto : BaseResponse
    {
        public HomeClubDto? Data { get; set; }
    }
}