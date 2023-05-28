using AutoMapper;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Utilities.Enums;

namespace pueblo_golf_tournament_api.Extensions
{
    public class MappingExtensions : Profile
    {
        public MappingExtensions()
        {
            CreateMap<Account, AccountDto>().ForMember(destination => destination.AccountType,
                 opt => opt.MapFrom(source => Enum.GetName(typeof(AccountTypeEnum), source.AccounType))).ReverseMap();
            CreateMap<Division, DivisionDto>().ReverseMap();
            CreateMap<HomeClub, HomeClubDto>().ReverseMap();
            CreateMap<Person, PersonDto>().ReverseMap();
            CreateMap<Player, PlayerDto>().ForMember(destination => destination.PlayerType,
                 opt => opt.MapFrom(source => Enum.GetName(typeof(PlayerTypeEnum), source.PlayerType))).ReverseMap();
            CreateMap<Team, TeamDto>().ReverseMap();
            CreateMap<Tournament, TournamentDto>().ReverseMap();
            CreateMap<Registration, RegistrationDto>().ForMember(destination => destination.Status,
                 opt => opt.MapFrom(source => Enum.GetName(typeof(RegistrationStatusEnum), source.Status))).ReverseMap();

            CreateMap<Account, AccountRawDto>().ReverseMap();
            CreateMap<Division, DivisionRawDto>().ReverseMap();
            CreateMap<HomeClub, HomeClubRawDto>().ReverseMap();
            CreateMap<Person, RegisterPersonDto>().ReverseMap();
            CreateMap<Player, RegisterPlayerDto>().ReverseMap();
            CreateMap<Payment, PaymentDto>().ReverseMap();
            CreateMap<Team, TeamRawDto>().ReverseMap();
            CreateMap<Tournament, RegisterTournamentDto>().ReverseMap();
            CreateMap<TournamentPlayer, TournamentPlayerDto>().ReverseMap();
            CreateMap<Registration, RegistrationRawDto>().ReverseMap();

            CreateMap<Division, RegisterDivisionDto>().ReverseMap();
            CreateMap<Tournament, RegisterTournamentDto>().ReverseMap();
            CreateMap<HomeClub, RegisterHomeClubDto>().ReverseMap();
        }
    }
}