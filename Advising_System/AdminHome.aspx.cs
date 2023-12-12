using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class AdminHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void get_Advisors(object sender, EventArgs e)
        {

            Response.Redirect("/All_Advisors.aspx");

        }
        protected void get_AdvisorsWithStudents(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListAllStudentsAdvisors.aspx");
        }
    }
}