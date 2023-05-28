using Application.Features.Users.Commands.CrateUserCommand;
using Application.Features.Users.Querys.GetAllUsers;
using Application.Features.Users.Querys.GetUserById;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.V1
{
    [ApiVersion("1.0")]
    public class UserController : BaseApiController
    {
        //[Authorize]
        [HttpPost]
        [Route("createUser")]
        public async Task<IActionResult> Create(CreateUserCommand user)
        {
            return Ok(await Mediator.Send(user));
        }
        [Authorize(Policy = "SuperAdmin")]
        [HttpGet]
        [Route("getAllUsers")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await Mediator.Send(new GetAllUsers()));
        }
        [Authorize(Policy = "SuperAdmin")]
        [HttpGet]
        [Route("getUserById")]
        public async Task<IActionResult> GetById(GetUserById userId)
        {
            return Ok(await Mediator.Send(userId));
        }
    }
}
