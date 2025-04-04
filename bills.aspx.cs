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
    public partial class bills : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        string cr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            totalbill();
            
        }

        public void chdetail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string q = "select * from users where email='" + Session["cashier"].ToString() + "'";
                SqlDataAdapter sd = new SqlDataAdapter(q, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                cr = td.Rows[0]["name"].ToString();
            }
        }
        public void totalbill()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                chdetail();
                string t = "select * from bill where cashier='" + cr + "'";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
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
                string s = "delete from bill where bid = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Invoice deleted!','','success')", true);
                GridView1.EditIndex = -1;
                totalbill();
            }
        }
    }
}