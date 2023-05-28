namespace pueblo_golf_tournament_api.Dto.Incoming
{
    public class LookupPlayerProfileRequestDto
    {
        public string PlayerExternalId { get; set; }
    }
    public class LookupPlayerProfileByPersonIdRequestDto
    {
        public long PersonId { get; set; }
    }
}