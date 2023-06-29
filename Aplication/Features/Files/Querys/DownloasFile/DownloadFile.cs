﻿using Application.DTO_s;
using Application.Services.Abstraction.FileServices;
using Application.Whappers;
using MediatR;

namespace Application.Features.Files.Querys
{
    public class DownloadFile : IRequest<Response<FileDownloadDTO>>
    {
        public string? Ruta { get; set; }
    }
public class DownloadFileHandler : IRequestHandler<DownloadFile, Response<FileDownloadDTO>>
{
    private readonly IFileService _fileService;

        public DownloadFileHandler(IFileService fileService)
        {
            _fileService = fileService;
        }

        public async Task<Response<FileDownloadDTO>> Handle(DownloadFile request, CancellationToken cancellationToken)
        {
            if (request.Ruta != default)
            {
                var response = await _fileService.DownloadFile(request.Ruta);
                return new Response<FileDownloadDTO>(response);
            }
            return new Response<FileDownloadDTO>();
        }
        
    }
}
