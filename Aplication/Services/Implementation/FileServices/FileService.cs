using Application.DTO_s;
using Application.Execteptions.Validation;
using Application.Messages.File;
using Application.Services.Abstraction.FileServices;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.StaticFiles;

namespace Application.Services.Implementation.FileServices
{
    public class FileService : IFileService
    {
        IWebHostEnvironment _webHostEnvironment;

        public FileService(IWebHostEnvironment webHostEnvironment)
        {
            _webHostEnvironment = webHostEnvironment;
        }

        public async Task<FileDownloadDTO> DownloadFile(string ruta)
        {
            if (string.IsNullOrEmpty(ruta)) throw new ApiException(MessageFileErrors.Ruta);
            var provider = new FileExtensionContentTypeProvider();
            if (!provider.TryGetContentType(ruta, out var contentType))
            {
                contentType = "application/octet-stream";
            }
            var bytes = await File.ReadAllBytesAsync(ruta);
            return new FileDownloadDTO() { Bytes = bytes, ContentType = contentType };
        }

        public string UploadFile(IFormFile file)
        {
            if (file.Length == default)
            {
                throw new ApiException($"Invalid file length: {file.Length}");
            }
            var paht = Path.Combine(_webHostEnvironment.ContentRootPath, "ImagesUsers");

            if (!Directory.Exists(paht))
            {
                Directory.CreateDirectory(paht);
            }

            string fullPath = Path.Combine(paht, Guid.NewGuid().ToString() + "-" + file.FileName);
            using (var stream = new FileStream(fullPath, FileMode.Create))
            {
                file.CopyTo(stream);
            }
            return fullPath;

        }
    }
}
