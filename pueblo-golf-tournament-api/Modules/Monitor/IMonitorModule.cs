namespace pueblo_golf_tournament_api.Modules.Monitor
{
    public interface IMonitorModule
    {
        Task MonitorLeaderBoard(long tournamentId);
    }
}