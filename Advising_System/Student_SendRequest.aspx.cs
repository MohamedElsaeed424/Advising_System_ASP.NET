using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Student_SendRequest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["UserRole"] = "Student";
            Session["UserID"] = 1; /////////////////////////////////////////////////////////////
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Student")
            {
                Response.Redirect("/404Page.aspx");
            }
            if (CH.Checked)
            {
                Courses.Visible = false;
                Credit.Visible = true;
                Which.Visible = true;
                Which.Text = "Credit Hours";
            }
            else if (CourseRadio.Checked && !isButtonPostBack())
            {
                Credit.Visible = false;
                Courses.Visible = true;
                Which.Visible = true;
                Which.Text = "Courses";
                DropDownLoader.loadCourseListWithID(Courses, SuccessLabel);
            }
            else
            {
                Courses.Visible = false;
                Credit.Visible = false;
                Which.Visible = false; 
            }
        }

        protected void Submit_Click(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
                string comment = Comment.Text;
                if (CH.Checked)
                {
                    string temp = Credit.Text;
                    if(string.IsNullOrEmpty(temp)) 
                    {
                        SuccessLabel.Text = "Error: Input Credit Hours";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                        return;
                    }
                    int cred = Int32.Parse(temp);

                    SqlCommand CreditRequest = new SqlCommand("Procedures_StudentSendingCHRequest", connection); // {Session["UserID"]} put in input of fn
                    CreditRequest.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    CreditRequest.Parameters.AddWithValue("@StudentID", Session["UserID"]);
                    CreditRequest.Parameters.AddWithValue("@credit_hours", cred);
                    CreditRequest.Parameters.AddWithValue("@type", "credit_hours");
                    CreditRequest.Parameters.AddWithValue("@comment", comment);
                    int nRowsAffected = CreditRequest.ExecuteNonQuery();
                    if(nRowsAffected > 0)
                    {
                        SuccessLabel.Text = "Successfully Submitted";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;
                    }
                }
                else if(CourseRadio.Checked)
                {
                    string temp = Courses.SelectedValue;
                    if (string.IsNullOrEmpty(temp))
                    {
                        SuccessLabel.Text = "Error: Choose a Course";
                        SuccessLabel.ForeColor = System.Drawing.Color.Red;
                        SuccessLabel.Visible = true;
                        return;
                    }
                    int id = Int32.Parse(temp);
                    SqlCommand CourseRequest = new SqlCommand("Procedures_StudentSendingCourseRequest", connection); // {Session["UserID"]} put in input of fn
                    CourseRequest.CommandType = CommandType.StoredProcedure;
                    connection.Open();
                    CourseRequest.Parameters.AddWithValue("@StudentID", Session["UserID"]);
                    CourseRequest.Parameters.AddWithValue("@courseID", id);
                    CourseRequest.Parameters.AddWithValue("@type", "course");
                    CourseRequest.Parameters.AddWithValue("@comment", comment);
                    int nRowsAffected = CourseRequest.ExecuteNonQuery();
                    if (nRowsAffected > 0)
                    {
                        SuccessLabel.Text = "Successfully Submitted";
                        SuccessLabel.ForeColor = System.Drawing.Color.Green;
                        SuccessLabel.Visible = true;
                    }
                }
                else
                {
                    SuccessLabel.Text = "Error: Choose a type first";
                    SuccessLabel.ForeColor = System.Drawing.Color.Red;
                    SuccessLabel.Visible = true;
                }
            }
            catch (Exception ex)
            {
                SuccessLabel.Text = "Error: " + ex.Message;
                SuccessLabel.ForeColor = System.Drawing.Color.Red;
                SuccessLabel.Visible = true;
            }
            finally { connection.Close(); }
        }
        private bool isButtonPostBack()
        {
            Control control = null;
            //first we will check the "__EVENTTARGET" because if post back made by       the controls
            //which used "_doPostBack" function also available in Request.Form collection.

            string ctrlname = Page.Request.Params["__EVENTTARGET"];
            if (ctrlname != null && ctrlname != String.Empty)
            {
                control = Page.FindControl(ctrlname);
                return false;
            }
            // if __EVENTTARGET is null, the control is a button type and we need to
            // iterate over the form collection to find it
            else
            {
                return true;
            }
        }
    }
}