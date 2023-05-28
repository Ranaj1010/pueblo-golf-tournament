using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class TeamCaptainIdAddedInTeamTabloe : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "TeamCaptainId",
                table: "Teams",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "TeamCaptainId",
                table: "Teams");
        }
    }
}
