using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Admin_Login : System.Web.UI.Page
    {
        public class Admin
        {
            public int AdminId { get; set; }
            public string Password { get; set; }

            public Admin()
            {
                AdminId = 207;
                Password = "205505";
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Login_Click(object sender, EventArgs e)
        {

            try
            {   
                
                string idT = AdminID.Text;
                string password = this.password.Text;


                if (string.IsNullOrEmpty(idT) || string.IsNullOrEmpty(password))
                {
                    SuccessLabel.Text = "All Fields are required";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
                else
                {   
                    int success = 0;
                    int id = Int32.Parse(idT);
                    Admin admin = new Admin();
                    if (id  == admin.AdminId && password == admin.Password)
                    {
                        success = 1;    
                    }else
                    {
                        success = 0;
                    }               
                    System.Diagnostics.Debug.WriteLine(success);
                    if (success == 1)
                    {
                        Session["UserID"] = id;
                        Session["UserRole"] = "Admin";
                        Response.Redirect("/AdminHome.aspx");
                        System.Diagnostics.Debug.WriteLine(Session["UserID"]);
                    }
                    else
                    {
                        SuccessLabel.Text = "Incorrect Password or UserID Please Register First";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                    }
                }
            }
            catch (Exception ex)
            {

                SuccessLabel.Text = $"Error: {ex.Message}";
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
        }
    }
}