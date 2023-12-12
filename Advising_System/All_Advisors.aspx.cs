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
    public partial class All_Advisors : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void get_Advisors(object sender, EventArgs e)
        {
            string connectionStirng = WebConfigurationManager.ConnectionStrings["Advising_Team_13"].ToString();
            SqlConnection connection = new SqlConnection(connectionStirng);
            try
            {
         
                SqlCommand Procedures_AdminListAdvisors = new SqlCommand("Procedures_AdminListAdvisors", connection);
                Procedures_AdminListAdvisors.CommandType = CommandType.StoredProcedure;
                connection.Open();
                SqlDataReader reader = Procedures_AdminListAdvisors.ExecuteReader(CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    DataTable dataTable = new DataTable();
    
                    dataTable.Load(reader);

                    AllAdvisorsTable.DataSource = dataTable;
                    AllAdvisorsTable.DataBind();

                }
            }
            catch (Exception ex)
            {
                // Handle the exception (e.g., log it, display an error message)
                Console.WriteLine("Error: " + ex.Message);
            }
            finally
            {
                connection.Close();
            }

            
        }
    }
}