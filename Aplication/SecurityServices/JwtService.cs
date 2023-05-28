using Domain.Entities;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Extensions.Configuration;
using System.IdentityModel.Tokens.Jwt;
using Application.Interfaces;
using Application.DTO_s;

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
            var jwt = _configuration.GetSection("Jwt").Get<JwtDTO>();
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,jwt.Subject),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim("UserId", user.UserId.ToString()),
                new Claim("Email",user.Email),
                new Claim("Password",user.Password),
                new Claim("RolId",user.RolId.ToString())
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwt.Key));
            var credenciales = new SigningCredentials(key,SecurityAlgorithms.HmacSha256);
            var securityToken = new JwtSecurityToken
                (
                  jwt.Issuer,
                  jwt.Audience,
                  claims,
                  expires: DateTime.Now.AddMinutes(60),
                  signingCredentials: credenciales
                );
            string token = new JwtSecurityTokenHandler().WriteToken(securityToken);
            return token;
        }
    }
}
