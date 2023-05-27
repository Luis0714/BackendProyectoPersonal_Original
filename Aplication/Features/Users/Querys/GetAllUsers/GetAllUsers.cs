using Application.Espesification;
using Application.Features.Users.Querys.GetUserAdmin;
using Application.Interfaces;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Querys.GetAllUsers
{
    public class GetAllUsers : IRequest<List<User>>
    {

    }
    public class GetAlluserHandler : IRequestHandler<GetAllUsers,List<User>>
    {
        private readonly IRepositoryAsync<User> _repositoryAsync;
        public GetAlluserHandler(IRepositoryAsync<User> repositoryAsync)
        {
            _repositoryAsync = repositoryAsync;
        }
      
        public async Task<List<User>> Handle(GetAllUsers request, CancellationToken cancellationToken)
        {
            var lista = await _repositoryAsync.ListAsync(new GetAllUserSpecification());
            return lista;
        }
    }
}
