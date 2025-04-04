using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Reflection.Emit;
using System.Net.WebSockets;

namespace pharmacy
{
    public partial class Site1 : System.Web.UI.MasterPage
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            showdata();
            showlogo();
        }
        public void showdata()
        {
            string s = "select * from users where email = '" + Session["user"] + "'";
            SqlDataAdapter sd = new SqlDataAdapter(s, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            Label1.Text = td.Rows[0][1].ToString();
        }

        public void showlogo()
        {
            string s = "select cmpname from setting";
            SqlDataAdapter sd = new SqlDataAdapter(s, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            Label2.Text = td.Rows[0]["cmpname"].ToString();
            Label3.Text = td.Rows[0]["cmpname"].ToString();
        }

    }
}