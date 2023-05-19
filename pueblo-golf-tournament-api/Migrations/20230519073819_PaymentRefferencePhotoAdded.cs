using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class PaymentRefferencePhotoAdded : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<string>(
                name: "PaymentReferrencePhoto",
                table: "Payments",
                type: "text",
                nullable: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PaymentReferrencePhoto",
                table: "Payments");
        }
    }
}
