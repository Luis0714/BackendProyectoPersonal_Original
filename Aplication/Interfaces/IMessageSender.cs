namespace Shared.Services
{
    public interface  IMessageSender
    {
        bool SendEmail(string email, string userName, string subject, string message);
    }
}
