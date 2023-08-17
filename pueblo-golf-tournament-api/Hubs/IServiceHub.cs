using pueblo_golf_tournament_api.Dto.Outgoing;

namespace pueblo_golf_tournament_api.Hub
{
    public interface IServiceHub
    {
        Task ReceiveTestMessage(string message);
        Task ReceiveLeaderBoardUpdates(ReceiveLeaderboardUpdateResponseDto data);
    }
}