using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class PlayersRefactored : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Players_Teams_TeamId1",
                table: "Players");

            migrationBuilder.DropIndex(
                name: "IX_Players_TeamId1",
                table: "Players");

            migrationBuilder.DropColumn(
                name: "DivisionId",
                table: "Players");

            migrationBuilder.DropColumn(
                name: "TeamId",
                table: "Players");

            migrationBuilder.DropColumn(
                name: "TeamId1",
                table: "Players");

            migrationBuilder.DropColumn(
                name: "TournamentId",
                table: "Players");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<double>(
                name: "DivisionId",
                table: "Players",
                type: "double precision",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<double>(
                name: "TeamId",
                table: "Players",
                type: "double precision",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.AddColumn<long>(
                name: "TeamId1",
                table: "Players",
                type: "bigint",
                nullable: true);

            migrationBuilder.AddColumn<double>(
                name: "TournamentId",
                table: "Players",
                type: "double precision",
                nullable: false,
                defaultValue: 0.0);

            migrationBuilder.CreateIndex(
                name: "IX_Players_TeamId1",
                table: "Players",
                column: "TeamId1");

            migrationBuilder.AddForeignKey(
                name: "FK_Players_Teams_TeamId1",
                table: "Players",
                column: "TeamId1",
                principalTable: "Teams",
                principalColumn: "Id");
        }
    }
}
