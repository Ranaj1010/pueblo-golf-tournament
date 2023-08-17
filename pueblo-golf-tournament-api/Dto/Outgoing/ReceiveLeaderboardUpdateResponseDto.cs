namespace pueblo_golf_tournament_api.Dto.Outgoing
{
    public class ReceiveLeaderboardUpdateResponseDto
    {
        public List<DivisionLeaderBoard> Data { get; set; }
    }

    public class DivisionLeaderBoard { 
        public DivisionDto Division { get; set; }
        public List<LeaderboardDto> LeaderBoard { get; set; } = new List<LeaderboardDto>();
    }
}