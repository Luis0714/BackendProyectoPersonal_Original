using Application.Features.Users.Querys.GetProfileJwt;
using Application.Features.Users.Querys.GetUserAdmin;
using ChustaSoft.Tools.Authorization;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.V1
{
    [ApiVersion("1.0")]
    public class AccountController : BaseApiController
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("authenticate")]
        public async Task<IActionResult> Autenticate(GetUserAccessCredentials user)
        {
            return Ok(await Mediator.Send(user));
        }

        [HttpGet("profile")]
        [Authorize]
        public async Task<IActionResult> GetUserProfile()
        {
            return Ok(await Mediator.Send(new GetProfileJwt(HttpContext)));
        }
    }
}
