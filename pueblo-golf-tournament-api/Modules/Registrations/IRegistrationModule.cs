using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Registrations
{
    public interface IRegistrationModule
    {
        Task<RegisteredTournamentDto> RegisterTournament(RegisterTournamentDto payload);
        Task<RegisteredDivisionDto> RegisterDivision(RegisterDivisionDto payload);
        Task<RegisteredTeamDto> RegisterTeam(RegisterTeamDto payload);
        Task<RegisteredAccountDto> RegisterAccount(RegisterAccountDto payload);
        Task<RegisteredHomeClubDto> RegisterHomeClub(RegisterHomeClubDto payload);
    }
}