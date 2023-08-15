using AutoMapper;
using Microsoft.EntityFrameworkCore.Internal;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.PlayerTeeTimeSchedules;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.TeeTimeSchedules;
using pueblo_golf_tournament_api.Services.TournamentHoles;
using pueblo_golf_tournament_api.Services.TournamentPlayers;
using pueblo_golf_tournament_api.Services.Tournaments;

namespace pueblo_golf_tournament_api.Modules.Setup
{
    public class SetupModule : ISetupModule
    {
        private readonly IMapper _mapper;
        private readonly ITeeTimeScheduleService _teeTimeScheduleService;
        private readonly IPlayerTeeTimeScheduleService _iPlayerTeeTimeScheduleService;
        private readonly IRegistrationService _registrationService;
        private readonly IPlayerService _playerService;
        private readonly ITournamentPlayerService _tournamentPlayerService;
        private readonly ITournamentHolesService _tournamentHolesService;
        private readonly ITournamentService _tournamentService;
        public SetupModule(IMapper mapper, ITeeTimeScheduleService teeTimeScheduleService, ITournamentService tournamentService, ITournamentHolesService tournamentHolesService, ITournamentPlayerService tournamentPlayerService, IRegistrationService registrationService, IPlayerService playerService, IPlayerTeeTimeScheduleService iPlayerTeeTimeScheduleService)
        {
            _mapper = mapper;
            _teeTimeScheduleService = teeTimeScheduleService;
            _iPlayerTeeTimeScheduleService = iPlayerTeeTimeScheduleService;
            _registrationService = registrationService;
            _tournamentPlayerService = tournamentPlayerService;
            _tournamentHolesService = tournamentHolesService;
            _playerService = playerService;
            _tournamentService = tournamentService;
        }

        public async Task<SetupPlayerTeeTimeScheduleResponseDto> SetupPlayerTournamentSchedules(SetupPlayerTeeTimeScheduleRequestDto dto)
        {

            var response = new SetupPlayerTeeTimeScheduleResponseDto();

            if (dto.TeeTimeSchedules.Count == 0)
            {
                response.Message = "No schedules were selected. Please try again.";
                return response;
            }

            var tournamentPlayer = await _tournamentPlayerService.GetAsync(player => player.PlayerId == dto.PlayerId && player.TournamentId == dto.TournamentId);

            var playerTeeTimeSchedules = new List<PlayerTeeTimeSchedule>();

            foreach (var teeTimeSchedule in dto.TeeTimeSchedules)
            {
                var plottedSchedules = await _iPlayerTeeTimeScheduleService.ListAsync(schedule => schedule.TeeTimeScheduleId == teeTimeSchedule.TeeTimeSchedule.Id);

                if (plottedSchedules.Count == 8)
                {
                    response.Message = $"Schedule for {teeTimeSchedule.TeeTimeSchedule.DateTimeSlot.ToShortDateString()} at {teeTimeSchedule.TeeTimeSchedule.DateTimeSlot.ToShortTimeString()} is already full.";
                    return response;
                }

                var playersInSchedule = plottedSchedules.Join(await _tournamentPlayerService.ListAsync(s => s.TournamentId == tournamentPlayer.TournamentId), plotted => plotted.PlayerId, player => player.PlayerId, (plotted, player) => player)
                                                        .Where(player => player.TeamId == tournamentPlayer.TeamId)
                                                        .ToList();
                if (playersInSchedule.Count == 2)
                {
                    response.Message = $"Schedule for {teeTimeSchedule.TeeTimeSchedule.DateTimeSlot.ToShortDateString()} at {teeTimeSchedule.TeeTimeSchedule.DateTimeSlot.ToShortTimeString()} is already taken by your team mates.";
                    return response;
                }
            }

            foreach (var teeTimeSchedule in dto.TeeTimeSchedules)
            {
                playerTeeTimeSchedules.Add(new PlayerTeeTimeSchedule
                {
                    TeeTimeScheduleId = teeTimeSchedule.TeeTimeSchedule.Id,
                    PlayerId = dto.PlayerId,
                    HoleType = teeTimeSchedule.HoleType,
                });
            }

            var data = await _iPlayerTeeTimeScheduleService.AddRangeAsync(playerTeeTimeSchedules);

            response.Data = _mapper.Map<List<PlayerTeeTimeScheduleDto>>(data);
            response.Message = "Successfully created tee time schedules.";

            return response;
        }

        public async Task<SetupTournamentHolesResponseDto> SetupTournamentHoles(SetupTournamentHolesRequestDto dto)
        {
            var response = new SetupTournamentHolesResponseDto();


            if (dto.Holes.Count != 18)
            {
                response.Message = "Invalid Hole count. Holes length must be 18.";

                return response;
            }

            foreach (var hole in dto.Holes)
            {
                if (hole.MaximumStrokes == 0)
                {
                    response.Message = $"Invalid maximum stroke count for hole {hole.HoleNumber}.";

                    return response;
                }
            }

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == dto.TournamentId);

            if (tournament == null)
            {
                response.Message = $"Tournament not found.";

                return response;
            }

            var holes = new List<TournamentHole>();

            foreach (var hole in dto.Holes)
            {
                holes.Add(new TournamentHole
                {
                    HoleNumber = hole.HoleNumber,
                    MaximumStrokes = hole.MaximumStrokes,
                    TournamentId = dto.TournamentId
                });
            }

            var data = await _tournamentHolesService.AddRangeAsync(holes);

            response.Data = _mapper.Map<List<TournamentHoleDto>>(data);
            
            response.Message = $"Holes are successfully created.";

            return response;
        }

        public async Task<SetupTournamentSchedulesResponseDto> SetupTournamentSchedules(SetupTournamentSchedulesRequestDto dto)
        {
            var response = new SetupTournamentSchedulesResponseDto();

            var teeTimeSchedules = new List<TeeTimeSchedule>();

            foreach (var schedule in dto.Schedules)
            {
                foreach (var time in schedule.TimeSeries)
                {
                    teeTimeSchedules.Add(new TeeTimeSchedule
                    {
                        TournamentId = dto.TournamentId,
                        DateTimeSlot = time.TimeSeriesSlot,
                        IsSelected = time.IsSelected,
                        IsFull = false,
                        IsEnabled = time.IsEnabled,
                        Active = true
                    });
                }
            }

            var data = await _teeTimeScheduleService.AddRangeAsync(teeTimeSchedules);

            if (data.Count > 0)
            {
                response.Message = "Schedules are now available to be book by the players.";
                response.Success = true;
            }

            if (data.Count == 0)
            {
                response.Message = "No Schedules added. Please try again.";
                response.Success = false;
            }

            return response;
        }
    }
}