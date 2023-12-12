using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Advising_System
{
    public partial class All_StudentsWithAdvisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
           
            Panel RadioPanel = new Panel();
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
                RadioButton radioButton = new RadioButton();
                ListItem listItem = new ListItem(Advisors_names[i], Advisors_IDS[i]);
                AllAdvisorsRadioList.Items.Add(listItem);

            }
            connection.Close();

        }
        protected void AllAdvisorsRadioList_SelectedIndexChanged(object sender, EventArgs e)
        {
            
        }
    }
}