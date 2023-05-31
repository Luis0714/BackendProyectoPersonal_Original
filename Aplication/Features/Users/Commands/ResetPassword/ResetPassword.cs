using Application.Espesification;
using Application.Execteptions.User;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;
using Shared.Services;

namespace Application.Features.Users.Commands.ResetPassword
{
    public class ResetPassword: IRequest<Response<bool>>
    {
        public string Email { get; set; }
       
    }

    public class ResetPasswordHandler : IRequestHandler<ResetPassword, Response<bool>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        private readonly IMessageSender _messageSender;
        public ResetPasswordHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper, IMessageSender messageSender)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
            _messageSender = messageSender;
        }

        public async Task<Response<bool>> Handle(ResetPassword request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetUserByEmail(request.Email));
            var user = lista.FirstOrDefault();
            if (user == null) throw new ApiException(MessageUserErrors.UserExist);
            _messageSender.SendEmail(user.Email, "", "", "");
            return new Response<bool>();
        }
    }
}
