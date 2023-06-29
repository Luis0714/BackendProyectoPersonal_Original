using SendGrid.Helpers.Mail;
using SendGrid;
using Microsoft.Extensions.Configuration;
using Application.Whappers;
using Shared.Messages.Emails;

namespace Shared.Services.Implementation
{
    public class MessageSenderService : IMessageEmailSender
    {
        private readonly IConfiguration _configuration;
        private readonly string _apiKey;
        public MessageSenderService(IConfiguration configuration)
        {
            _configuration = configuration;
            _apiKey = _configuration.GetSection("ApiKey").Get<string>();
        }

        public async Task<Response<Response?>> SendEmail(string email, string userName, string subject, string templete)
        {
            var client = new SendGridClient(_apiKey);
            var from = new EmailAddress(ConstEmail.FormEmail, userName);
            var to = new EmailAddress(email, userName);
            var plainTextContent = "";
            var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, templete);
            var response = await client.SendEmailAsync(msg);
            return new Response<Response?>(response);
        }
    }
}
