using Application.Espesification;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.Emails;
using Application.Messages.User;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;
using SendGrid;
using Shared.Services;

namespace Application.Features.Users.Commands.ResetPassword
{
    public class ResetPassword : IRequest<Response<Response?>>
    {
        public string Email { get; set; }

    }

    public class ResetPasswordHandler : IRequestHandler<ResetPassword, Response<Response?>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        private readonly IMessageSender _messageSender;
        private readonly IPasswordService _passwordService;
        private readonly IEncrypPasswordService _encrypPasswordService;
        public ResetPasswordHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper, IMessageSender messageSender, IPasswordService passwordService, IEncrypPasswordService encrypPasswordService)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
            _messageSender = messageSender;
            _passwordService = passwordService;
            _encrypPasswordService = encrypPasswordService;
        }

        public async Task<Response<Response?>> Handle(ResetPassword request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetUserByEmail(request.Email));
            var user = lista.FirstOrDefault();
            if (user == null) throw new ApiException(MessageUserErrors.UserExist);
            if (string.IsNullOrEmpty(user.Email)) throw new ApiException(MessageUserErrors.EmailRequared);
            var to = user.Email;
            var newPassword = _passwordService.GeneretePassword(10);
            var templete = Properties.Resources.ResetPasswordTemplete.ToString();
            templete = templete.Replace("@Asunto", ConstEmail.SubjetResetPassword);
            templete = templete.Replace("@nombre", user.Name);
            templete = templete.Replace("@contrasena", newPassword);
            user.Password = _encrypPasswordService.Encrypt(newPassword);
            var response = await _messageSender.SendEmail(to, ConstEmail.NameFromEmail, ConstEmail.SubjetResetPassword, templete);
            if(response.Succeeded) _repositoryAsync.UpdateAsync(user);
            return response;
        }
    }
}
