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
        Task<RegisteredAccountDto> RegisterAdminAccount(RegisterAccountDto payload);
        Task<RegisteredPersonDto> RegisterPerson(RegisterPersonDto payload);
        Task<RegisteredPlayerDto> RegisterPlayer(RegisterPlayerDto payload);
        Task<RegisteredHomeClubDto> RegisterHomeClub(RegisterHomeClubDto payload);
        Task<RegisteredTeamImagesDto> RegisterTeamsImages(RegistrationTeamImagesDto payload);
    }
}