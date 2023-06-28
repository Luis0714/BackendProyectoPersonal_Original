using Microsoft.AspNetCore.Http;

namespace Application.DTO_s
{
    public class FileDTO
    {
        public IFormFile Image { get; set; }
        public string Ruta { get; set; }
    }
}
