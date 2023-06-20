using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class AddedPaymentChannelRelation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_PaymentChannelAccounts_PaymentChannelId",
                table: "PaymentChannelAccounts",
                column: "PaymentChannelId");

            migrationBuilder.AddForeignKey(
                name: "FK_PaymentChannelAccounts_PaymentChannels_PaymentChannelId",
                table: "PaymentChannelAccounts",
                column: "PaymentChannelId",
                principalTable: "PaymentChannels",
                principalColumn: "Id",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_PaymentChannelAccounts_PaymentChannels_PaymentChannelId",
                table: "PaymentChannelAccounts");

            migrationBuilder.DropIndex(
                name: "IX_PaymentChannelAccounts_PaymentChannelId",
                table: "PaymentChannelAccounts");
        }
    }
}
