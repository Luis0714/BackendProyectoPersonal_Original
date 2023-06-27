using Application.Espesification;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.Emails;
using Application.Messages.User;
using Application.Whappers;
using Domain.Entities;
using MediatR;
using SendGrid;
using Shared.Services;

namespace Application.Features.Users.Commands.ResetPassword
{
    public class ResetPasswordCommand : IRequest<Response<Response?>>
    {
        public string Email { get; set; }

    }

    public class ResetPasswordHandler : IRequestHandler<ResetPasswordCommand, Response<Response?>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMessageSender _messageSender;
        private readonly IPasswordService _passwordService;
        private readonly IEncrypPasswordService _encrypPasswordService;
        public ResetPasswordHandler(IRepositoryAsync<User> repositoryAsync, IMessageSender messageSender, IPasswordService passwordService, IEncrypPasswordService encrypPasswordService)
        {
            _repositoryAsync = repositoryAsync;
            _messageSender = messageSender;
            _passwordService = passwordService;
            _encrypPasswordService = encrypPasswordService;
        }

        public async Task<Response<Response?>> Handle(ResetPasswordCommand request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetUserByEmail(request.Email));
            var user = lista.FirstOrDefault();
            if (user == null) throw new ApiException(MessageUserErrors.UserExist);
            var response = await sendPassword(user);
            if(response.Succeeded) _repositoryAsync.UpdateAsync(user);
            return response;
        }

        private async Task<Response<Response?>> sendPassword(User user)
        {
            var to = user.Email;
            var newPassword = _passwordService.GeneretePassword(10);
            var templete = Properties.Resources.ResetPasswordTemplete.ToString();
            replaceValues(templete, user, newPassword);
            user.Password = _encrypPasswordService.Encrypt(newPassword);
           return await _messageSender.SendEmail(to, ConstEmail.NameFromEmail, ConstEmail.SubjetResetPassword, templete);
        }

        private string replaceValues(string templete, User user, string newPassword)
        {
            templete = templete.Replace("@Asunto", ConstEmail.SubjetResetPassword);
            templete = templete.Replace("@nombre", user.Name);
            templete = templete.Replace("@contrasena", newPassword);
            return templete;
        }
    }
}
