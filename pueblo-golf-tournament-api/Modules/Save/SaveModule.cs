using AutoMapper;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Modules.Monitor;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.PlayerTeeTimeSchedules;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TournamentHoles;
using pueblo_golf_tournament_api.Services.TournamentPlayerScores;
using pueblo_golf_tournament_api.Services.Tournaments;
using pueblo_golf_tournament_api.Utilities.Helpers;

namespace pueblo_golf_tournament_api.Modules.Save
{
    public class SaveModule : ISaveModule
    {
        private readonly ITournamentPlayerScoreService _tournamentPlayerScoreService;
        private readonly ITournamentService _tournamentService;
        private readonly IPlayerService _playerService;
        private readonly IRegistrationService _registrationService;
        private readonly ITeamService _teamService;
        private readonly ITournamentHolesService _tournamentHoleService;
        private readonly IPlayerTeeTimeScheduleService _playerTeeTimeScheduleService;
        private readonly IMonitorModule _monitorModule;
        private readonly IMapper _mapper;
        public SaveModule(IMapper mapper, IMonitorModule monitorModule, ITournamentPlayerScoreService tournamentPlayerScoreService, IPlayerTeeTimeScheduleService playerTeeTimeScheduleService, ITournamentService tournamentService, IPlayerService playerService, IRegistrationService registrationService, ITeamService teamService, ITournamentHolesService tournamentHoleService)
        {
            _tournamentPlayerScoreService = tournamentPlayerScoreService;
            _tournamentService = tournamentService;
            _playerService = playerService;
            _registrationService = registrationService;
            _teamService = teamService;
            _mapper = mapper;
            _tournamentHoleService = tournamentHoleService;
            _playerTeeTimeScheduleService = playerTeeTimeScheduleService;
            _monitorModule = monitorModule;
        }
        public async Task<SavedTournamentPlayerScoreDto> SavedTournamentPlayerScore(SaveTournamentPlayerScoreDto payload)
        {
            var response = new SavedTournamentPlayerScoreDto();

            var player = await _playerService.GetAsync(player => player.Id == payload.PlayerId);

            if (player == null)
            {
                response.Message = "Invalid Request. Player not found.";
                return response;
            }

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == payload.TournamentId);

            if (tournament == null)
            {
                response.Message = "Invalid Request. Tournament not found.";
                return response;
            }

            var registration = await _registrationService.GetAsync(registration => registration.Id == payload.RegistrationId);

            if (registration == null)
            {
                response.Message = "Invalid Request. Registration not found.";
                return response;
            }

            var tournamentHole = await _tournamentHoleService.GetAsync(hole=> hole.Id == payload.TournamentHoleId);

            if (tournamentHole == null)
            {
                response.Message = "Invalid Request. Hole not found.";
                return response;
            }

            var molaveScore = ScoringHelper.GetMolaveScore(tournamentHole.MaximumStrokes, payload.ActualStrokes);
            
            var playerTeeTimeSchedule = await _playerTeeTimeScheduleService.GetAsync(schedule => schedule.TeeTimeScheduleId == payload.TeeTimeScheduleId && schedule.PlayerId == payload.PlayerId);

            var playerScore = await _tournamentPlayerScoreService.AddAsync(new TournamentPlayerScore
            {
                PlayerId = payload.PlayerId,
                TournamentId = payload.TournamentId,
                ActualStrokes = payload.ActualStrokes,
                MolaveScore = molaveScore,
                ScorerId = payload.ScorerId,
                RegistrationId = payload.RegistrationId,
                TeamId = payload.TeamId,
                TournamentHoleId = payload.TournamentHoleId,
                PlayerTeeTimeScheduleId = playerTeeTimeSchedule.Id,
            });

            response.Data = _mapper.Map<TournamentPlayerScoreDto>(playerScore);
            response.Message = "Score was successfully saved.";

            await _monitorModule.MonitorLeaderBoard(tournament.Id);

            return response;
        }
    }
}