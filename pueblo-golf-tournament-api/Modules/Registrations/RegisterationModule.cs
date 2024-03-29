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
using pueblo_golf_tournament_api.Services.PaymentChannelAccounts;
using pueblo_golf_tournament_api.Services.PaymentChannels;
using pueblo_golf_tournament_api.Services.Payments;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Scorers;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TournamentPlayers;
using pueblo_golf_tournament_api.Services.Tournaments;
using pueblo_golf_tournament_api.Services.TournamentScorers;
using pueblo_golf_tournament_api.Services.TournamentTeamDivisions;
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
        private readonly IPaymentChannelService _paymentChannelService;
        private readonly IPaymentChannelAccountService _paymentChannelAccountService;
        private readonly IPersonService _personService;
        private readonly ITeamService _teamService;
        private readonly ITournamentPlayerService _tournamentPlayerService;
        private readonly IAccountService _accountService;
        private readonly IScorerService _scorerService;
        private readonly ITournamentScorerService _tournamentScorerService;
        private readonly ITournamentTeamDivisionService _tournamentTeamDivisionService;
        private readonly IUploadModule _uploadModule;
        private readonly DataContext _dbContext;
        private readonly IMapper _mapper;
        public RegisterationModule(IMapper mapper, DataContext dbContext, ITournamentTeamDivisionService tournamentTeamDivisionService, ITournamentScorerService tournamentScorerService, IScorerService scorerService, IPaymentChannelService paymentChannelService, IPaymentChannelAccountService paymentChannelAccountService, IUploadModule uploadModule, ITournamentService tournamentService, ITournamentPlayerService tournamentPlayerService, IDivisionService divisionService, IHomeClubService homeClubService, IRegistrationService registrationService, IPlayerService playerService, ITeamService teamService, IPersonService personService, IPaymentService paymentService, IAccountService accountService)
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
            _paymentChannelService = paymentChannelService;
            _paymentChannelAccountService = paymentChannelAccountService;
            _scorerService = scorerService;
            _tournamentScorerService = tournamentScorerService;
            _tournamentTeamDivisionService = tournamentTeamDivisionService;
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
                AccountName = payload.AccountName,
                AccountNumber = payload.AccountNumber,
                PaymentChannelAccountId = payload.PaymentChannelAccountId,
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

        public async Task<RegisteredPaymentChannelResponseDto> RegisterPaymentChannel(RegisterPaymentChannelRequestDto payload)
        {
            var response = new RegisteredPaymentChannelResponseDto();

            try
            {
                var registered = await _paymentChannelService.AddAsync(_mapper.Map<PaymentChannel>(payload));

                response.Data = _mapper.Map<PaymentChannelDto>(registered);
                response.Message = "Payment Channel is successfully registered.";

                return response;
            }
            catch (System.Exception)
            {

                response.Data = null;
                response.Message = "Failed to register Payment Channel Account. Please try again later.";
                return response;
            }

        }

        public async Task<RegisteredPaymentChannelAccountResponseDto> RegisterPaymentChannelAccount(RegisterPaymentChannelAccountRequestDto payload)
        {
            var response = new RegisteredPaymentChannelAccountResponseDto();

            try
            {
                var paymentChannel = await _paymentChannelService.GetAsync(paymentChannel => paymentChannel.Id == payload.PaymentChannelId);

                if (paymentChannel == null)
                {
                    response.Data = null;
                    response.Message = "Payment Channel not found. Please try again later.";
                    return response;
                }

                var registered = await _paymentChannelAccountService.AddAsync(_mapper.Map<PaymentChannelAccount>(payload));
                registered.PaymentChannel = paymentChannel;
                response.Data = _mapper.Map<PaymentChannelAccountDto>(registered);
                response.Message = "Payment Channel Account is successfully registered.";

                return response;
            }
            catch (System.Exception)
            {
                response.Data = null;
                response.Message = "Failed to register Payment Channel. Please try again later.";

                return response;
            }
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



        public async Task<RegisteredTournamentPlayerDto> RegisterPlayerToTeam(RegisterTournamentPlayerDto payload)
        {
            var response = new RegisteredTournamentPlayerDto();

            var player = new TournamentPlayer
            {
                PlayerId = payload.PlayerId,
                TournamentId = payload.TournamentId,
                DivisionId = 0,
                RegistrationId = payload.RegistrationId,
                TeamId = payload.TeamId,
                PlayerType = PlayerTypeEnum.Member
            };

            await _tournamentPlayerService.AddAsync(player);


            response.Data = _mapper.Map<TournamentPlayerDto>(player);
            response.Message = "Player added";

            return response;
        }

        public async Task<RegisteredScorerDto> RegisterScorer(RegisterScorerRequestDto payload)
        {
            var response = new RegisteredScorerDto();

            if (payload.Person == null)
            {
                response.Message = "Invalid request. Please complete the form";
                return response;
            }

            var registeredPerson = await RegisterPerson(payload.Person);

            if (registeredPerson == null)
            {
                response.Message = "Failed to register scorer. Person not registered.";
                return response;
            }

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
            account.AccounType = AccountTypeEnum.Scorer;

            var registeredAccount = await _accountService.AddAsync(account);

            if (registeredAccount.Id == 0)
            {
                response.Data = null;
                response.Message = "Failed to register scorer's account. Please try again";
                return response;
            }

            var registeredScorer = await _scorerService.AddAsync(new Scorer
            {
                PersonId = registeredPerson.Data.Id,
            });

            response.Data = new ScorerData
            {
                Scorer = _mapper.Map<ScorerDto>(registeredScorer),
                Person = registeredPerson.Data
            };

            response.Message = "Scorer has successfully registered.";

            return response;
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

                var existingTeamName = await _teamService.GetAsync(team => team.Name.Equals(payload.Name));

                var registeredTeam = existingTeamName != null ? existingTeamName : await _teamService.AddAsync(new Team
                {
                    Name = payload.Name,
                    TeamCaptainId = payload.TeamCaptainId,
                    DefaultBackgroundColor = payload.BackgroundColor
                });

                if (registeredTeam != null)
                {

                    var teamCaptain = await _playerService.GetAsync(player => player.Id == payload.TeamCaptainId);

                    var existingRegistration = await _registrationService.GetAsync(registration => registration.TeamId == registeredTeam.Id && registration.TournamentId == payload.TournamentId);

                    if (existingRegistration != null)
                    {
                        response.Data = null;
                        response.Message = "Invalid Input. Registration already exists.";
                        return response;
                    }

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

                    if (payload.Members.Count > 0)
                    {
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
                    }


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
            catch (Exception ex)
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

        public async Task<RegisteredTournamentScorerDto> RegisterTournamentScorer(RegisterTournamentScorerDto payload)
        {
            var response = new RegisteredTournamentScorerDto();

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == payload.TournamentId);

            if(tournament == null) 
            {
                response.Success = false;
                response.Message = "Tournament not found.";
                return response;
            }

            var scorer = await _scorerService.GetAsync(scorer => scorer.Id == payload.ScorerId);

            if(tournament == null) 
            {
                response.Success = false;
                response.Message = "Scorer not found.";
                return response;
            }

            var registeredTournamentScorer = await _tournamentScorerService.AddAsync(new TournamentScorer
            {
                ScorerId = payload.ScorerId,
                TournamentId = payload.TournamentId,
            });

            response.Success = true;
            response.Message = "Scorer is now assigned to Tournament.";

            return response;
        }

        public async Task<RegisteredTeamDivisionDto> RegisterTournamentTeamDivision(RegisterTeamDivisionDto payload)
        {
            var response = new RegisteredTeamDivisionDto();

            var tournament = await _tournamentService.GetAsync(tournament => tournament.Id == payload.TournamentId);

            if (tournament == null)
            {
                response.Message = "Tournament not found.";
                return response;
            }
           
            var team = await _teamService.GetAsync(team => team.Id == payload.TeamId);

            if (tournament == null)
            {
                response.Message = "Team not found.";
                return response;
            }

            var teamDivision = await _tournamentTeamDivisionService.AddAsync(new TournamentTeamDivision{
                TournamentId = payload.TournamentId,
                TeamId = payload.TeamId,
                DivisionId = payload.DivisionId,
            });

            response.Data = _mapper.Map<TournamentTeamDivisionDto>(teamDivision);

            return response;
        }
    }
}