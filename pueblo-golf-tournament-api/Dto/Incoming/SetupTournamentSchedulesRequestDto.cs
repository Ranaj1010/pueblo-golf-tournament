namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class SetupTournamentSchedulesRequestDto
    {
        public long TournamentId { get; set; }
        public List<Schedule> Schedules { get; set; } = new List<Schedule>();
    }

    public class Schedule
    {
        public DateTime Date { get; set; }
        public List<TimeSlot> TimeSeries { get; set; } = new List<TimeSlot>();
    }

    public class TimeSlot
    {
        public DateTime TimeSeriesSlot { get; set; }
        public bool IsEnabled { get; set; }
        public bool IsSelected { get; set; }
    }
}