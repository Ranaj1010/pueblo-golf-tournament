using System.Security.Cryptography;
using System.Text;

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
    }
}