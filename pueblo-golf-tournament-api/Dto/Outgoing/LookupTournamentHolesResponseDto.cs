using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class LookupTournamentHolesResponseDto : BaseResponse
    {
        public long TournamentId { get; set; }
        public List<TournamentHoleDto> Data { get; set; }
    }
}