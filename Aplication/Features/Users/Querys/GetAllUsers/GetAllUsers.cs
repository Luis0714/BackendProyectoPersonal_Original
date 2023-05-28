using Application.DTO_s;
using Application.Espesification;
using Application.Features.Users.Querys.GetUserAdmin;
using Application.Interfaces;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Querys.GetAllUsers
{
    public class GetAllUsers : IRequest<List<UserDTO>>
    {

    }
    public class GetAlluserHandler : IRequestHandler<GetAllUsers, List<UserDTO>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IMapper _mapper;
        public GetAlluserHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
        }

        public async Task<List<UserDTO>> Handle(GetAllUsers request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetAllUserSpecification());
            var result = new List<UserDTO>();
            lista.ForEach(user =>
            {
                var userDTO = _mapper.Map<UserDTO>(user);
                userDTO.Edad = new DateTime(DateTime.Now.Subtract(userDTO.DateOfBirth).Ticks).Year - 1;
                result.Add(userDTO);
            });
            return result;
        }
    }
}
