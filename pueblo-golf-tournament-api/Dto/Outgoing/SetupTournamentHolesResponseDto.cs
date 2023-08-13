using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class SetupTournamentHolesResponseDto : BaseResponse
    {
        public List<TournamentHoleDto> Data { get; set; }
    }
}