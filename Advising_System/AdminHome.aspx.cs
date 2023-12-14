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
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Admin")
            {
                Response.Redirect("/404Page.aspx");
            }
        }
        protected void get_Advisors(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListAllAdvisors.aspx");
        }
        protected void get_AdvisorsWithStudents(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListAllStudentsAdvisors.aspx");
        }
        protected void get_AllPendingRequests(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListAllPendingRequests.aspx");
        }
        protected void Post_newSemetser(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_AddNewSemester.aspx");
        }
        protected void Post_newCourse(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_AddNewCourse.aspx");
        }
        protected void get_AllInstructorsWithThereCourses(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListInstructorCourse.aspx");
        }
        protected void get_AllOfferedCourses(Object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ListAllSemestersCourses.aspx");
        }
        protected void post_LinkInstructorToCourse(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_LinkInstructorCourseSlot.aspx");
        } 
        protected void post_LinkStudentToAdvisor(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_LinkStudentAdvisor.aspx");
        } 
        protected void post_LinkStudentToCourseInstructor(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_LinkStudentCourseInstructor.aspx");
        }
        protected void Get_FetchSemWCourse(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_FetchSemWCourse.aspx");
        }

        protected void ViewStudentsTranscript(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_viewStudentsTranscriptDetails.aspx");
        }

        protected void viewPayment(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_viewPaymentDetailsForStudent.aspx");
        }

        protected void ViewGPWadvisor(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_ViewGPWadvisor.aspx");
        }

        protected void ViewAllActiveStudents(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_fetchActiveStudents.aspx");
        }

        protected void DeleteCourseWSlots(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_DeleteCourseWSlot.aspx");
        }

        protected void IssueInstallment(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_issueInstallments.aspx");
        }

        protected void UpdateFinancial(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_UpdateFinancialStatus.aspx");
        }

        protected void DelteSlot(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_deleteSlot.aspx");
        }

        protected void AddMakeup(object sender, EventArgs e)
        {
            Response.Redirect("/Admin_AddMakeupExam.aspx");
        }
    }
}
