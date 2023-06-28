using Application.DTO_s;
using Application.Espesification;
using Application.Features.Users.Querys.GetAllUsers;
using Application.Interfaces;
using Application.Whappers;
using AutoMapper;
using Domain.Entities;
using MediatR;

namespace Application.Features.Files.Querys
{
    public class DownloadFile : IRequest<Response<FileDownloadDTO>>
    {
        public string ruta { get; set; }
    }
public class DownloadFileHandler : IRequestHandler<DownloadFile, Response<FileDownloadDTO>>
{
    private readonly IRepositoryAsync<User> _repositoryAsync;
    private readonly IMapper _mapper;
    private readonly IFileService _fileService;

        public DownloadFileHandler(IRepositoryAsync<User> repositoryAsync, IMapper mapper, IFileService fileService = null)
        {
            _repositoryAsync = repositoryAsync;
            _mapper = mapper;
            _fileService = fileService;
        }

        public async Task<Response<FileDownloadDTO>> Handle(DownloadFile request, CancellationToken cancellationToken)
        {
            var response = await _fileService.DownloadFile(request.ruta);
            return new Response<FileDownloadDTO>(response);
        }
        
    }
}
