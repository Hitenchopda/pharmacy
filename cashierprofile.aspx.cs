using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class cashierprofile : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!Page.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cons))
                {
                    string q = "select * from users where email ='" + Session["cashier"].ToString() + "'";
                    SqlDataAdapter sd = new SqlDataAdapter(q, con);
                    DataTable td = new DataTable();
                    sd.Fill(td);
                    TextBox1.Text = td.Rows[0]["name"].ToString();
                    TextBox2.Text = td.Rows[0]["email"].ToString();
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "update users set name='" + TextBox1.Text + "',email='" + TextBox2.Text + "' where email='" + Session["cashier"].ToString() + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Profile Updated!','','success')", true);
            }
        }
    }
}