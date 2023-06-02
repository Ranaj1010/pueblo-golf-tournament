﻿// <auto-generated />
using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;
using pueblo_golf_tournament_api.Data;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    [DbContext(typeof(DataContext))]
    [Migration("20230601222816_HomeAddressAdded")]
    partial class HomeAddressAdded
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.4")
                .HasAnnotation("Relational:MaxIdentifierLength", 63);

            NpgsqlModelBuilderExtensions.HasPostgresExtension(modelBuilder, "postgis");
            NpgsqlModelBuilderExtensions.UseSerialColumns(modelBuilder);

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Account", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<int>("AccounType")
                        .HasColumnType("integer");

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("text");

                    b.Property<long>("PersonId")
                        .HasColumnType("bigint");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("PersonId");

                    b.ToTable("Accounts");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Division", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<long>("TournamentId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.HasIndex("TournamentId");

                    b.ToTable("Divisions");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.HomeClub", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<string>("Address")
                        .HasColumnType("text");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("City")
                        .HasColumnType("text");

                    b.Property<string>("Country")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("Province")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("HomeClubs");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Payment", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("PaymentDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("PaymentMethod")
                        .HasColumnType("text");

                    b.Property<string>("PaymentReferrencePhoto")
                        .HasColumnType("text");

                    b.Property<string>("ReferrenceId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Payments");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Person", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("BirthDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("ContactNumber")
                        .HasColumnType("text");

                    b.Property<string>("Country")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("EmailAddress")
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
                        .HasColumnType("text");

                    b.Property<string>("HomeAddress")
                        .HasColumnType("text");

                    b.Property<string>("LastName")
                        .HasColumnType("text");

                    b.Property<string>("MiddleName")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Persons");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Player", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<double>("Handicap")
                        .HasColumnType("double precision");

                    b.Property<string>("HomeClub")
                        .HasColumnType("text");

                    b.Property<double>("PersonId")
                        .HasColumnType("double precision");

                    b.Property<long?>("PersonId1")
                        .HasColumnType("bigint");

                    b.Property<string>("PlayerExternalId")
                        .HasColumnType("text");

                    b.Property<int>("PlayerType")
                        .HasColumnType("integer");

                    b.Property<string>("WorldHandicapSystemId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("PersonId1");

                    b.ToTable("Players");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Registration", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<bool>("IsPayed")
                        .HasColumnType("boolean");

                    b.Property<long?>("PaymentId")
                        .HasColumnType("bigint");

                    b.Property<DateTime>("RegistrationDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<int>("Status")
                        .HasColumnType("integer");

                    b.Property<long>("TeamCaptainId")
                        .HasColumnType("bigint");

                    b.Property<long?>("TeamId")
                        .HasColumnType("bigint");

                    b.Property<long?>("TournamentId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.ToTable("Registrations");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Team", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("DefaultBackgroundColor")
                        .HasColumnType("text");

                    b.Property<string>("LogoUrl")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<long>("TeamCaptainId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.ToTable("Teams");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Tournament", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("BannerPhoto")
                        .HasColumnType("text");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<int>("NumberOfSlots")
                        .HasColumnType("integer");

                    b.Property<double>("RegistrationFee")
                        .HasColumnType("double precision");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("timestamp without time zone");

                    b.Property<string>("VenueAddress")
                        .HasColumnType("text");

                    b.Property<string>("VenueCity")
                        .HasColumnType("text");

                    b.Property<string>("VenueCountry")
                        .HasColumnType("text");

                    b.Property<string>("VenuePlace")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("Tournaments");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.TournamentPlayer", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("ArchivedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<DateTime>("CreatedAt")
                        .HasColumnType("timestamp without time zone");

                    b.Property<long>("DivisionId")
                        .HasColumnType("bigint");

                    b.Property<long>("PlayerId")
                        .HasColumnType("bigint");

                    b.Property<int>("PlayerType")
                        .HasColumnType("integer");

                    b.Property<long>("RegistrationId")
                        .HasColumnType("bigint");

                    b.Property<long>("TeamId")
                        .HasColumnType("bigint");

                    b.Property<long>("TournamentId")
                        .HasColumnType("bigint");

                    b.HasKey("Id");

                    b.ToTable("TournamentPlayers");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Account", b =>
                {
                    b.HasOne("pueblo_golf_tournament_api.Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Person");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Division", b =>
                {
                    b.HasOne("pueblo_golf_tournament_api.Entities.Tournament", "Tournament")
                        .WithMany()
                        .HasForeignKey("TournamentId")
                        .OnDelete(DeleteBehavior.Cascade)
                        .IsRequired();

                    b.Navigation("Tournament");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Player", b =>
                {
                    b.HasOne("pueblo_golf_tournament_api.Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonId1");

                    b.Navigation("Person");
                });
#pragma warning restore 612, 618
        }
    }
}
