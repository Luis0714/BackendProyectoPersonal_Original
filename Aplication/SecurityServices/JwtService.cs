using Domain.Entities;
using System.Security.Claims;
using Microsoft.IdentityModel.Tokens;
using System.Text;
using Microsoft.Extensions.Configuration;
using System.IdentityModel.Tokens.Jwt;
using Application.Interfaces;
using Application.DTO_s;
using Microsoft.AspNetCore.Http;
using Application.Execteptions.Validation;
using Application.Messages.User;

namespace Application.SecurityServices
{
    public class JwtService : IJwtService
    {
        private  IConfiguration _configuration;
        private JwtDTO _jwt;

        public JwtService(IConfiguration configuration)
        {
            _configuration = configuration;
            _jwt = _configuration.GetSection("Jwt").Get<JwtDTO>();
        }

        public string GenerateToken(User user)
        {
            var claims = new[]
            {
                new Claim(JwtRegisteredClaimNames.Sub,_jwt.Subject),
                new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()),
                new Claim(JwtRegisteredClaimNames.Iat, DateTime.UtcNow.ToString()),
                new Claim("UserId", user.UserId.ToString()),
                new Claim("Email",user.Email),
                new Claim("Password",user.Password),
                new Claim("RolId",user.RolId.ToString())
            };
            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwt.Key));
            var credenciales = new SigningCredentials(key,SecurityAlgorithms.HmacSha256);
            var securityToken = new JwtSecurityToken
                (
                  _jwt.Issuer,
                  _jwt.Audience,
                  claims,
                  expires: DateTime.Now.AddMinutes(120),
                  signingCredentials: credenciales
                );
            string token = new JwtSecurityTokenHandler().WriteToken(securityToken);
            return token;
        }

        public int GetIdUserInToken(HttpContext httpContext)
        {
            string token = httpContext.Request.Headers["Authorization"].ToString().Replace("Bearer ", "");
            if (string.IsNullOrEmpty(token))
                throw new ApiException(MessageUserErrors.NotToken);
            var claims = validatedToken(token);
            var userId = claims.FindFirst(claim => claim.Type == "UserId").Value;
            return int.Parse(userId);
        }

        private ClaimsPrincipal validatedToken(string token)
        {
            var tokenValidationParameters = new TokenValidationParameters
            {
                ValidateIssuer = false,
                ValidateAudience = false,
                IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_jwt.Key)),
                ValidateIssuerSigningKey = true,
                ValidateLifetime = true
            };
            var claimsPrincipal = new JwtSecurityTokenHandler().ValidateToken(token, tokenValidationParameters, out var validatedToken);
            return claimsPrincipal;
        }
    }
}
