using SendGrid.Helpers.Mail;
using SendGrid;
using Microsoft.Extensions.Configuration;
using Application.DTO_s;

namespace Shared.Services
{
    public class MessageSender : IMessageSender
    {
        private readonly IConfiguration _configuration;
        private readonly string _apiKey;
        public MessageSender(IConfiguration configuration)
        {
            _configuration = configuration;
            _apiKey = _configuration.GetSection("ApiKey").Get<string>();
        }
        public bool SendEmail(string email, string userName, string subject, string message)
        {
            Execute();
            return true;
        }

        private async Task Execute()
        {
            var client = new SendGridClient(_apiKey);
            var from = new EmailAddress("luian.me0714@gmail.com", "Luis Andrés");
            var subject = "Recuperación de contraseña";
            var to = new EmailAddress("luis.1702018273@ucaldas.edu.co", "LUIS ANDRES");
            var plainTextContent = "EL TEXTO PLANO";
            var htmlContent = "<strong>EL TEXTO HTML</strong>";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
            var response = await client.SendEmailAsync(msg);
            
        }
    }
}
