using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.User;
using Microsoft.AspNetCore.Http;

namespace Application.FileServices
{
    public class FileService : IFileService
    {
        public byte[] UploadFile(IFormFile file)
        {
            if (file.Length == 0)
                throw new ApiException(MessageUserErrors.ErrorUploadImage);
            byte[] bytes;
            using(Stream stream = file.OpenReadStream())
            {
                using(BinaryReader reader = new BinaryReader(stream))
                {
                    bytes = reader.ReadBytes((int)stream.Length);
                }
            }
            return bytes;
        }
    }
}
