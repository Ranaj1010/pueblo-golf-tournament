using AutoMapper;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.Accounts;
using pueblo_golf_tournament_api.Services.Divisions;
using pueblo_golf_tournament_api.Services.HomeClubs;
using pueblo_golf_tournament_api.Services.PaymentChannelAccounts;
using pueblo_golf_tournament_api.Services.PaymentChannels;
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
        private readonly IPaymentChannelService _paymentChannelService;
        private readonly IPaymentChannelAccountService _paymentChannelAccountService;
        private readonly ITeamService _teamService;
        private readonly IAccountService _accountService;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        public LookupModule(IMapper mapper, DataContext dbContext, ITournamentService tournamentService, IPaymentChannelAccountService paymentChannelAccountService, IPaymentChannelService paymentChannelService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IAccountService accountService)
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
            _paymentChannelService = paymentChannelService;
            _paymentChannelAccountService = paymentChannelAccountService;
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

        public async Task<LookupPaymentChannelAccountsResponseDto> LookupPaymentChannelAccounts(LookupPaymentChannelAccountsRequestDto payload)
        {
            var response = new LookupPaymentChannelAccountsResponseDto();

            var data = await _paymentChannelAccountService.ListAsync(account => account.TournamentId == payload.TournamentId);
            response.Data = _mapper.Map<List<PaymentChannelAccountDto>>(data);
            response.Message = data.Count > 0 ? $"{data.Count} payment channel accounts found" : "No payment channel accounts found.";

            return response;
        }

        public async  Task<LookupPaymentChannelsResponseDto> LookupPaymentChannels(LookupPaymentChannelsRequestDto payload)
        {
            var response = new LookupPaymentChannelsResponseDto();

            var data = await _paymentChannelService.ListAsync();
            response.Data = _mapper.Map<List<PaymentChannelDto>>(data);
            response.Message = data.Count > 0 ? $"{data.Count} payment channels found" : "No payment channels found.";

            return response;
        }

        public async Task<LookupPlayerProfileResponseDto> LookupPlayerProfile(string playerExternalId)
        {
            var response = new LookupPlayerProfileResponseDto();
            var player = await _playerService.GetAsync(player => player.PlayerExternalId == playerExternalId);

            if (player == null)
            {
                response.Profile = null;
                response.Message = "Player not found.";
                return response;
            }

            if (player != null)
            {
                var person = await _personService.GetAsync(person => person.Id == player.PersonId);
                var profile = new PlayerProfile
                {
                    Person = _mapper.Map<PersonDto>(person),
                    Player = _mapper.Map<PlayerDto>(player)
                };
                response.Profile = profile;
                response.Message = "Profile found.";

            }


            return response;
        }

        public async Task<LookupPlayerProfileResponseDto> LookupPlayerProfileByPersonId(long personId)
        {
            var response = new LookupPlayerProfileResponseDto();
            var player = await _playerService.GetAsync(player => player.PersonId == personId);

            if (player == null)
            {
                response.Profile = null;
                response.Message = "Player not found.";
                return response;
            }

            if (player != null)
            {
                var person = await _personService.GetAsync(person => person.Id == player.PersonId);
                var profile = new PlayerProfile
                {
                    Person = _mapper.Map<PersonDto>(person),
                    Player = _mapper.Map<PlayerDto>(player)
                };
                response.Profile = profile;
                response.Message = "Profile found.";

            }
            return response;
        }

        public async Task<LookupTournamentDetailsResponseDto> LookupTournamentDetails(LookupTournamentDetailsDto payload)
        {
            var response = new LookupTournamentDetailsResponseDto();

            var data = await _tournamentService.GetAsync(tournament => tournament.Id == payload.TournamentId);

            if (data == null)
            {

                response.Tournament = null;
                response.Message = "Tournament not found.";
            }

            response.Tournament = _mapper.Map<TournamentDto>(data);
            response.Message = "Tournament found.";

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
            Console.WriteLine($"TEAM CAPTAIN: {teamCaptainId}");
            Console.WriteLine($"TOURNAMENT : {tournamentId}");
            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == tournamentId);
            var registrations = teamCaptainId == 0 ? await _registrationService.ListAsync(registration => registration.TournamentId == tournamentId) : await _registrationService.ListAsync(registration => registration.TournamentId == tournamentId && registration.TeamCaptainId == teamCaptainId);

            if (registrations.Count == 0)
            {
                response.Message = "No registration found for Team Captain";
            }

            if (registrations.Count > 0)
            {
                foreach (var registration in registrations)
                {
                    var team = await _teamService.GetAsync(team => team.Id == registration.TeamId);

                    var player = await _dbContext.Players.SingleOrDefaultAsync(result => result.Id == team.TeamCaptainId);
                    var person = await _dbContext.Persons.SingleOrDefaultAsync(result => result.Id == player.PersonId);
                    var teamCaptainProfile = new PlayerProfile
                    {
                        Person = _mapper.Map<PersonDto>(person),
                        Player = _mapper.Map<PlayerDto>(player)
                    };
                    var tournamentPlayers = _dbContext.TournamentPlayers.Where(player => player.TournamentId == tournamentId && player.TeamId == team.Id)
                                                .Join(_dbContext.Players, tournament => tournament.PlayerId, player => player.Id, (tournamentPlayer, player) => new { tournamentPlayer, player });
                    var memberProfiles = tournamentPlayers.Join(_dbContext.Persons, player => player.player.PersonId, person => person.Id, (player, person) => new PlayerProfile
                    {
                        Person = _mapper.Map<PersonDto>(person),
                        Player = _mapper.Map<PlayerDto>(new Player
                        {
                            PlayerType = player.tournamentPlayer.PlayerType,
                            HomeClub = player.player.HomeClub,
                            Handicap = player.player.Handicap,
                            PersonId = player.player.PersonId,
                            PlayerExternalId = player.player.PlayerExternalId,
                            WorldHandicapSystemId = player.player.WorldHandicapSystemId,
                            Id = player.player.Id
                        })
                    });

                    var payment = await _dbContext.Payments.SingleOrDefaultAsync(payment => payment.Id == registration.PaymentId);

                    response.RegisteredTeams.Add(new RegisteredTeam
                    {
                        Registration = _mapper.Map<RegistrationDto>(registration),
                        Team = _mapper.Map<TeamDto>(team),
                        CaptainProfile = teamCaptainProfile!,
                        MemberProfiles = memberProfiles.ToList(),
                        Payment = _mapper.Map<PaymentDto>(payment)

                    });
                }

                response.Tournament = _mapper.Map<TournamentDto>(tournament);
                response.TournamentId = tournamentId;
                response.Message = "Registration found.";
            }

            return response;
        }

    }
}