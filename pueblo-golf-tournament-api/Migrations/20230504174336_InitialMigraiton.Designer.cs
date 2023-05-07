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
    [Migration("20230504174336_InitialMigraiton")]
    partial class InitialMigraiton
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

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<string>("Password")
                        .HasColumnType("text");

                    b.Property<long>("PersonId")
                        .HasColumnType("bigint");

                    b.Property<string>("Username")
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

                    b.Property<string>("City")
                        .HasColumnType("text");

                    b.Property<string>("Country")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<string>("Province")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.ToTable("HomeClubs");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Person", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<DateTime>("BirthDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<int>("ContactNumber")
                        .HasColumnType("integer");

                    b.Property<string>("Country")
                        .HasColumnType("text");

                    b.Property<string>("EmailAddress")
                        .HasColumnType("text");

                    b.Property<string>("FirstName")
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

                    b.Property<double>("DivisionId")
                        .HasColumnType("double precision");

                    b.Property<long?>("DivisionId1")
                        .HasColumnType("bigint");

                    b.Property<double>("Handicap")
                        .HasColumnType("double precision");

                    b.Property<double>("HomeClubId")
                        .HasColumnType("double precision");

                    b.Property<long?>("HomeClubId1")
                        .HasColumnType("bigint");

                    b.Property<double>("PersonId")
                        .HasColumnType("double precision");

                    b.Property<long?>("PersonId1")
                        .HasColumnType("bigint");

                    b.Property<int>("PlayerType")
                        .HasColumnType("integer");

                    b.Property<double>("TeamId")
                        .HasColumnType("double precision");

                    b.Property<long?>("TeamId1")
                        .HasColumnType("bigint");

                    b.Property<string>("WorldHandicapSystemId")
                        .HasColumnType("text");

                    b.HasKey("Id");

                    b.HasIndex("DivisionId1");

                    b.HasIndex("HomeClubId1");

                    b.HasIndex("PersonId1");

                    b.HasIndex("TeamId1");

                    b.ToTable("Players");
                });

            modelBuilder.Entity("pueblo_golf_tournament_api.Entities.Team", b =>
                {
                    b.Property<long>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("bigint");

                    NpgsqlPropertyBuilderExtensions.UseSerialColumn(b.Property<long>("Id"));

                    b.Property<bool>("Active")
                        .HasColumnType("boolean");

                    b.Property<string>("LogoUrl")
                        .HasColumnType("text");

                    b.Property<string>("Name")
                        .HasColumnType("text");

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

                    b.Property<DateTime>("EndDate")
                        .HasColumnType("timestamp with time zone");

                    b.Property<string>("Name")
                        .HasColumnType("text");

                    b.Property<int>("NumberOfSlots")
                        .HasColumnType("integer");

                    b.Property<DateTime>("StartDate")
                        .HasColumnType("timestamp with time zone");

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
                    b.HasOne("pueblo_golf_tournament_api.Entities.Division", "Division")
                        .WithMany()
                        .HasForeignKey("DivisionId1");

                    b.HasOne("pueblo_golf_tournament_api.Entities.HomeClub", "HomeClub")
                        .WithMany()
                        .HasForeignKey("HomeClubId1");

                    b.HasOne("pueblo_golf_tournament_api.Entities.Person", "Person")
                        .WithMany()
                        .HasForeignKey("PersonId1");

                    b.HasOne("pueblo_golf_tournament_api.Entities.Team", "Team")
                        .WithMany()
                        .HasForeignKey("TeamId1");

                    b.Navigation("Division");

                    b.Navigation("HomeClub");

                    b.Navigation("Person");

                    b.Navigation("Team");
                });
#pragma warning restore 612, 618
        }
    }
}
