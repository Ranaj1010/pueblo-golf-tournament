namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class SetupPlayerTeeTimeScheduleRequestDto
    {
        public long PlayerId { get; set; }
        public List<TeeTimeScheduleDto> TeeTimeSchedules { get; set; } = new List<TeeTimeScheduleDto>();
    }
}