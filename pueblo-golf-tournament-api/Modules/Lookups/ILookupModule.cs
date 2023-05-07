using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Lookups
{
    public interface ILookupModule
    {
        Task<LookupTournamentsDto> LookupTournaments();
        Task<LookupDivisionsDto> LookupDivisions();
        Task<LookupHomeClubsDto> LookupHomeClubs();
    }
}