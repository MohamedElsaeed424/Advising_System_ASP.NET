﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class AdvisorHome : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserID"] == null || Session["UserRole"] == null || Session["UserRole"].ToString() != "Advisor")
            {
                Response.Redirect("/404Page.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    name.InnerText = "Welcome, " + Session["UserName"].ToString();
                }
            }
        }

        protected void AllStudents_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_AllAdvisingStudents.aspx");
        }

        protected void InsertNewGrad_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_GraduationPlan.aspx");
        }

        protected void AllStudentsWMajor_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_AllStudentsMajorCourse.aspx");
        }

        protected void AllRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_AllRequests.aspx");
        }

        protected void AllPendingRequests_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_AllPendingRequests.aspx");
        }

        protected void RespondCHReq_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_extraCHRequest.aspx");
        }

        protected void RespondCourseReq_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_extraCourseRequest.aspx");
        }

        protected void Requests_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Advisor_RequestStuff.aspx");
        }

        protected void LogOut_Click(object sender, EventArgs e)
        {
            Session.Clear();
            Response.Redirect("/Advisor_login.aspx");
        }
    }
}