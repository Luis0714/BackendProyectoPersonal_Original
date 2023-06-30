using Application.Interfaces;
using Application.Services.Abstraction.FileServices;
using Application.Whappers;
using Domain.Entities;
using MediatR;
using Microsoft.AspNetCore.Http;

namespace Application.Features.Files.UploadFile
{
    public class UploadFileCommand : IRequest<Response<string>>
    {
        public IFormFile? File { get; set; }

        public class UploadFileCommandHandler : IRequestHandler<UploadFileCommand, Response<string>>
        {
            private readonly IFileService _fileService;

            public UploadFileCommandHandler(IFileService fileService)
            {
                _fileService = fileService;
            }

            public async Task<Response<string>> Handle(UploadFileCommand request, CancellationToken cancellationToken)
            {
                string ruta = _fileService.UploadFile(request.File);
                return new Response<string>(ruta,ruta);
            }
        }
    }
}
