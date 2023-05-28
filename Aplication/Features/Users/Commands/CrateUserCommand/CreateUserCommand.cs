using Application.DTO_s;
using Application.Execteptions.User;
using Application.Interfaces;
using Application.SecurityServices;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.Users.Commands.CrateUserCommand
{
    public class CreateUserCommand : IRequest<Response<UserDTO>>
    {
        public string Name { get; set; }
        public byte[] Image { get; set; }
        public string LastName { get; set; }
        public string SecondLastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string numberPhone { get; set; }
        public string Document { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int DocumentTypeId { get; set; }
        public int AddressId { get; set; }
        public int RolId { get; set; }
    }

    public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Response<UserDTO>>
    {
       
        private readonly IMapper _mapper;
        private readonly IRepositoryAsync<User> _repositoryAsync;

        public CreateUserCommandHandler(IMapper mapper, IRepositoryAsync<User> repositoryAsync)
        {
            _mapper = mapper;
            _repositoryAsync = repositoryAsync;
        }

        public async Task<Response<UserDTO>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            var record = _mapper.Map<User>(request);
            record.Password = EncryptPassword.Encrypt(record.Password);
            var data = await _repositoryAsync.AddAsync(record);
            var result = _mapper.Map<UserDTO>(data);
            return new Response<UserDTO>(result,MessageUserErrors.CreatedUser);
        }
    }
}
