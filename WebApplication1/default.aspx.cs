using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Diagnostics;

namespace WebApplication1
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["PersonDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string insertedKey = "";

            using (SqlConnection myConnection = new SqlConnection(cs))
            {
                myConnection.Open();

                string insertString = "insert into [user] values(@name, @apple, @orange, @pear, @grape); select scope_identity()";
                SqlCommand cmd = new SqlCommand(insertString, myConnection);

                cmd.Parameters.AddWithValue("@name", TextBox1.Text);
                cmd.Parameters.AddWithValue("@apple", Apple.Checked);
                cmd.Parameters.AddWithValue("@orange", Orange.Checked);
                cmd.Parameters.AddWithValue("@pear", Pear.Checked);
                cmd.Parameters.AddWithValue("@grape", Grape.Checked);

                insertedKey = cmd.ExecuteScalar().ToString();

                Debug.Print("The values were inserted at key: " + insertedKey);

                Session["userID"] = insertedKey;

                myConnection.Close();
            }

           Server.Transfer("response.aspx", true);
        }
    }
}