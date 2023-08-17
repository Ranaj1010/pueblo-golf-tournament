using AutoMapper;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Dto.Outgoing;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Services.Payments;
using pueblo_golf_tournament_api.Services.Persons;
using pueblo_golf_tournament_api.Services.Players;
using pueblo_golf_tournament_api.Services.Registrations;
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TeeTimeSchedules;
using pueblo_golf_tournament_api.Services.Tournaments;
using pueblo_golf_tournament_api.Services.TournamentTeamDivisions;

namespace pueblo_golf_tournament_api.Modules.Manage
{
    public class ManageModule : IManageModule
    {
        private readonly IPersonService _personService;
        private readonly IPlayerService _playerService;
        private readonly IRegistrationService _registrationService;
        private readonly IPaymentService _paymentService;
        private readonly ITeamService _teamService;
        private readonly ITeeTimeScheduleService _teeTimeScheduleService;
        private readonly ITournamentService _tournamentService;
        private readonly IMapper _mapper;
        private readonly ITournamentTeamDivisionService _tournamentTeamDivisionService;
        public ManageModule(IMapper mapper, ITournamentService tournamentService, ITournamentTeamDivisionService tournamentTeamDivisionService, ITeeTimeScheduleService teeTimeScheduleService, IRegistrationService registrationService, IPaymentService paymentService, ITeamService teamService, IPlayerService playerService, IPersonService personService)
        {
            _mapper = mapper;
            _tournamentService = tournamentService;
            _registrationService = registrationService;
            _teamService = teamService;
            _playerService = playerService;
            _personService = personService;
            _paymentService = paymentService;
            _teeTimeScheduleService = teeTimeScheduleService;
            _tournamentTeamDivisionService = tournamentTeamDivisionService;
        }

        public async Task<ConfirmPaymentResponseDto> ConfirmPayment(ConfirmPaymentRequestDto payment)
        {
            var response = new ConfirmPaymentResponseDto();
            var registration = await _registrationService.GetAsync(registration => registration.Id == payment.RegistrationId);

            if (registration == null)
            {
                response.Registration = null;
                response.Payment = null;
                response.Message = "Can't find registration";
                return response;
            }

            if (registration != null)
            {
                registration.Status = Utilities.Enums.RegistrationStatusEnum.Confirmed;

                var updatedRegistration = await _registrationService.UpdateAsync(registration);
                var existingPayment = await _paymentService.GetAsync(payment => payment.Id == registration.PaymentId);
                if (updatedRegistration != null)
                {
                    var existingTournament = await _tournamentService.GetAsync(tournament => tournament.Id == registration.TournamentId);

                    existingTournament.NumberOfSlots = existingTournament.NumberOfSlots - 1;
                    
                    var updatedTournament = await _tournamentService.UpdateAsync(existingTournament);

                    if(updatedTournament != null) {
                        response.Message = "Registration is now confirmed.";
                        response.Registration = _mapper.Map<RegistrationDto>(registration);
                        response.Payment = _mapper.Map<PaymentDto>(existingPayment);
                    }
                }
            }

            return response;
        }

        public async Task<PersonDto> UpdatePerson(PersonDto person)
        {
            var entity = await _personService.UpdateAsync(_mapper.Map<Person>(person));
            return _mapper.Map<PersonDto>(entity);
        }

        public async Task<PlayerDto> UpdatePlayer(PlayerDto player)
        {
            var entity = await _playerService.UpdateAsync(_mapper.Map<Player>(player));
            return _mapper.Map<PlayerDto>(entity);
        }

        public async Task<TeamDto> UpdateTeam(TeamDto team)
        {
            var entity = await _teamService.UpdateAsync(_mapper.Map<Team>(team));
            return _mapper.Map<TeamDto>(entity);
        }
        public async Task<TeeTimeScheduleDto> UpdateTeeTimeSchedule(TeeTimeScheduleDto tournament)
        {
            var entity = await _teeTimeScheduleService.UpdateAsync(_mapper.Map<TeeTimeSchedule>(tournament));
            return _mapper.Map<TeeTimeScheduleDto>(entity);
        }

        public async Task<TournamentDto> UpdateTournament(TournamentDto tournament)
        {
            var entity = await _tournamentService.UpdateAsync(_mapper.Map<Tournament>(tournament));
            return _mapper.Map<TournamentDto>(entity);
        }
    }
}