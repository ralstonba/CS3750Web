using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        static string cs = ConfigurationManager.ConnectionStrings["PersonDB"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {
            string uid = (string)(Session["userID"]).ToString();
            Debug.Print("I should be reading from key: " + uid);

            using (SqlConnection myConnection = new SqlConnection(cs))
            {
                string queryString = "select * from [user] where userID=@uid";
                SqlCommand sqlCmd = new SqlCommand(queryString, myConnection);
                sqlCmd.Parameters.AddWithValue("@uid", uid);

                string debugQuery = sqlCmd.CommandText;

                foreach(SqlParameter p in sqlCmd.Parameters)
                {
                    debugQuery = debugQuery.Replace(p.ParameterName, p.Value.ToString());
                }

                Debug.Print(debugQuery);

                sqlCmd.Parameters.AddWithValue("@userid", uid);

                myConnection.Open();

                SqlDataReader dr = sqlCmd.ExecuteReader();

                if (dr.Read())
                {
                    Debug.Print("There was something to read");
                    responseString.Text = "Name: " + dr["Name"].ToString() + ", Apple:" + dr["Apple"].ToString() + ", Orange:" + dr["Orange"].ToString() + ", Pear:" + dr["Pear"].ToString() + ", Grape:" + dr["Grape"].ToString();
                }
                else
                {
                    Debug.Print("There was nothing to read");
                }
            }
        }
    }
}