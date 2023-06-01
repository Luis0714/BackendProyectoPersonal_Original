using Application.DTO_s;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.User;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Querys.GetUserById
{
    public class GetUserById : IRequest<Response<UserDTO>>
    {
        public int UserId { get; set; }
    }

    public class GetUserByIdHandler : IRequestHandler<GetUserById, Response<UserDTO>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        public GetUserByIdHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
        }

        public async Task<Response<UserDTO>> Handle(GetUserById request, CancellationToken cancellationToken)
        {
          var user = await _repositoryAsync.GetByIdAsync(request.UserId);
          if (user == null) throw new ApiException(MessageUserErrors.UserNotRegistered);
          var result = _mapper.Map<UserDTO>(user);
          return new Response<UserDTO>(result);
        }
    }
}
