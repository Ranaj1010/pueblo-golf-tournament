using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace pueblo_golf_tournament_api.Migrations
{
    /// <inheritdoc />
    public partial class RemovedPaymentConfirmation : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "PaymentConfirmationDate",
                table: "Registrations");

            migrationBuilder.CreateIndex(
                name: "IX_Registrations_PaymentId",
                table: "Registrations",
                column: "PaymentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Registrations_Payments_PaymentId",
                table: "Registrations",
                column: "PaymentId",
                principalTable: "Payments",
                principalColumn: "Id");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Registrations_Payments_PaymentId",
                table: "Registrations");

            migrationBuilder.DropIndex(
                name: "IX_Registrations_PaymentId",
                table: "Registrations");

            migrationBuilder.AddColumn<DateTime>(
                name: "PaymentConfirmationDate",
                table: "Registrations",
                type: "timestamp with time zone",
                nullable: true);
        }
    }
}
