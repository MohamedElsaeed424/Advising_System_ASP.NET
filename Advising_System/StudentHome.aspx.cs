﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class StudentHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void ViewGradPlan(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewGradPlan.aspx");
        }
        protected void ViewNotPaidInst(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewNotPaidInst.aspx");
        }
        protected void ViewCoursesWithExams(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewCoursesWithExams.aspx");
        }
        protected void FirstMakeupRegister(object sender, EventArgs e)
        {
            Response.Redirect("/Student_FirstMakeupRegister.aspx");
        }
        protected void SecondMakeupRegister(object sender, EventArgs e)
        {
            Response.Redirect("/Student_SecondMakeupRegister.aspx");
        }
        protected void ViewCoursesWithSlotsAndInstructors(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewCoursesWithSlotsAndInstructors.aspx");
        }
        protected void ViewSlotsForCourse(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewSlotsForCourse.aspx");
        }
        protected void ChooseInstructorForCourse(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ChooseInstructorForCourse.aspx");
        }
        protected void ViewCoursesWithPrereq(object sender, EventArgs e)
        {
            Response.Redirect("/Student_ViewCoursesWithPrereq.aspx");
        }

    }
}