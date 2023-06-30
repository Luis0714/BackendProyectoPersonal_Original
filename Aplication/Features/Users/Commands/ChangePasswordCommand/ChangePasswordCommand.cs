using Application.Espesification;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.Emails;
using Application.Messages.User;
using Application.Services.Abstraction.SecurityServices;
using Application.Whappers;
using Domain.Entities;
using MediatR;
using Shared.Services;

namespace Application.Features.Users.Commands.ChangePasswordCommand
{
    public class ChangePasswordCommand : IRequest<Response<bool>>
    {
        public string? Email  { get; set; }
        public string? CurentPassword { get; set; }
        public string? NewPassword { get; set; }
        public string? ComfirmNewPassword { get; set; }
    }

    public class ChangePasswordCommandHandler : IRequestHandler<ChangePasswordCommand, Response<bool>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMessageEmailSender _messageSender;
        private readonly IPasswordService _passwordService;
        private readonly IEncrypPasswordService _encrypPasswordService;

        public ChangePasswordCommandHandler(IRepositoryAsync<User> repositoryAsync, IMessageEmailSender messageSender, IPasswordService passwordService, IEncrypPasswordService encrypPasswordService)
        {
            _repositoryAsync = repositoryAsync;
            _messageSender = messageSender;
            _passwordService = passwordService;
            _encrypPasswordService = encrypPasswordService;
        }

        async Task<Response<bool>> IRequestHandler<ChangePasswordCommand, Response<bool>>.Handle(ChangePasswordCommand request, CancellationToken cancellationToken)
        {
            var users = await _repositoryAsync.ListAsync(new GetCurrentUserSpecification(request.Email, request.CurentPassword));
            var user = users.FirstOrDefault();
            if (user == default) throw new ApiException(MessageUserErrors.InvalidCredentials);
            if (request.NewPassword != request.ComfirmNewPassword) throw new ApiException(MessageUserErrors.PasswordNotMach);
            var newPassword = _encrypPasswordService.Encrypt(request.NewPassword);
            user.Password = newPassword;
            var response = await sendComfirmation(user);
            if (response) await _repositoryAsync.UpdateAsync(user);
            return new Response<bool>(response);
        }
        private async Task<bool> sendComfirmation(User user)
        {
            var to = user.Email;
            var newPassword = _passwordService.GeneretePassword(10);
            var templete = Properties.Resources.ResetPasswordTemplete.ToString();
            templete = replaceValues(templete, user);
            user.Password = _encrypPasswordService.Encrypt(newPassword);
            return await _messageSender.SendEmail(to, ConstEmail.NameFromEmail, ConstEmail.SubjetResetPassword, templete);
        }

        private string replaceValues(string templete, User user)
        {
            templete = templete.Replace("@Asunto", ConstEmail.SubjetResetPassword);
            templete = templete.Replace("@nombre", user.Name);
            return templete;
        }

       
    }
}
