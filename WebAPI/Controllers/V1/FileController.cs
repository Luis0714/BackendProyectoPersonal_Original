using Application.Features.Users.Querys.GetUserAdmin;
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
        public async Task<IActionResult> Upload(GetUserAccessCredentials user)
        {
            return Ok(await Mediator.Send(user));
        }

    }
}
