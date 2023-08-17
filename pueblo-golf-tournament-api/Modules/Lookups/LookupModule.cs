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
using pueblo_golf_tournament_api.Services.PlayerTeeTimeSchedules;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Scorers;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TeeTimeSchedules;
using pueblo_golf_tournament_api.Services.TournamentHoles;
using pueblo_golf_tournament_api.Services.TournamentPlayerScores;
using pueblo_golf_tournament_api.Services.Tournaments;
using pueblo_golf_tournament_api.Services.TournamentScorers;

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
        private readonly ITeeTimeScheduleService _teeTimeScheduleService;
        private readonly IPlayerTeeTimeScheduleService _playerTeeTimeScheduleService;
        private readonly ITournamentHolesService _tournamentHolesService;
        private readonly ITournamentScorerService _tournamentScorerService;
        private readonly ITournamentPlayerScoreService _tournamentPlayerScoreService;
        private readonly IScorerService _scorerService;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        public LookupModule(IMapper mapper, DataContext dbContext, IScorerService scorerService, ITournamentPlayerScoreService tournamentPlayerScoreService, ITournamentScorerService tournamentScorerService, ITournamentService tournamentService, ITournamentHolesService tournamentHolesService, IPlayerTeeTimeScheduleService playerTeeTimeScheduleService, ITeeTimeScheduleService teeTimeScheduleService, IPaymentChannelAccountService paymentChannelAccountService, IPaymentChannelService paymentChannelService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IAccountService accountService)
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
            _paymentChannelService = paymentChannelService;
            _paymentChannelAccountService = paymentChannelAccountService;
            _teeTimeScheduleService = teeTimeScheduleService;
            _playerTeeTimeScheduleService = playerTeeTimeScheduleService;
            _tournamentHolesService = tournamentHolesService;
            _tournamentScorerService = tournamentScorerService;
            _scorerService = scorerService;
            _tournamentPlayerScoreService = tournamentPlayerScoreService;
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

        public async Task<LookupPaymentChannelsResponseDto> LookupPaymentChannels(LookupPaymentChannelsRequestDto payload)
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

        public async Task<LookupPlayerScheduleResponseDto> LookupPlayerSchedule(LookupPlayerScheduleRequestDto payload)
        {
            var response = new LookupPlayerScheduleResponseDto();

            var player = await _playerService.GetAsync(player => player.Id == payload.PlayerId);

            if (player == null)
            {
                response.Message = "Player not found.";
                return response;
            }

            if (player != null)
            {
                var data = await _dbContext.PlayerTeeTimeSchedules
                .Where(t => t.PlayerId == payload.PlayerId)
                .Join(_dbContext.TeeTimeSchedules, (playerSchedule) => playerSchedule.TeeTimeScheduleId, (teeTimeSchedule) => teeTimeSchedule.Id, (playerSchedule, teeTimeSchedule)
                => new { playerSchedule, teeTimeSchedule }).ToListAsync();

                var scheduleDates = new List<TournamentScheduleDate>();

                response.PlayerId = player.Id;

                foreach (var schedule in data.DistinctBy(x => x.teeTimeSchedule.DateTimeSlot.Date))
                {
                    var timeSchedules = data.Where(x => x.teeTimeSchedule.DateTimeSlot.Date == schedule.teeTimeSchedule.DateTimeSlot.Date).Select(e => e.teeTimeSchedule).OrderBy(o => o.DateTimeSlot).ToList();

                    scheduleDates.Add(new TournamentScheduleDate
                    {
                        Date = schedule.teeTimeSchedule.DateTimeSlot.Date,
                        HoleType = schedule.playerSchedule.HoleType,
                        TimeSchedules = _mapper.Map<List<TeeTimeScheduleDto>>(timeSchedules)
                    });
                }

                response.Data = scheduleDates.OrderBy(date => date.Date).ToList();
                response.Message = data.Count > 0 ? $"Schedules found for Player {player.PlayerExternalId}" : "No Schedules found.";

            }

            return response;
        }

        public async Task<LookupScorerProfilesResponseDto> LookupScorerProfiles(LookupScorerProfilesRequestDto payload)
        {
            var response = new LookupScorerProfilesResponseDto();

            var tournamentScorers = await _tournamentScorerService.ListAsync(scorer => scorer.TournamentId == payload.TournamentId);

            var scorers = tournamentScorers.Join(await _scorerService.ListAsync(), tournament => tournament.ScorerId, scorer => scorer.Id, (tournament, scorer) => new { Tournament = tournament, Scorer = scorer });

            foreach (var scorer in scorers)
            {
                var person = await _personService.GetAsync(person => person.Id == scorer.Scorer.PersonId);
                response.Data.Add(new ScorerProfile
                {
                     Person = _mapper.Map<PersonDto>(person),
                     Scorer = _mapper.Map<ScorerDto>(scorer.Scorer),
                });
            }

            response.Message = $"{scorers.Count()} scorers found.";

            return response;
        }

        public async Task<LookupTeamsForCaptainResponseDto> LookupTeamsForCaptain(LookupTeamsForCaptainRequestDto payload)
        {
            var response = new LookupTeamsForCaptainResponseDto();



            return response;
        }

        public async Task<LookupTeeTimeSchedulesResponseDto> LookupTeeTimeSchedules(LookupTeeTimeSchedulesRequestDto payload)
        {
            var response = new LookupTeeTimeSchedulesResponseDto();

            var teeTimeSchedules = await _teeTimeScheduleService.ListAsync(teeTimeSchedule => teeTimeSchedule.TournamentId == payload.TournamentId);

            if (teeTimeSchedules.Count == 0)
            {
                response.Message = "No Tee Time schedules found.";
                return response;
            }

            foreach (var schedule in teeTimeSchedules.DistinctBy(x => x.DateTimeSlot.Date))
            {
                response.Data.Add(new TournamentScheduleDate
                {
                    Date = schedule.DateTimeSlot.Date,
                    TimeSchedules = _mapper.Map<List<TeeTimeScheduleDto>>(teeTimeSchedules.Where(x => x.DateTimeSlot.Date == schedule.DateTimeSlot.Date).ToList())
                });
            }

            response.Message = "Tee Time Schedules found.";

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

        public async Task<LookupTournamentHolesResponseDto> LookupTournamentHoles(long tournamentId)
        {
            var response = new LookupTournamentHolesResponseDto();

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == tournamentId);

            if (tournament == null)
            {
                response.Message = "Tournament not found.";
            }

            var data = await _tournamentHolesService.ListAsync(hole => hole.TournamentId == tournamentId);

            response.TournamentId = tournamentId;
            response.Data = _mapper.Map<List<TournamentHoleDto>>(data);
            response.Message = data.Count > 0 ? $"{data.Count} holes found." : "No holes found.";

            return response;
        }

        public async Task<LookupTournamentPlayerScoresResponseDto> LookupTournamentPlayerScorers(LookupTournamentPlayerScoresRequestDto payload)
        {
            var response = new LookupTournamentPlayerScoresResponseDto();

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == payload.TournamentId);

            if (tournament == null)
            {
                response.Message = "Tournament not found.";
                return response;
            }
            
            var team = await _teamService.GetAsync(team => team.Id == payload.TeamId);

            if (team == null)
            {
                response.Message = "Team not found.";
                return response;
            }

            var playerTeeTimeSchedule = await _playerTeeTimeScheduleService.GetAsync(schedule => schedule.TeeTimeScheduleId == payload.TeeTimeScheduleId && schedule.PlayerId == payload.PlayerId);

            Console.WriteLine(playerTeeTimeSchedule.Id);
            if (playerTeeTimeSchedule == null)
            {
                response.Message = "Tee Time Schedule not found.";
                return response;
            }

            var scores = await _tournamentPlayerScoreService.ListAsync(score => score.TournamentId == payload.TournamentId && score.TeamId == payload.TeamId && score.PlayerId == payload.PlayerId && score.PlayerTeeTimeScheduleId == playerTeeTimeSchedule.Id);

            response.Data = _mapper.Map<List<TournamentPlayerScoreDto>>(scores);
            response.Message = $"{scores.Count()} scores found.";

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
                    var division = await _dbContext.TournamentTeamDivisions.Where(tournamentDivision => tournamentDivision.TeamId == team.Id).Join(_dbContext.Divisions, td => td.DivisionId, d => d.Id, (td, d) => d).SingleOrDefaultAsync(); 
                    
                    response.RegisteredTeams.Add(new RegisteredTeam
                    {
                        Registration = _mapper.Map<RegistrationDto>(registration),
                        Team = _mapper.Map<TeamDto>(team),
                        CaptainProfile = teamCaptainProfile!,
                        MemberProfiles = memberProfiles.ToList(),
                        Payment = _mapper.Map<PaymentDto>(payment),
                        Division = _mapper.Map<DivisionDto>(division)
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