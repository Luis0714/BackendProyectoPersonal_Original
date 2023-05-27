using Domain.Entities;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Extensions.Configuration;
using System.IdentityModel.Tokens.Jwt;
using Application.Interfaces;

namespace Application.SecurityServices
{
    public class JwtService : IJwtService
    {
        private  IConfiguration _configuration;

        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
        }

        public string GenerateToken(User user)
        {
            var claims = new[]
            {
                new Claim(ClaimTypes.Email,user.Email),
                new Claim(ClaimTypes.Name,user.Name)
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_configuration.GetSection("JWT:Key").Value));
            var credenciales = new SigningCredentials(key,SecurityAlgorithms.HmacSha256);
            var securityToken = new JwtSecurityToken(claims: claims,expires:DateTime.Now.AddMinutes(60), signingCredentials: credenciales);
            string token = new JwtSecurityTokenHandler().WriteToken(securityToken);
            return token;
        }
    }
}
