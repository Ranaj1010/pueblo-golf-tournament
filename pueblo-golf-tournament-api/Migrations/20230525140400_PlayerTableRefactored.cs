using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class PlayerTableRefactored : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "DivisionId",
                table: "Registrations");

            migrationBuilder.AddColumn<bool>(
                name: "IsPayed",
                table: "Registrations",
                type: "boolean",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AlterColumn<string>(
                name: "HomeClub",
                table: "Players",
                type: "text",
                nullable: true,
                oldClrType: typeof(string),
                oldType: "text");

            migrationBuilder.AddColumn<double>(
                name: "TournamentId",
                table: "Players",
                type: "double precision",
                nullable: false,
                defaultValue: 0.0);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsPayed",
                table: "Registrations");

            migrationBuilder.DropColumn(
                name: "TournamentId",
                table: "Players");

            migrationBuilder.AddColumn<long>(
                name: "DivisionId",
                table: "Registrations",
                type: "bigint",
                nullable: true);

            migrationBuilder.AlterColumn<string>(
                name: "HomeClub",
                table: "Players",
                type: "text",
                nullable: false,
                defaultValue: "",
                oldClrType: typeof(string),
                oldType: "text",
                oldNullable: true);
        }
    }
}
