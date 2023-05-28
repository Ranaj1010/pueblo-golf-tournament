using pueblo_golf_tournament_api.Extensions;

namespace pueblo_golf_tournament_api.Utilities.Helpers
{
    public class IncrementHelper
    {
        private static readonly Lazy<IncrementHelper> Lazy =
            new Lazy<IncrementHelper>(() =>
                new IncrementHelper());

        public static IncrementHelper Instance => Lazy.Value;

        public string EventSequence(string value)
        {
            return HashExtensions.IncrementAlphaNumericValue(value);
        }
    }
}