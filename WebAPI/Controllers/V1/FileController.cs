using Application.Features.Files.Querys;
using Application.Features.Files.UploadFile;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.V1
{
    [ApiVersion("1.0")]
    public class FileController : BaseApiController
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("upload")]
        public async Task<IActionResult> Upload(IFormFile file)
        {
            return Ok(await Mediator.Send(new UploadFileCommand(){File = file}));
        }

        [AllowAnonymous]
        [HttpPost]
        [Route("download")]
        public async Task<IActionResult> dowload(string ruta)
        {
            var response = await Mediator.Send(new DownloadFile() { Ruta = ruta });
            return File(response.Data.Bytes,response.Data.ContentType,Path.GetFileName(ruta));
        }


    }
}
