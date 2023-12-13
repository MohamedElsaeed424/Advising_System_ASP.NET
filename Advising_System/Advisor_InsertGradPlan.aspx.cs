using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class Advisor_InsertGradPlan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void BackAdvisorHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdvisorHome.aspx");
        }

        protected void CreateGrad_Click(object sender, EventArgs e)
        {
            string semCode = semesterCode.Text;
            string gradDate = semesterCode.Text;
            string CH = semCH.Text;
            string StID = StudentID.Text;
            int advisorID = 8; // session["UserID"]
            if(string.IsNullOrEmpty(semCode) || string.IsNullOrEmpty(gradDate)
                || string.IsNullOrEmpty(CH) || string.IsNullOrEmpty(StID)) { }
            
        }
    }
}