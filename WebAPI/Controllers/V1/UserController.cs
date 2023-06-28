using Application.Features.Users.Commands.ChangePasswordCommand;
using Application.Features.Users.Commands.CrateUserCommand;
using Application.Features.Users.Commands.ResetPassword;
using Application.Features.Users.Querys.GetAllUsers;
using Application.Features.Users.Querys.GetUserById;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace WebAPI.Controllers.V1
{
    [ApiVersion("1.0")]
    public class UserController : BaseApiController
    {
        [AllowAnonymous]
        [HttpPost]
        [Route("createUser")]
        public async Task<IActionResult> Create(CreateUserCommand user)
        {
            try
            {
                return Ok(await Mediator.Send(user));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [Authorize(Policy = "SuperAdmin")]
        [HttpGet]
        [Route("getAllUsers")]
        public async Task<IActionResult> GetAll()
        {
            try
            {
                return Ok(await Mediator.Send(new GetAllUsers()));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [Authorize(Policy = "SuperAdmin")]
        [HttpGet]
        [Route("getUserById")]
        public async Task<IActionResult> GetById(GetUserById userId)
        {
            try 
            { 
                return Ok(await Mediator.Send(userId));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [Authorize]
        [HttpGet]
        [Route("resetPassword")]
        public async Task<IActionResult> ResetPassword(ResetPasswordCommand email)
        {
            try
            {
                return Ok(await Mediator.Send(email));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }

        [Authorize]
        [HttpPut]
        [Route("changePassword")]
        public async Task<IActionResult> ChangePassword(ChangePasswordCommand credencials)
        {
            try
            {
                return Ok(await Mediator.Send(credencials));
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
