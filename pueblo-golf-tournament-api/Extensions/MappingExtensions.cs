using AutoMapper;
using pueblo_golf_tournament_api.Dto;
using pueblo_golf_tournament_api.Dto.Incoming;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Extensions
{
    public class MappingExtensions : Profile
    {
        public MappingExtensions()
        {
            CreateMap<Account, AccountDto>().ReverseMap();
            CreateMap<Division, DivisionDto>().ReverseMap();
            CreateMap<HomeClub, HomeClubDto>().ReverseMap();
            CreateMap<Person, PersonDto>().ReverseMap();
            CreateMap<Player, PlayerDto>().ReverseMap();
            CreateMap<Team, TeamDto>().ReverseMap();
            CreateMap<Tournament, TournamentDto>().ReverseMap();
            CreateMap<Registration, RegistrationDto>().ReverseMap();

            CreateMap<Account, AccountRawDto>().ReverseMap();
            CreateMap<Division, DivisionRawDto>().ReverseMap();
            CreateMap<HomeClub, HomeClubRawDto>().ReverseMap();
            CreateMap<Person, PersonRawDto>().ReverseMap();
            CreateMap<Player, PlayerRawDto>().ReverseMap();
            CreateMap<Team, TeamRawDto>().ReverseMap();
            CreateMap<Tournament, TournamentRawDto>().ReverseMap();
            CreateMap<Registration, RegistrationRawDto>().ReverseMap();

            CreateMap<Division, RegisterDivisionDto>().ReverseMap();
            CreateMap<Tournament, RegisterTournamentDto>().ReverseMap();
            CreateMap<HomeClub, RegisterHomeClubDto>().ReverseMap();
        }
    }
}