using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Internal;
using pueblo_golf_tournament_api.Configurations;
using pueblo_golf_tournament_api.Data;
using pueblo_golf_tournament_api.Entities;
using pueblo_golf_tournament_api.Modules.Authentications;
using pueblo_golf_tournament_api.Modules.Lookups;
using pueblo_golf_tournament_api.Modules.Manage;
using pueblo_golf_tournament_api.Modules.Registrations;
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
using pueblo_golf_tournament_api.Services.Teams;
using pueblo_golf_tournament_api.Services.TournamentPlayers;
using pueblo_golf_tournament_api.Services.Tournaments;

namespace pueblo_golf_tournament_api.Extensions
{
    public static class ServiceExtensions
    {
        public static void ConfigureSwagger(this IServiceCollection services)
        {
            services.AddApiVersioning(setup =>
            {
                setup.DefaultApiVersion = new ApiVersion(1, 0);
                setup.AssumeDefaultVersionWhenUnspecified = true;
                setup.ReportApiVersions = true;
            });

            services.AddVersionedApiExplorer(setup =>
           {
               setup.GroupNameFormat = "'v'VVV";
               setup.SubstituteApiVersionInUrl = true;
           });


            services.AddSwaggerGen(c =>
            {
                c.EnableAnnotations();
            });
            services.ConfigureOptions<ConfigureSwaggerOptions>();
        }

        public static void ConfigureAutomapper(this IServiceCollection services)
        {
            services.AddAutoMapper(AppDomain.CurrentDomain.GetAssemblies());
        }

        public static void ConfigureDependencyInjection(this IServiceCollection services)
        {

            #region Services
            services.AddTransient<ITournamentService, TournamentService>();
            services.AddTransient<ITeamService, TeamService>();
            services.AddTransient<IDivisionService, DivisionService>();
            services.AddTransient<IHomeClubService, HomeClubService>();
            services.AddTransient<IPlayerService, PlayerService>();
            services.AddTransient<IPersonService, PersonService>();
            services.AddTransient<IAccountService, AccountService>();
            services.AddTransient<IRegistrationService, RegistrationService>();
            services.AddTransient<IPaymentService, PaymentService>();
            services.AddTransient<IPaymentChannelService, PaymentChannelService>();
            services.AddTransient<IPaymentChannelAccountService, PaymentChannelAccountService>();
            services.AddTransient<ITournamentPlayerService, TournamentPlayerService>();
            #endregion

            #region Modules
            services.AddTransient<IRegistrationModule, RegisterationModule>();
            services.AddTransient<ILookupModule, LookupModule>();
            services.AddTransient<IAuthModule, AuthModule>();
            services.AddTransient<IUploadModule, UploadModule>();
            services.AddTransient<IManageModule, ManageModule>();
            #endregion
        }

        public static void ConfigureDBContext(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddDbContext<DataContext>(database => database.UseNpgsql(configuration.GetConnectionString("DefaultConnection"), x => x.UseNetTopologySuite()), ServiceLifetime.Transient, ServiceLifetime.Singleton);
        }

        public static void ConfigureCORS(this IServiceCollection services, IConfiguration configuration, string allowedOrigin)
        {

            services.AddCors(options =>
            {
                options.AddPolicy(allowedOrigin, policy => policy.WithOrigins("http://localhost:3000","http://localhost:63612", "http://localhost:64461").AllowAnyHeader().AllowAnyMethod());
            });
        }
    }
}