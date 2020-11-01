using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.Encodings.Web;
using System.Threading.Tasks;
using coderush.Services;

namespace coderush.Services
{
    public static class EmailSenderExtensions
    {
        public static Task SendEmailConfirmationAsync(this IEmailSender emailSender, string email, string link)
        {
            return emailSender.SendEmailAsync(email, "Confirm your email",
                $"Please confirm your account by clicking this link: <a href='{HtmlEncoder.Default.Encode(link)}'>link</a>");
        }
        public static Task SendEmailConfirmationOnTargetAsync(this IEmailSender emailSender, string email)
        {
            return emailSender.SendEmailAsync(email, "Sales Target Email",
                $"The targets for this quarter has been set");
        }
        public static void SendEmailConfirmationOnTarget(this IEmailSender emailSender, string email)
        {
            emailSender.SendEmail(email, "Sales Target Email",
                $"The targets for this quarter has been set");
        }
    }
}
