using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SendGrid;
using SendGrid.Helpers.Mail;

using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace Advising_System
{
    public class Mailer
    {
        private static void Main()
        {
            Execute().Wait();
        }

        //public static async Task Execute(int userID)
        //{
        //    System.Diagnostics.Debug.WriteLine("User ID To Send Email Is " + userID);
        //    var apiKey = "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";
        //    var client = new SendGridClient(apiKey);
        //    var from = new EmailAddress("advising.system.team.13@gmail.com", "Advising System");
        //    var subject = "Logged In Successfuly";
        //    var to = new EmailAddress(get_email(userID), "User");
        //    var plainTextContent = " ";
        //    var htmlContent = "<strong>You Logged In Suucessfully</strong>";
        //    var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
        //    var response = await client.SendEmailAsync(msg);
        //    System.Diagnostics.Debug.WriteLine("response is : " + response);
        //}
        public static async Task Execute()
        {
                // Replace this with a secure way of storing API keys (e.g., using configuration or environment variables)
                var apiKey = "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";

                var client = new SendGridClient(apiKey);
                var from = new EmailAddress("advising.system.team.13@gmail.com", "Advising_System");
                var subject = "Logged In Successfully";
                var to = new EmailAddress("mohamed.smenshawy@gmail.com", "User");
                var plainTextContent = " ";
                var htmlContent = "<strong>You Logged In Successfully</strong>";

                var msg = MailHelper.CreateSingleEmail(from, to, subject, plainTextContent, htmlContent);
                var response = await client.SendEmailAsync(msg);

                // Log specific information from the response
                System.Diagnostics.Debug.WriteLine($"SendGrid Status Code: {response.StatusCode}");
                System.Diagnostics.Debug.WriteLine($"SendGrid Headers: {response.Headers}");
                System.Diagnostics.Debug.WriteLine($"SendGrid Body: {await response.Body.ReadAsStringAsync()}");

        }

        private  static string get_email(int userID)
        {
            string connectionString = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            string sqlQuery = $"SELECT email FROM Student WHERE student_id = ${userID}";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                using (SqlCommand command = new SqlCommand(sqlQuery, connection))
                {
                    object result = command.ExecuteScalar();
                    if (result != null)
                    {
                        System.Diagnostics.Debug.WriteLine($"Email for UserID {userID}: {result.ToString()}");
                        return result.ToString();
                    }
                    else
                    {
                        System.Diagnostics.Debug.WriteLine($"No email found for UserID {userID}");
                        return null;    
                    }
                }
            }
        }
    }
}