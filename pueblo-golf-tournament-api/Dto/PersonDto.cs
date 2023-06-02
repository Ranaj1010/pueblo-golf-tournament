using pueblo_golf_tournament_api.Base;

namespace pueblo_golf_tournament_api.Dto
{
    public class PersonDto : BaseDto
    {
        public string? FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string? LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string? ContactNumber { get; set; }
        public string? HomeAddress { get; set; }
        public string? City { get; set; }
        public string? EmailAddress { get; set; }
        public string? Country { get; set; }
    }
    public class PersoRawDto
    {
        public string? FirstName { get; set; }
        public string? MiddleName { get; set; }
        public string? LastName { get; set; }
        public DateTime BirthDate { get; set; }
        public string? ContactNumber { get; set; }
        public string? EmailAddress { get; set; }
        public string? Country { get; set; }
    }

}