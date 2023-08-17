using pueblo_golf_tournament_api.Extensions;
using pueblo_golf_tournament_api.Hub;

var builder = WebApplication.CreateBuilder(args);
var allowedOrigin = "AllowedOrigin";
// Add services to the container.
AppContext.SetSwitch("Npgsql.EnableLegacyTimestampBehavior", true);
builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle

builder.Services.AddEndpointsApiExplorer();
builder.Services.ConfigureSwagger();
builder.Services.ConfigureAutomapper();
builder.Services.ConfigureDependencyInjection();
builder.Services.ConfigureDBContext(builder.Configuration);
builder.Services.ConfigureCORS(builder.Configuration, allowedOrigin);

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();

    app.UseSwaggerUI();

    app.UseStaticFiles();

    app.UseHttpsRedirection();

    app.UseAuthorization();

    app.MapControllers();

    app.UseCors(allowedOrigin);

    app.MapHub<ServiceHub>("/serviceHub");

    app.Run(builder.Configuration.GetSection("BaseUrl").Value);
}

if (!app.Environment.IsDevelopment())
{
    app.UseSwagger();

    app.UseSwaggerUI();

    app.UseStaticFiles();

    app.UseHttpsRedirection();

    app.UseAuthorization();

    app.MapControllers();

    app.UseCors(allowedOrigin);

    app.MapHub<ServiceHub>("/serviceHub");

    app.Run();
}


