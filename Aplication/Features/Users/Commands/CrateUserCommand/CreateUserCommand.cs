using Application.DTO_s;
using Application.Espesification;
using Application.Execteptions.Validation;
using Application.Interfaces;
using Application.Messages.User;
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
        public string Image { get; set; }
        public string LastName { get; set; }
        public string SecondLastName { get; set; }
        public DateTime DateOfBirth { get; set; }
        public string numberPhone { get; set; }
        public string Document { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public int DocumentTypeId { get; set; }
        public string Address { get; set; }
        public int RolId { get; set; }
    }

    public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Response<UserDTO>>
    {
       
        private readonly IMapper _mapper;
        private readonly IRepositoryAsync<User> _repositoryAsync;
        private readonly IEncrypPasswordService _encrypPasswordService;

        public CreateUserCommandHandler(IMapper mapper, IRepositoryAsync<User> repositoryAsync, IEncrypPasswordService encrypPasswordService)
        {
            _mapper = mapper;
            _repositoryAsync = repositoryAsync;
            _encrypPasswordService = encrypPasswordService;
        }

        public async Task<Response<UserDTO>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            var record = _mapper.Map<User>(request);
            record.Password = _encrypPasswordService.Encrypt(record.Password);
            var usuarioExistente = await _repositoryAsync.ListAsync(new AdmindSpesification(request.Email, record.Password));
            if (usuarioExistente.Count > 0) throw new ApiException(MessageUserErrors.UserExist);
            var data = await _repositoryAsync.AddAsync(record);
            var result = _mapper.Map<UserDTO>(data);
            return new Response<UserDTO>(result,MessageUserErrors.CreatedUser);
        }
    }
}
