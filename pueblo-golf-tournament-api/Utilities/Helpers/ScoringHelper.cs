namespace pueblo_golf_tournament_api.Utilities.Helpers
{
    public static class ScoringHelper
    {
        public static int GetMolaveScore(int par, int stroke)
        {
            var score = 0;

            // Par
            if (stroke == par)
            {
                score = 3;
            }

            // Birdie
            if (par - stroke == 1)
            {
                score = 4;
            }

            // Eagle
            if (par - stroke == 2)
            {
                score = 5;
            }
            
            // Albatross
            if (par - stroke == 3)
            {
                score = 6;
            }

            // Bogey
            if (par - stroke == -1)
            {
                score = 2;
            }

            // Double Bogey
            if (par - stroke == -2)
            {
                score = 1;
            }
    
            // Triple Bogey
            if (par - stroke == -3)
            {
                score = 0;
            }

            return score;
        }
    }
}