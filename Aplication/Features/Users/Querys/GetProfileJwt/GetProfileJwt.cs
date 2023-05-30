using Application.DTO_s;
using Application.Interfaces;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Http;

namespace Application.Features.Users.Querys.GetProfileJwt
{
    public class GetProfileJwt : IRequest<Response<UserDTO>>
    {
        public HttpContext HttpContext { get; set; }

        public GetProfileJwt(HttpContext httpContext)
        {
            HttpContext = httpContext;
        }
    }

    public class GetProfileJwtHandler : IRequestHandler<GetProfileJwt, Response<UserDTO>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        private readonly IJwtService _jwtService;
        public GetProfileJwtHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper, IJwtService jwtService)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
            _jwtService = jwtService;
        }

        public async Task<Response<UserDTO>> Handle(GetProfileJwt request, CancellationToken cancellationToken)
        {
            var userId = _jwtService.GetIdUserInToken(request.HttpContext);
            var user = await _repositoryAsync.GetByIdAsync(userId);
            var result = _mapper.Map<UserDTO>(user);
            return new Response<UserDTO>(result);
        }
    }
}
