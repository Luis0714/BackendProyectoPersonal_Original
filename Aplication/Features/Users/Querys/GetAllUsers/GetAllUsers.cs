using Application.DTO_s;
using Application.Espesification;
using Application.Interfaces;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Querys.GetAllUsers
{
    public class GetAllUsers : IRequest<Response<List<UserDto>>>
    {

    }
    public class GetAlluserHandler : IRequestHandler<GetAllUsers, Response<List<UserDto>>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        public GetAlluserHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
        }

        public async Task<Response<List<UserDto>>> Handle(GetAllUsers request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetAllUserSpecification());
            var result = new List<UserDto>();
            lista.ForEach(user =>
            {
                var userDTO = _mapper.Map<UserDto>(user);
                userDTO.Edad = new DateTime(DateTime.Now.Subtract(userDTO.DateOfBirth).Ticks).Year - 1;
                result.Add(userDTO);
            });
            return new Response<List<UserDto>>(result);
        }
    }
}
