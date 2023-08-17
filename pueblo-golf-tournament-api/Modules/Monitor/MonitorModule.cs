using System.Linq;
using AutoMapper;
using Microsoft.AspNetCore.SignalR;
using Newtonsoft.Json;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Hub;
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
using pueblo_golf_tournament_api.Services.TournamentTeamDivisions;

namespace pueblo_golf_tournament_api.Modules.Monitor
{
    public class MonitorModule : IMonitorModule
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
        private readonly ITournamentTeamDivisionService _tournamentTeamDivisionService;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        private readonly IHubContext<ServiceHub, IServiceHub> _serviceHub;
        public MonitorModule(IMapper mapper, IHubContext<ServiceHub, IServiceHub> serviceHub, ITournamentTeamDivisionService tournamentTeamDivisionService, DataContext dbContext, IScorerService scorerService, ITournamentPlayerScoreService tournamentPlayerScoreService, ITournamentScorerService tournamentScorerService, ITournamentService tournamentService, ITournamentHolesService tournamentHolesService, IPlayerTeeTimeScheduleService playerTeeTimeScheduleService, ITeeTimeScheduleService teeTimeScheduleService, IPaymentChannelAccountService paymentChannelAccountService, IPaymentChannelService paymentChannelService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IAccountService accountService)
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
            _serviceHub = serviceHub;
            _tournamentTeamDivisionService = tournamentTeamDivisionService;
        }
        public async Task MonitorLeaderBoard(long tournamentId)
        {
            var playerScores = await _tournamentPlayerScoreService.ListAsync();

            var tournamentDivisions = await _tournamentTeamDivisionService.ListAsync(division => division.TournamentId == tournamentId);

            var leaderBoardsPerDivision = new List<DivisionLeaderBoard>();

            foreach (var tournamentDivision in tournamentDivisions)
            {
                var leaderBoards = new List<LeaderboardDto>();
                var division = await _divisionService.GetAsync(d => d.Id == tournamentDivision.Id);
                var teamsPerDivision = playerScores.DistinctBy(score => score.TeamId).ToList();

                foreach (var teamDivision in teamsPerDivision)
                {
                    var team = await _teamService.GetAsync(t => t.Id == teamDivision.TeamId);
                    leaderBoards.Add(new LeaderboardDto
                    {
                        Team = _mapper.Map<TeamDto>(team),
                        Score = playerScores.Where(score => score.TeamId == teamDivision.TeamId).Sum(e => e.MolaveScore)
                    });
                }

                leaderBoardsPerDivision.Add(new DivisionLeaderBoard
                {
                    Division = _mapper.Map<DivisionDto>(division),
                    LeaderBoard = leaderBoards.OrderByDescending(r => r.Score).Take(4).ToList()
                });
            }

            await _serviceHub.Clients.All.ReceiveLeaderBoardUpdates(new ReceiveLeaderboardUpdateResponseDto
            {
                Data = leaderBoardsPerDivision
            });
        }
    }
}