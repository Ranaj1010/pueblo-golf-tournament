using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Lookups
{
    public interface ILookupModule
    {
        Task<LookupTournamentsDto> LookupTournaments(LookupTournamentsRequestDto payload);
        Task<LookupDivisionsDto> LookupDivisions(LookupDivisionRequestDto payload);
        Task<LookupHomeClubsDto> LookupHomeClubs();
        Task<LookupTournamentTeamResponseDto> LookupTournamentTeam(long tournamentId, long teamCaptainId);
    }
}