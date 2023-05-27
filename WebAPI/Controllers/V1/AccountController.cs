using Application.Features.Users.Querys.GetUserAdmin;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.V1
{
    [ApiVersion("1.0")]
    public class AccountController : BaseApiController
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("autenticate")]
        public async Task<IActionResult> Autenticate(GetUserAccessCredentials user)
        {
            return Ok(new {Token = await Mediator.Send(user) });
        }
    }
}
