using Application.Whappers;
using MediatR;

namespace Application.Execteptions.Validation.Features.Users.Commands.CrateUserCommand
{
    public class CreateUserCommand : IRequest<Response<int>>
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

    public class CreateUserCommandHandler : IRequestHandler<CreateUserCommand, Response<int>>
    {
        public async Task<Response<int>> Handle(CreateUserCommand request, CancellationToken cancellationToken)
        {
            throw new NotImplementedException();
        }
    }
}
