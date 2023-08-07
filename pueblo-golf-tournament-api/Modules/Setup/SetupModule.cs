using AutoMapper;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.PlayerTeeTimeSchedules;
using pueblo_golf_tournament_api.Services.TeeTimeSchedules;

namespace pueblo_golf_tournament_api.Modules.Setup
{
    public class SetupModule : ISetupModule
    {
        private readonly IMapper _mapper;
        private readonly ITeeTimeScheduleService _teeTimeScheduleService;
        private readonly IPlayerTeeTimeScheduleService _iPlayerTeeTimeScheduleService;
        public SetupModule(IMapper mapper, ITeeTimeScheduleService teeTimeScheduleService, IPlayerTeeTimeScheduleService iPlayerTeeTimeScheduleService)
        {
            _mapper = mapper;
            _teeTimeScheduleService = teeTimeScheduleService;
            _iPlayerTeeTimeScheduleService = iPlayerTeeTimeScheduleService;
        }

        public async Task<SetupPlayerTeeTimeScheduleResponseDto> SetupPlayerTournamentSchedules(SetupPlayerTeeTimeScheduleRequestDto dto)
        {
            var response = new SetupPlayerTeeTimeScheduleResponseDto();

            var playerTeeTimeSchedules = new List<PlayerTeeTimeSchedule>();
            var availableSlots = new List<TeeTimeSchedule>();
            var unavailableSlots = new List<TeeTimeSchedule>();

            foreach (var teeTimeSchedule in dto.TeeTimeSchedules)
            {
                var plottedSchedules = await _teeTimeScheduleService.ListAsync(schedule => schedule.Id == teeTimeSchedule.Id);

                if (plottedSchedules.Count > 1)
                {
                    unavailableSlots.Add(_mapper.Map<TeeTimeSchedule>(teeTimeSchedule));
                }

                if (plottedSchedules.Count < 2)
                {
                    availableSlots.Add(_mapper.Map<TeeTimeSchedule>(teeTimeSchedule));
                    playerTeeTimeSchedules.Add(new PlayerTeeTimeSchedule
                    {
                        TeeTimeScheduleId = teeTimeSchedule.Id,
                        PlayerId = dto.PlayerId
                    });
                }
            }

            var data = await _iPlayerTeeTimeScheduleService.AddRangeAsync(playerTeeTimeSchedules);

            response.Data = _mapper.Map<List<PlayerTeeTimeScheduleDto>>(data);
            response.Message = "Successfully created tee time schedules.";

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