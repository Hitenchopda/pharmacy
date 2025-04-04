using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services.Description;
using System.Data;

namespace pharmacy
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            dispdata();
        }

        private void dispdata()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                String s = "select * from customers";
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                GridView1.DataSource = td;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;

                string s = "delete from customers where id = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Customer deleted!','','success')", true);
                GridView1.EditIndex = -1;
                dispdata();
            }
        }
    }
}