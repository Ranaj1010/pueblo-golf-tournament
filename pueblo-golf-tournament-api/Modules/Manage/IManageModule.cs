using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Manage
{
    public interface IManageModule
    {
        Task<PersonDto> UpdatePerson(PersonDto person);
        Task<PlayerDto> UpdatePlayer(PlayerDto player);
        Task<TeamDto> UpdateTeam(TeamDto team);
        Task<TournamentDto> UpdateTournament(TournamentDto tournament);
        Task<TeeTimeScheduleDto> UpdateTeeTimeSchedule(TeeTimeScheduleDto tournament);
        Task<ConfirmPaymentResponseDto> ConfirmPayment(ConfirmPaymentRequestDto payment);
    }
}