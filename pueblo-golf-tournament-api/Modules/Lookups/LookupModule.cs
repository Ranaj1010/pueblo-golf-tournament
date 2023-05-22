using AutoMapper;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.Accounts;
using pueblo_golf_tournament_api.Services.Divisions;
using pueblo_golf_tournament_api.Services.HomeClubs;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.Tournaments;

namespace pueblo_golf_tournament_api.Modules.Lookups
{
    public class LookupModule : ILookupModule
    {
        private readonly ITournamentService _tournamentService;
        private readonly IDivisionService _divisionService;
        private readonly IHomeClubService _homeClubService;
        private readonly IRegistrationService _registrationService;
        private readonly IPlayerService _playerService;
        private readonly IPersonService _personService;
        private readonly ITeamService _teamService;
        private readonly IAccountService _accountService;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        public LookupModule(IMapper mapper, DataContext dbContext, ITournamentService tournamentService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IAccountService accountService)
        {
            _mapper = mapper;
            _dbContext = dbContext;
            _tournamentService = tournamentService;
            _divisionService = divisionService;
            _homeClubService = homeClubService;
            _registrationService = registrationService;
            _playerService = playerService;
            _teamService = teamService;
            _personService = personService;
            _accountService = accountService;
        }

        public async Task<LookupDivisionsDto> LookupDivisions(LookupDivisionRequestDto payload)
        {
            var response = new LookupDivisionsDto();

            var data = new List<Division>();

            data = await _divisionService.ListAsync();

            if (payload.tournamentId != null && payload.tournamentId != 0)
            {
                data = await _divisionService.ListAsync(division => division.TournamentId.Equals(payload.tournamentId));
            }

            response.Data = _mapper.Map<List<DivisionDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response;
        }

        public async Task<LookupHomeClubsDto> LookupHomeClubs()
        {
            var response = new LookupHomeClubsDto();

            var data = await _homeClubService.ListAsync();

            response.Data = _mapper.Map<List<HomeClubDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response;
        }

        public async Task<LookupTournamentsDto> LookupTournaments(LookupTournamentsRequestDto payload)
        {
            var response = new LookupTournamentsDto();

            var data = await _tournamentService.ListAsync();

            response.Data = _mapper.Map<List<TournamentDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response;
        }

        public async Task<LookupTournamentTeamResponseDto> LookupTournamentTeam(long tournamentId, long teamCaptainId)
        {
            var response = new LookupTournamentTeamResponseDto();

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == tournamentId);
            var registrations = await _registrationService.ListAsync(registration => registration.TournamentId == tournamentId && registration.TeamCaptainId == teamCaptainId);
            
            if(registrations.Count == 0) {
                response.Message = "No registration found for Team Captain";
            }

            if (registrations.Count > 0)
            {
                var registration = registrations.Last();
                var team = await _teamService.GetAsync(team => team.Id == registration.TeamId);
                var division = await _divisionService.GetAsync(division => division.Id == registration.DivisionId);
                response.Tournament = _mapper.Map<TournamentDto>(tournament);
                response.Division = _mapper.Map<DivisionDto>(division);
                response.Team = _mapper.Map<TeamDto>(team);
                response.Registration = _mapper.Map<RegistrationDto>(registration);
                response.TournamentId = tournamentId;
                response.Message = "Registration found.";
            }

            return response;
        }

    }
}