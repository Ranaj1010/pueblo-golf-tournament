using System.ComponentModel.DataAnnotations;
using System.Reflection;
using AutoMapper;
using AutoMapper.Execution;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Extensions;
using pueblo_golf_tournament_api.Modules.Uploads;
using pueblo_golf_tournament_api.Services.Accounts;
using pueblo_golf_tournament_api.Services.Divisions;
using pueblo_golf_tournament_api.Services.HomeClubs;
using pueblo_golf_tournament_api.Services.Payments;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TournamentPlayers;
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
        private readonly IPaymentService _paymentService;
        private readonly IPersonService _personService;
        private readonly ITeamService _teamService;
        private readonly ITournamentPlayerService _tournamentPlayerService;
        private readonly IAccountService _accountService;
        private readonly IUploadModule _uploadModule;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        public RegisterationModule(IMapper mapper, DataContext dbContext, IUploadModule uploadModule, ITournamentService tournamentService, ITournamentPlayerService tournamentPlayerService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IPaymentService paymentService, IAccountService accountService)
        {
            _mapper = mapper;
            _dbContext = dbContext;
            _tournamentService = tournamentService;
            _tournamentPlayerService = tournamentPlayerService;
            _divisionService = divisionService;
            _homeClubService = homeClubService;
            _registrationService = registrationService;
            _playerService = playerService;
            _teamService = teamService;
            _personService = personService;
            _accountService = accountService;
            _paymentService = paymentService;
            _uploadModule = uploadModule;
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

            if (!ValidatorExtensions.ValidUsername(payload.Account!.Username!))
            {
                response.Data = null;
                response.Message = "Invalid Username. Please use another username instead.";
                return response;
            }

            if (!ValidatorExtensions.ValidPassword(payload.Account!.Password!))
            {
                response.Data = null;
                response.Message = "Invalid Password. Password should have atleast 6 characters and 1 uppercase letter. Make sure not to use any special characters.";
                return response;
            }

            var person = await _personService.AddAsync(_mapper.Map<Person>(payload.Person));

            if (person.Id == 0)
            {
                response.Data = null;
                response.Message = "Failed to register. Please try again";
                return response;
            }

            var account = _mapper.Map<Account>(payload.Account);
            account.PersonId = person.Id;
            account.Password = HashExtensions.GetHash(account.Password!);
            account.AccounType = AccountTypeEnum.User;

            var registeredAccount = await _accountService.AddAsync(account);

            if (registeredAccount.Id == 0)
            {
                response.Data = null;
                response.Message = "Failed to register. Please try again";
                return response;
            }

            response.Data = new RegisteredAccountDataDto
            {
                Person = _mapper.Map<PersonDto>(person),
            };

            response.Message = "Congratulations. You have successfully registered your account.";

            return response;
        }

        public async Task<RegisteredAccountDto> RegisterAdminAccount(RegisterAccountDto payload)
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

            if (person.Id == 0)
            {
                response.Data = null;
                response.Message = "Failed to register. Please try again";
                return response;
            }

            var account = _mapper.Map<Account>(payload.Account);
            account.PersonId = person.Id;
            account.Password = HashExtensions.GetHash(account.Password!);
            account.AccounType = AccountTypeEnum.Administrator;

            var registeredAccount = await _accountService.AddAsync(account);

            if (registeredAccount.Id == 0)
            {
                response.Data = null;
                response.Message = "Failed to register. Please try again";
                return response;
            }

            response.Data = new RegisteredAccountDataDto
            {
                Person = _mapper.Map<PersonDto>(person),
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

        public async Task<RegisteredPaymentResponseDto> RegisterPayment(RegisterPaymentRequestDto payload)
        {
            var response = new RegisteredPaymentResponseDto();

            var registration = await _registrationService.GetAsync(registration => registration.Id == payload.RegistrationId);

            var paymentReferrencePhoto = _uploadModule.UploadImage(payload.PaymentReferrencePhoto, payload.PaymentReferrencePhoto.FileName, "payments");

            var payment = new Payment
            {
                PaymentMethod = payload.PaymentMethod,
                ReferrenceId = payload.ReferrenceId,
                PaymentReferrencePhoto = paymentReferrencePhoto,
                PaymentDate = DateTime.UtcNow
            };

            var createdPayment = await _paymentService.AddAsync(payment);
            registration.IsPayed = true;
            registration.PaymentId = createdPayment.Id;

            var updatedRegistration = await _registrationService.UpdateAsync(registration);

            response.Data = _mapper.Map<PaymentDto>(createdPayment);
            response.Message = "Payment has been made";
            
            return response;
        }

        public async Task<RegisteredPersonDto> RegisterPerson(RegisterPersonDto payload)
        {
            var response = new RegisteredPersonDto();
            try
            {
                var existingPerson = await _personService.GetAsync(person => person.FirstName == payload.FirstName && person.MiddleName == payload.MiddleName && person.LastName == payload.LastName && person.BirthDate == payload.BirthDate);

                if (existingPerson != null)
                {
                    response.Data = _mapper.Map<PersonDto>(existingPerson);
                    response.Message = "Person is successfully registered.";
                    return response;
                }

                var registered = await _personService.AddAsync(_mapper.Map<Person>(payload));

                if (registered != null)
                {
                    response.Data = _mapper.Map<PersonDto>(registered);
                    response.Message = "Person is successfully registered.";
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

        public async Task<RegisteredPlayerDto> RegisterPlayer(RegisterPlayerDto payload)
        {
            var response = new RegisteredPlayerDto();
            try
            {

                var existingPlayer = await _playerService.GetAsync(player => player.PersonId == payload.PersonId);

                if (existingPlayer != null)
                {
                    var person = await _personService.GetAsync(person => person.Id == existingPlayer.PersonId);
                    var profile = new PlayerProfile
                    {
                        Player = _mapper.Map<PlayerDto>(existingPlayer),
                        Person = _mapper.Map<PersonDto>(person)
                    };

                    response.PlayerProfile = profile;
                    response.Message = "Player is successfully registered.";
                    return response;
                }

                var playerIdPrefex = "PBG000000000";
                var player = _mapper.Map<Player>(payload);
                var playersCount = await _dbContext.Players.CountAsync() + 1;
                player.PlayerExternalId = playerIdPrefex.Substring(0, playerIdPrefex.Length - playersCount.ToString().Length) + playersCount.ToString();
                var registered = await _playerService.AddAsync(player);
                if (registered != null)
                {
                    var person = await _personService.GetAsync(person => person.Id == player.PersonId);
                    var profile = new PlayerProfile
                    {
                        Player = _mapper.Map<PlayerDto>(registered),
                        Person = _mapper.Map<PersonDto>(person)
                    };

                    response.PlayerProfile = profile;
                    response.Message = "Player is successfully registered.";
                }

                return response;
            }
            catch (System.Exception ex)
            {

                response.PlayerProfile = null;
                response.Message = $"Registration Failed. {ex.Message}";
                return response;
            }
        }

        public async Task<RegisteredTeamDto> RegisterTeam(RegisterTeamDto payload)
        {
            var response = new RegisteredTeamDto();

            try
            {

                if (payload.Name == "")
                {
                    response.Data = null;
                    response.Message = "Invalid Input. Team is not defined.";
                    return response;
                }

                if (payload.TeamCaptainId == 0)
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

                var registeredTeam = await _teamService.AddAsync(new Team
                {
                    Name = payload.Name,
                    TeamCaptainId = payload.TeamCaptainId,
                    DefaultBackgroundColor = payload.BackgroundColor
                });

                if (registeredTeam != null)
                {

                    var teamCaptain = await _playerService.GetAsync(player => player.Id == payload.TeamCaptainId);


                    var registration = await _registrationService.AddAsync(new Registration
                    {
                        TeamId = registeredTeam.Id,
                        TeamCaptainId = payload.TeamCaptainId,
                        TournamentId = payload.TournamentId,
                        RegistrationDate = DateTime.Now,
                        Status = Utilities.Enums.RegistrationStatusEnum.Pending,
                    });

                    if (registration == null)
                    {
                        response.Data = null;
                        response.Message = "Registration Failed.";
                        return response;
                    }

                    if (registration != null)
                    {
                        var existingTournament = await _tournamentService.GetAsync(tournament => tournament.Id == registration.TournamentId);

                        existingTournament.NumberOfSlots = existingTournament.NumberOfSlots - 1;

                        var updatedTournament = await _tournamentService.UpdateAsync(existingTournament);

                        Console.WriteLine($"Slots are now only {updatedTournament.NumberOfSlots} left.");
                    }


                    var tournamentPlayers = payload.Members.Select(player => new TournamentPlayer
                    {
                        PlayerId = player,
                        TournamentId = payload.TournamentId,
                        DivisionId = 0,
                        RegistrationId = registration.Id,
                        TeamId = registeredTeam.Id,
                        PlayerType = PlayerTypeEnum.Member
                    }).ToList();

                    var registeredTournamentPlayers = await _tournamentPlayerService.AddRangeAsync(tournamentPlayers);


                    var tournamentTeamCaptain = await _tournamentPlayerService.AddAsync(new TournamentPlayer
                    {
                        PlayerId = teamCaptain.Id,
                        TournamentId = payload.TournamentId,
                        DivisionId = 0,
                        RegistrationId = registration.Id,
                        TeamId = registeredTeam.Id,
                        PlayerType = PlayerTypeEnum.Captain
                    });

                    response.Data.Registration = _mapper.Map<RegistrationDto>(registration);
                    response.Data.Team = _mapper.Map<TeamDto>(registeredTeam);
                    response.Message = "Team is now registered.";
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


        public async Task<RegisteredTournamentDto> RegisterTournament(RegisterTournamentDto payload)
        {
            var response = new RegisteredTournamentDto();

            if (payload == null)
            {
                response.Data = null;
                response.Message = "Invalid Input. Tournament details are missing.";
                return response;
            }

            if (String.IsNullOrWhiteSpace(payload!.Name))
            {
                response.Data = null;
                response.Message = "Invalid Input. Name is missing.";
                return response;
            }

            if (payload!.NumberOfSlots == 0)
            {
                response.Data = null;
                response.Message = "Invalid Input. Slots not defined.";
                return response;
            }

            var parsedEntity = _mapper.Map<Tournament>(payload);

            var tournament = await _tournamentService.AddAsync(parsedEntity);

            response.Data = tournament.Id != 0 ? _mapper.Map<TournamentDto>(tournament) : null;
            response.Message = tournament.Id != 0 ? "Tournament is successfully Registered" : "Failed to register tournament";

            return response;
        }
    }
}