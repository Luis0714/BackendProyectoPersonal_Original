using Microsoft.AspNetCore.Http;

namespace Application.Interfaces
{
    public interface IFileService
    {
        byte[] UploadFile(IFormFile file);
    }
}
