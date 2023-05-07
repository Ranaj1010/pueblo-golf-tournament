using System;
using Microsoft.EntityFrameworkCore.Migrations;
using Npgsql.EntityFrameworkCore.PostgreSQL.Metadata;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class RegistrationsAndPaymentsAdded : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Players_Divisions_DivisionId1",
                table: "Players");

            migrationBuilder.DropIndex(
                name: "IX_Players_DivisionId1",
                table: "Players");

            migrationBuilder.DropColumn(
                name: "DivisionId1",
                table: "Players");

            migrationBuilder.CreateTable(
                name: "Payments",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.SerialColumn),
                    PaymentMethod = table.Column<string>(type: "text", nullable: true),
                    ReferrenceId = table.Column<string>(type: "text", nullable: true),
                    PaymentDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    Active = table.Column<bool>(type: "boolean", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Payments", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "Registrations",
                columns: table => new
                {
                    Id = table.Column<long>(type: "bigint", nullable: false)
                        .Annotation("Npgsql:ValueGenerationStrategy", NpgsqlValueGenerationStrategy.SerialColumn),
                    TeamId = table.Column<long>(type: "bigint", nullable: true),
                    TournamentId = table.Column<long>(type: "bigint", nullable: true),
                    DivisionId = table.Column<long>(type: "bigint", nullable: true),
                    Status = table.Column<int>(type: "integer", nullable: false),
                    RegistrationDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: false),
                    PaymentConfirmationDate = table.Column<DateTime>(type: "timestamp with time zone", nullable: true),
                    PaymentId = table.Column<long>(type: "bigint", nullable: true),
                    Active = table.Column<bool>(type: "boolean", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Registrations", x => x.Id);
                });
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Payments");

            migrationBuilder.DropTable(
                name: "Registrations");

            migrationBuilder.AddColumn<long>(
                name: "DivisionId1",
                table: "Players",
                type: "bigint",
                nullable: true);

            migrationBuilder.CreateIndex(
                name: "IX_Players_DivisionId1",
                table: "Players",
                column: "DivisionId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Players_Divisions_DivisionId1",
                table: "Players",
                column: "DivisionId1",
                principalTable: "Divisions",
                principalColumn: "Id");
        }
    }
}
