using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;

namespace pueblo_golf_tournament_api.Extensions
{
    public static class HashExtensions
    {
        public static string HashSecret =>
            "cub3w0rks.pu3bl0.g0lf.t0urn@m3nt.h@$h";

        public static string GetHash(string key)
        {
            try
            {
                if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(HashSecret))
                    return string.Empty;
                string result = string.Empty;
                using (HMACSHA256 hmacSha256 = new(Encoding.UTF8.GetBytes(HashSecret)))
                {
                    byte[] hashBytes = hmacSha256.ComputeHash(Encoding.UTF8.GetBytes(key));
                    result = BitConverter.ToString(hashBytes)
                        .ToUpper()
                        .Replace("-", string.Empty);
                }
                return result;
            }
            catch
            {
                return string.Empty;
            }
        }

        public static bool ValidateHash(string key, string hashedKey)
        {
            try
            {
                if (string.IsNullOrEmpty(key) || string.IsNullOrEmpty(hashedKey))
                    return false;
                string hashResult = GetHash(key);
                if (string.IsNullOrEmpty(hashResult))
                    return false;
                if (hashResult != hashedKey)
                    return false;
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static string IncrementAlphaNumericValue(string value)
        {
            if (string.IsNullOrWhiteSpace(value))
            {
                return "";
            }

            if (Regex.IsMatch(value, "^[a-zA-Z0-9]+$") == false)
            {
                throw new Exception("Invalid Character: Must be a-Z or 0-9");
            }

            var characterArray = value.ToCharArray();

            for (var characterIndex = characterArray.Length - 1; characterIndex >= 0; characterIndex--)
            {
                var characterValue = Convert.ToInt32(characterArray[characterIndex]);

                if (characterValue != 57 && characterValue != 90 && characterValue != 122)
                {
                    characterArray[characterIndex]++;

                    for (int resetIndex = characterIndex + 1; resetIndex < characterArray.Length; resetIndex++)
                    {
                        characterValue = Convert.ToInt32(characterArray[resetIndex]);
                        if (characterValue >= 65 && characterValue <= 90)
                        {
                            characterArray[resetIndex] = 'A';
                        }
                        else if (characterValue >= 97 && characterValue <= 122)
                        {
                            characterArray[resetIndex] = 'a';
                        }
                        else if (characterValue >= 48 && characterValue <= 57)
                        {
                            characterArray[resetIndex] = '0';
                        }
                    }

                    return new string(characterArray);

                }
            }

            return null;
        }
    }
}