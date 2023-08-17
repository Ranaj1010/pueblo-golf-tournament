using Microsoft.AspNetCore.SignalR;

namespace pueblo_golf_tournament_api.Hub
{
    public class ServiceHub : Hub<IServiceHub>
    {
        public override Task OnConnectedAsync()
        {
            Console.WriteLine($"User :{Context.ConnectionId} is now connected.");

            return base.OnConnectedAsync();
        }

        public override Task OnDisconnectedAsync(Exception exception)
        {
            Console.WriteLine($"User :{Context.ConnectionId} has been disconnected.");

            return base.OnDisconnectedAsync(exception);
        }
    }
}