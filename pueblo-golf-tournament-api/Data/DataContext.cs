using Microsoft.EntityFrameworkCore;
using pueblo_golf_tournament_api.Entities;

namespace pueblo_golf_tournament_api.Data
{
    public class DataContext : DbContext
    {
        public DataContext()
        {

        }
        public DataContext(DbContextOptions<DataContext> options) : base(options) { }
        public DbSet<Account> Accounts { get; set; }
        public DbSet<Person> Persons { get; set; }
        public DbSet<Player> Players { get; set; }
        public DbSet<Team> Teams { get; set; }
        public DbSet<Division> Divisions { get; set; }
        public DbSet<HomeClub> HomeClubs { get; set; }
        public DbSet<Tournament> Tournaments { get; set; }
        public DbSet<Payment> Payments { get; set; }
        public DbSet<PaymentChannel> PaymentChannels { get; set; }
        public DbSet<PaymentChannelAccount> PaymentChannelAccounts { get; set; }
        public DbSet<Registration> Registrations { get; set; }
        public DbSet<TournamentPlayer> TournamentPlayers { get; set; }
        public DbSet<TeeTimeSchedule> TeeTimeSchedules { get; set; }
        public DbSet<PlayerTeeTimeSchedule> PlayerTeeTimeSchedules { get; set; }
        public DbSet<TournamentHole> TournamentHoles { get; set; }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
            => optionsBuilder.UseNpgsql("Host=localhost;Database=pueblo_golf_tournament_db;Username=postgres;Password=Baba101095", x => x.UseNetTopologySuite());
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.UseSerialColumns();
            modelBuilder.HasPostgresExtension("postgis");
        }
    }
}