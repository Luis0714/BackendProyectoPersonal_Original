using Application.Interfaces;
using Shared.Messages.Password;
using Shared.Messages.Password.NewFolder;
using System.Security.Cryptography;
using System.Text;

namespace Shared.Services
{
    public class PasswordService : IPasswordService
    {
        public string GeneretePassword(int length)
        {
            const string chars = PasswordConst.Characters;
            byte[] randomBytes = new byte[length];

            using (var rng = new RNGCryptoServiceProvider())
            {
                rng.GetBytes(randomBytes);
            }

            StringBuilder passwordBuilder = new StringBuilder(length);

            for (int i = 0; i < length; i++)
            {
                int index = randomBytes[i] % chars.Length;
                passwordBuilder.Append(chars[index]);
            }

            return passwordBuilder.ToString();
        }
    }
}
