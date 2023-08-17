using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Modules.Lookups
{
    public interface ILookupModule
    {
        Task<LookupTournamentsDto> LookupTournaments(LookupTournamentsRequestDto payload);
        Task<LookupDivisionsDto> LookupDivisions(LookupDivisionRequestDto payload);
        Task<LookupHomeClubsDto> LookupHomeClubs();
        Task<LookupPlayerProfileResponseDto> LookupPlayerProfile(String playerExternalId);
        Task<LookupPlayerProfileResponseDto> LookupPlayerProfileByPersonId(long personId);
        Task<LookupTournamentTeamResponseDto> LookupTournamentTeam(long tournamentId, long teamCaptainId);
        Task<LookupTournamentDetailsResponseDto> LookupTournamentDetails(LookupTournamentDetailsDto payload);
        Task<LookupPaymentChannelsResponseDto> LookupPaymentChannels(LookupPaymentChannelsRequestDto payload);
        Task<LookupPaymentChannelAccountsResponseDto> LookupPaymentChannelAccounts(LookupPaymentChannelAccountsRequestDto payload);
        Task<LookupTeeTimeSchedulesResponseDto> LookupTeeTimeSchedules(LookupTeeTimeSchedulesRequestDto payload);
        Task<LookupTeamsForCaptainResponseDto> LookupTeamsForCaptain(LookupTeamsForCaptainRequestDto payload);
        Task<LookupPlayerScheduleResponseDto> LookupPlayerSchedule(LookupPlayerScheduleRequestDto payload);
        Task<LookupTournamentHolesResponseDto> LookupTournamentHoles(long tournamentId);
        Task<LookupScorerProfilesResponseDto> LookupScorerProfiles(LookupScorerProfilesRequestDto payload);
        Task<LookupTournamentPlayerScoresResponseDto> LookupTournamentPlayerScorers(LookupTournamentPlayerScoresRequestDto payload);

    }
}