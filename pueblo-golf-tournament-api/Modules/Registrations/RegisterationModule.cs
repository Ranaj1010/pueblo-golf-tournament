using System.ComponentModel.DataAnnotations;
using System.Reflection;
using AutoMapper;
using AutoMapper.Execution;
using Microsoft.EntityFrameworkCore.Internal;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Extensions;
using pueblo_golf_tournament_api.Services.Accounts;
using pueblo_golf_tournament_api.Services.Divisions;
using pueblo_golf_tournament_api.Services.HomeClubs;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.Tournaments;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Modules.Registrations
{
    public class RegisterationModule : IRegistrationModule
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
        public RegisterationModule(IMapper mapper, DataContext dbContext, ITournamentService tournamentService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IAccountService accountService)
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


        public async Task<RegisteredAccountDto> RegisterAccount(RegisterAccountDto payload)
        {
            var response = new RegisteredAccountDto();

            var existingUsername = await _accountService.GetAsync(account => account.Username.Equals(payload.Account!.Username));

            if (existingUsername != null)
            {
                response.Data = null;
                response.Message = "Invalid Input. Username already exists.";
                return response;
            }

            if (String.IsNullOrWhiteSpace(payload.Person!.FirstName))
            {
                response.Data = null;
                response.Message = "Invalid Input. First Name is required.";
                return response;
            }

            if (String.IsNullOrWhiteSpace(payload.Person!.LastName))
            {
                response.Data = null;
                response.Message = "Invalid Input. Last Name is required.";
                return response;
            }

            if (!ValidatorExtensions.ValidMobileNumber(payload.Person.ContactNumber!))
            {
                response.Data = null;
                response.Message = "Invalid Mobile Number.";
                return response;
            }

            if (!ValidatorExtensions.ValidEmail(payload.Person!.EmailAddress!))
            {
                response.Data = null;
                response.Message = "Invalid Email Address.";
                return response;
            }

            if (!ValidatorExtensions.ValidUsername(payload.Account!.Username!))
            {
                response.Data = null;
                response.Message = "Invalid Username. Please use another username instead.";
                return response;
            }

            if (!ValidatorExtensions.ValidPassword(payload.Account!.Password!))
            {
                response.Data = null;
                response.Message = "Invalid Password. Make sure not to use any special characters.";
                return response;
            }

            var person = await _personService.AddAsync(_mapper.Map<Person>(payload.Person));

            var account = _mapper.Map<Account>(payload.Account);
            account.PersonId = person.Id;
            account.Password = HashExtensions.GetHash(account.Password!);
            account.AccounType = AccountTypeEnum.User;

            var player = _mapper.Map<Player>(payload.Player);
            player.PersonId = person.Id;

            var createdPlayer = await _playerService.AddAsync(player);

            var registeredAccount = await _accountService.AddAsync(account);
            response.Data = new RegisteredAccountDataDto
            {
                Person = _mapper.Map<PersonDto>(person),
                Player = _mapper.Map<PlayerDto>(createdPlayer)
            };

            response.Message = "Congratulations. You have successfully registered your account.";

            return response;
        }

        public async Task<RegisteredDivisionDto> RegisterDivision(RegisterDivisionDto payload)
        {
            var response = new RegisteredDivisionDto();

            if (String.IsNullOrWhiteSpace(payload.Name))
            {
                response.Data = null;
                response.Message = "Invalid Input. Name is missing.";
                return response;
            }

            if (payload.TournamentId == 0)
            {
                response.Data = null;
                response.Message = "Invalid Input. Unknown Tournament Id.";
                return response;
            }

            var parsedEntity = _mapper.Map<Division>(payload);

            var division = await _divisionService.AddAsync(parsedEntity);

            division.Tournament = await _tournamentService.GetAsync(tournament => tournament.Id == division.TournamentId && tournament.Active);

            response.Data = division.Id != 0 ? _mapper.Map<DivisionDto>(division) : null;
            response.Message = division.Id != 0 ? "Division is successfully registered" : "Failed to register division.";

            return response;
        }
        public async Task<RegisteredHomeClubDto> RegisterHomeClub(RegisterHomeClubDto payload)
        {

            var response = new RegisteredHomeClubDto();

            if (String.IsNullOrWhiteSpace(payload.Name))
            {
                response.Data = null;
                response.Message = "Invalid Input. Name is missing.";
                return response;
            }

            var parsedEntity = _mapper.Map<HomeClub>(payload);
            var homeClub = await _homeClubService.AddAsync(parsedEntity);

            response.Data = homeClub.Id != 0 ? _mapper.Map<HomeClubDto>(homeClub) : null;
            response.Message = homeClub.Id != 0 ? "Home Club is successfully registered" : "Failed to register home club.";

            return response;
        }

        public async Task<RegisteredTeamDto> RegisterTeam(RegisterTeamDto payload)
        {
            var response = new RegisteredTeamDto();

            try
            {

                if (payload.Team == null)
                {
                    response.Data = null;
                    response.Message = "Invalid Input. Team is not defined.";
                    return response;
                }

                if (payload.TeamCaptain == null)
                {
                    response.Data = null;
                    response.Message = "Invalid Input. Team Captain is not defined.";
                    return response;
                }

                if (payload.Members == null || payload.Members.Count == 0)
                {
                    response.Data = null;
                    response.Message = "Invalid Input. Members must be defined.";
                    return response;
                }

                var team = await _teamService.AddAsync(_mapper.Map<Team>(payload.Team));

                if (team != null)
                {
                    var teamCaptainAsPlayer = _mapper.Map<Player>(payload.TeamCaptain.PlayerDetails);
                    var teamMembersAsPlayers = _mapper.Map<List<RegisterPlayerDto>>(payload.Members);

                    teamCaptainAsPlayer.TeamId = team.Id;
                    teamCaptainAsPlayer.PersonId = payload.TeamCaptain.PersonId;
                    teamCaptainAsPlayer.HomeClub = payload.TeamCaptain.PlayerDetails.HomeClub;
                    teamCaptainAsPlayer.DivisionId = payload.DivisionId;
                    teamCaptainAsPlayer.PlayerType = Utilities.Enums.PlayerTypeEnum.Captain;

                    var addedTeamCaptain = await _playerService.AddAsync(teamCaptainAsPlayer);

                    response.Data!.TeamCaptain = _mapper.Map<PlayerDto>(addedTeamCaptain);

                    foreach (var member in teamMembersAsPlayers)
                    {
                        var person = _personService.AddAsync(_mapper.Map<Person>(member.PersonalDetails));
                        var player = _mapper.Map<Player>(member.PlayerDetails);

                        player.TeamId = team.Id;
                        player.PersonId = person.Id;
                        player.HomeClub = player.HomeClub;
                        player.DivisionId = payload.DivisionId;
                        player.PlayerType = Utilities.Enums.PlayerTypeEnum.Member;

                        var addedTeamMember = await _playerService.AddAsync(player);

                        response.Data.Members.Add(_mapper.Map<PlayerDto>(addedTeamMember));
                    }

                    var registration = new Registration
                    {
                        TeamId = team.Id,
                        TeamCaptainId = addedTeamCaptain.Id,
                        DivisionId = payload.DivisionId,
                        TournamentId = payload.TournamentId,
                        RegistrationDate = DateTime.Now,
                        Status = Utilities.Enums.RegistrationStatusEnum.Pending,
                        
                    };


                    var registeredTeam = await _registrationService.AddAsync(registration);

                    if (registeredTeam == null)
                    {
                        response.Data = null;
                        response.Message = "Registration Failed.";
                        return response;
                    }

                    response.Data.Registration = _mapper.Map<RegistrationDto>(registeredTeam);
                }


                return response;
            }
            catch (System.Exception ex)
            {
                response.Data = null;
                response.Message = $"Registration Failed. {ex.Message}";
                return response;
            }
        }

        public async Task<RegisteredTeamImagesDto> RegisterTeamsImages(RegistrationTeamImagesDto payload)
        {
            var response = new RegisteredTeamImagesDto();
            
            try
            {

                if (payload.LogoImageFile == null || payload.LogoImageFile.Length == 0)
                {
                    response.Message = "Please send the Team Logo";
                    return response;
                }

                if (payload.PaymentImageFile == null || payload.PaymentImageFile.Length == 0)
                {
                    response.Message = "Please send the Payment Screenshot";
                    return response;
                }

                //create unique name for file
                var paymentFileName = Guid.NewGuid().ToString() + Path.GetExtension(payload.PaymentImageFile.FileName);
                var logoFileName = Guid.NewGuid().ToString() + Path.GetExtension(payload.LogoImageFile.FileName);

                //set file url
                var savePaymentPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images/payments", paymentFileName);
                var saveLogoPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/images/logos", logoFileName);

                using (var stream = new FileStream(savePaymentPath, FileMode.Create))
                {
                    payload.PaymentImageFile.CopyTo(stream);
                }

                using (var stream = new FileStream(saveLogoPath, FileMode.Create))
                {
                    payload.LogoImageFile.CopyTo(stream);
                }

                response.PaymentImageUrl = paymentFileName;
                response.LogoImageUrl = logoFileName;

                return response;
            }
            catch (System.Exception ex)
            {
                response.Message = $"Registration Failed. {ex.Message}";
                return response;
            }
        }

        public async Task<RegisteredTournamentDto> RegisterTournament(RegisterTournamentDto payload)
        {
            var response = new RegisteredTournamentDto();

            if (payload.Tournament == null)
            {
                response.Data = null;
                response.Message = "Invalid Input. Tournament details are missing.";
                return response;
            }

            if (String.IsNullOrWhiteSpace(payload.Tournament!.Name))
            {
                response.Data = null;
                response.Message = "Invalid Input. Name is missing.";
                return response;
            }

            if (payload.Tournament!.NumberOfSlots == 0)
            {
                response.Data = null;
                response.Message = "Invalid Input. Slots not defined.";
                return response;
            }

            var parsedEntity = _mapper.Map<Tournament>(payload.Tournament);

            var tournament = await _tournamentService.AddAsync(parsedEntity);

            response.Data = tournament.Id != 0 ? _mapper.Map<TournamentDto>(tournament) : null;
            response.Message = tournament.Id != 0 ? "Tournament is successfully Registered" : "Failed to register tournament";

            return response;
        }
    }
}