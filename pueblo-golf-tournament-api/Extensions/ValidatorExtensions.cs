namespace pueblo_golf_tournament_api.Extensions
{
    public static class ValidatorExtensions
    {
        public static bool ValidUsername(string username)
        {
            try
            {
                if (string.IsNullOrEmpty(username))
                    return false;
                if (username.Length < 6)
                    return false;
                if (username.Contains(' '))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool ValidPassword(string password)
        {
            try
            {
                if (string.IsNullOrEmpty(password))
                    return false;
                if (password.Length < 6)
                    return false;
                bool passwordHasSpecialCharacters = false;
                string specialCharacters = @"\|!#$%&/()=?»«@£§€{}.-;'<>_,";
                foreach (char character in specialCharacters)
                {
                    if (password.Contains(character))
                    {
                        passwordHasSpecialCharacters = true;
                        break;
                    }
                }
                if (passwordHasSpecialCharacters)
                    return false;
                if (!password.Any(char.IsUpper))
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string ParseEmail(string emailAddress)
        {
            try
            {
                string result = string.Empty;
                if (string.IsNullOrEmpty(emailAddress))
                    return string.Empty;
                bool validEmail = ValidEmail(emailAddress);
                if (!validEmail)
                    return string.Empty;
                result = emailAddress
                    .Replace(" ", string.Empty)
                    .ToLower();
                return result;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static bool ValidEmail(string emailAddress)
        {
            try
            {
                if (string.IsNullOrEmpty(emailAddress))
                    return false;
                if (!emailAddress.Contains('@'))
                    return false;
                string[] splitEmail = emailAddress.Split('@');
                if (splitEmail.Length != 2)
                    return false;
                string emailHost = splitEmail
                    .LastOrDefault()!;
                if (!emailHost.Contains('.'))
                    return false;
                string[] splitHost = emailHost.Split('.');
                if (splitHost.Length != 2)
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static string ParseMobileNumber(string mobileNumber)
        {
            try
            {
                if (string.IsNullOrEmpty(mobileNumber))
                    return string.Empty;
                if (!ValidMobileNumber(mobileNumber))
                    return string.Empty;
                if (mobileNumber.StartsWith("+63"))
                    return mobileNumber;
                if (mobileNumber.StartsWith("63"))
                    return '+' + mobileNumber;
                else if (mobileNumber.StartsWith("09"))
                    return "+63" + mobileNumber.Remove(0, 1);
                else if (mobileNumber.StartsWith("9"))
                    return "+63" + mobileNumber;
                else
                    return string.Empty;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static bool ValidMobileNumber(string mobileNumber)
        {
            try
            {
                if (string.IsNullOrEmpty(mobileNumber))
                    return false;
                if (mobileNumber.StartsWith("+63"))
                {
                    if (mobileNumber.Length != 13)
                        return false;
                }
                if (mobileNumber.StartsWith("63"))
                {
                    if (mobileNumber.Length != 12)
                        return false;
                }
                else if (mobileNumber.StartsWith("09"))
                {
                    if (mobileNumber.Length != 11)
                        return false;
                }
                else if (mobileNumber.StartsWith("9"))
                {
                    if (mobileNumber.Length != 10)
                        return false;
                }
                return true;
            }
            catch
            {
                return false;
            }
        }

    }
}