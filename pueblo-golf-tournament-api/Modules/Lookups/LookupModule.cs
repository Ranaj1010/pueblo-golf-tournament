using AutoMapper;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Outgoing;
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

        public async Task<LookupDivisionsDto> LookupDivisions()
        {
            var response = new LookupDivisionsDto();

            var data = await _divisionService.ListAsync();

            response.Data = _mapper.Map<List<DivisionDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response; ;
        }

        public async Task<LookupHomeClubsDto> LookupHomeClubs()
        {
            var response = new LookupHomeClubsDto();

            var data = await _homeClubService.ListAsync();

            response.Data = _mapper.Map<List<HomeClubDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response;
        }

        public async Task<LookupTournamentsDto> LookupTournaments()
        {
            var response = new LookupTournamentsDto();

            var data = await _tournamentService.ListAsync();

            response.Data = _mapper.Map<List<TournamentDto>>(data);
            response.Message = $"{data.Count} items found.";

            return response;
        }
    }
}