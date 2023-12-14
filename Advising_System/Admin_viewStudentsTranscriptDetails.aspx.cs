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
    public partial class Admin_viewStudentsTranscriptDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);

            SqlCommand viewTrans = new SqlCommand("SELECT S.student_id , (S.f_name + ' ' +S.l_name) As 'student name' , SC.course_id , c.name AS 'Course name' ,\r\n\t   SC.exam_type , SC.grade AS ' course grade' , SC.semester_code AS 'Semester', I.name AS 'Instructor name' \r\nFROM (((Student_Instructor_Course_Take SC \r\nINNER JOIN Student S on S.student_id = SC.student_id )\r\nINNER JOIN Course c on SC.course_id = c.course_id )\r\nINNER JOIN Instructor I on SC.Instructor_id = I.Instructor_id)\r\nWHERE SC.grade IS NOT NULL\r\n;", connection);
            viewTrans.CommandType = CommandType.Text; ;
            connection.Open();

            SqlDataReader reader = viewTrans.ExecuteReader(CommandBehavior.CloseConnection);
            DataTable dataTable = new DataTable();

            dataTable.Load(reader);

            viewTransGV.DataSource = dataTable;
            viewTransGV.DataBind();
        }

        protected void BackAdminHome(object sender, EventArgs e)
        {
            Response.Redirect("/AdminHome.aspx");
        }
    }
}