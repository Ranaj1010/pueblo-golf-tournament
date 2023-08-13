using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Setup
{
    public interface ISetupModule
    {
        Task<SetupTournamentSchedulesResponseDto> SetupTournamentSchedules(SetupTournamentSchedulesRequestDto dto);
        Task<SetupPlayerTeeTimeScheduleResponseDto> SetupPlayerTournamentSchedules(SetupPlayerTeeTimeScheduleRequestDto dto);
        Task<SetupTournamentHolesResponseDto> SetupTournamentHoles(SetupTournamentHolesRequestDto dto);
    }
}