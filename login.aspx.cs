using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;

namespace pharmacy
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
                string s = "select * from users where email = '" + TextBox1.Text + "' and password = '" + TextBox2.Text + "'";
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                if (td.Rows.Count == 1)
                {
                     if (td.Rows[0][5].ToString() == "1")
                     {
                         Session["user"] = TextBox1.Text;
                         Response.Redirect("dashboard.aspx");
                     }
                     else if(td.Rows[0][5].ToString() == "0")
                     {
                         if (td.Rows[0][4].ToString() == "1")
                         {
                             Session["cashier"] = TextBox1.Text;
                             Response.Redirect("dashboard2.aspx");
                         }
                         else
                         {
                             Label1.Visible = true;
                             Label1.ForeColor = Color.Red;
                             Label1.Text = "Your account is blocked!";
                         }
                     }
                }
                else
                {
                    Label1.Visible = true;
                    Label1.ForeColor = Color.Red;
                    Label1.Text = "Incorrect email or password!";
                }
        }
    }
}