using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class RefactoredPaymentEntity : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PaymentChannelId",
                table: "Payments");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<long>(
                name: "PaymentChannelId",
                table: "Payments",
                type: "bigint",
                nullable: false,
                defaultValue: 0L);
        }
    }
}
