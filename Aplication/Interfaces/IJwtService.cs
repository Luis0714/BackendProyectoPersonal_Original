using Domain.Entities;
using Microsoft.AspNetCore.Http;

namespace Application.Interfaces
{
    public interface IJwtService
    {
        string GenerateToken(User user);
        int GetIdUserInToken(HttpContext context);
    }
}
