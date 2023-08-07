using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class IsEnabledAdded : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.RenameColumn(
                name: "IsDisabled",
                table: "TeeTimeSchedules",
                newName: "IsSelected");

            migrationBuilder.AddColumn<bool>(
                name: "IsEnabled",
                table: "TeeTimeSchedules",
                type: "boolean",
                nullable: false,
                defaultValue: false);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "IsEnabled",
                table: "TeeTimeSchedules");

            migrationBuilder.RenameColumn(
                name: "IsSelected",
                table: "TeeTimeSchedules",
                newName: "IsDisabled");
        }
    }
}
