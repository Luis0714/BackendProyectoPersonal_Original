using Application.Espesification;
using Application.Execteptions;
using Application.Execteptions.User;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.SecurityServices;
using Application.Whappers;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Querys.GetUserAdmin
{
    public class GetUserAccessCredentials : IRequest<Response<string>>
    {
        public string Email { get; set; }
        public string Password { get; set; }
    }
        public class GetUserAccessCredentialsHandler : IRequestHandler<GetUserAccessCredentials, Response<string>>
        {
            private readonly IRepositoryAsync<User> _repositoryAsync;
            private readonly IJwtService _jwtService;
        public GetUserAccessCredentialsHandler(IRepositoryAsync<User> repositoryAsync, IJwtService jwtService)
        {
            _repositoryAsync = repositoryAsync;
            _jwtService = jwtService;
        }

        public async Task<Response<string>> Handle(GetUserAccessCredentials request, CancellationToken cancellationToken)
        {
            var users = await _repositoryAsync.ListAsync(new AdmindSpesification(request.Email, EncryptPassword.Encrypt(request.Password)));
            var user = users.FirstOrDefault();
            if (user == default)
                throw new ApiException(MessageUserErrors.InvalidCredentials);
            return new Response<string>(_jwtService.GenerateToken(user),MessageUserErrors.TokenAuthorization) ;
        }
    
    }
}
