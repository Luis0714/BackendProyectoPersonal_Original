using Application.Whappers;

namespace Shared.Services
{
    public interface  IMessageSender
    {
        Task<Response<SendGrid.Response?>> SendEmail(string email, string userName, string subject, string templete);
    }
}
