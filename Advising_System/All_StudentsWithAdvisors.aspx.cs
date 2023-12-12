using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class All_StudentsWithAdvisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
                SqlConnection connection = new SqlConnection(connectionStirng);

                SqlCommand Procedures_AdminListAdvisors = new SqlCommand("Procedures_AdminListAdvisors", connection);
                Procedures_AdminListAdvisors.CommandType = CommandType.StoredProcedure;
                connection.Open();

                List<string> Advisors_names = new List<string>();
                List<string> Advisors_IDS = new List<string>();

                SqlDataReader reader = Procedures_AdminListAdvisors.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    string advisorName = reader["name"].ToString();
                    string advisorID = reader["advisor_id"].ToString();

                    Advisors_names.Add(advisorName);
                    Advisors_IDS.Add(advisorID);
                }

                for (int i = 0; i < Advisors_names.Count; i++)
                {
                    ListItem listItem = new ListItem(Advisors_names[i], Advisors_IDS[i]);
                    AllAdvisorsRadioList.Items.Add(listItem);
                }

                connection.Close();
            }
        }

        private string GetSelectedMajor()
        {
            return AllMajorsRadioList.SelectedValue;
        }
        protected void AllMajorsRadioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string selectedMajor = GetSelectedMajor();

        }
        protected void AllAdvisorsRadioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {  

                SqlCommand Procedures_AdvisorViewAssignedStudents = new SqlCommand("Procedures_AdvisorViewAssignedStudents", connection);
                Procedures_AdvisorViewAssignedStudents.CommandType = CommandType.StoredProcedure;

                // Add parameters
                Procedures_AdvisorViewAssignedStudents.Parameters.Add(new SqlParameter("@AdvisorID", SqlDbType.Int));
                Procedures_AdvisorViewAssignedStudents.Parameters["@AdvisorID"].Value = int.Parse(AllAdvisorsRadioList.SelectedValue);

                Procedures_AdvisorViewAssignedStudents.Parameters.Add(new SqlParameter("@major", SqlDbType.VarChar, 40));
                Procedures_AdvisorViewAssignedStudents.Parameters["@major"].Value = GetSelectedMajor();

                connection.Open();

                SqlDataReader reader = Procedures_AdvisorViewAssignedStudents.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    DataTable dataTable = new DataTable();

                    dataTable.Load(reader);

                    AllStudentsWithAdvisorsTable.DataSource = dataTable;
                    AllStudentsWithAdvisorsTable.DataBind();

                }
            }
            catch (Exception ex) {
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }
           

        }
    }
}