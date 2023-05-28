using AutoMapper;
using Newtonsoft.Json;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Extensions;
using pueblo_golf_tournament_api.Services.Accounts;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;

namespace pueblo_golf_tournament_api.Modules.Authentications
{
    public class AuthModule : IAuthModule
    {
        private readonly IAccountService _accountService;
        private readonly IPersonService _personService;
        private readonly IPlayerService _playerService;
        private readonly IMapper _mapper;

        public AuthModule(IMapper mapper, IAccountService accountService, IPersonService personService, IPlayerService playerService)
        {
            _mapper = mapper;
            _accountService = accountService;
            _personService = personService;
            _playerService = playerService;
        }

        public async Task<AuthenticationLoginDto> Login(AuthenticateLoginDto payload)
        {
            var response = new AuthenticationLoginDto();

            if (payload == null || string.IsNullOrEmpty(payload.Username) || string.IsNullOrEmpty(payload.Password))
            {
                response.Authenticated = false;
                response.Message = "Invalid request parameters";
            };

            var account = await _accountService.GetAsync(account => account.Username.Equals(payload!.Username));

            if (account == null)
            {
                response.Authenticated = false;
                response.Message = "Incorrect Username or password. Please try again later.";
                return response;
            }

            var validatedPassword = HashExtensions.ValidateHash(payload!.Password!, account.Password!);

            if (!validatedPassword)
            {
                response.Authenticated = false;
                response.Message = "Incorrect Username or password. Please try again later.";
                return response;
            }

            var person = await _personService.GetAsync(person => person.Id.Equals(account.PersonId));

            account.Password = "";
            
            response.Data = new AuthenticatedUserData
            {
                PersonalDetails = _mapper.Map<PersonDto>(person),
                Account = _mapper.Map<AccountDto>(account),
                Username = account.Username
            };
            
            Console.WriteLine(response.Data.Account.AccountType);

            response.Authenticated = true;
            response.Message = "Account is authenticated.";

            return response;
        }
    }
}