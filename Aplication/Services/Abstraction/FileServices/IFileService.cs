using Application.DTO_s;
using Microsoft.AspNetCore.Http;

namespace Application.Services.Abstraction.FileServices
{
    public interface IFileService
    {
        string UploadFile(IFormFile file);
        Task<FileDownloadDTO> DownloadFile(string ruta);
    }
}
