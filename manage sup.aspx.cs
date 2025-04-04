using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services.Description;

namespace pharmacy
{
    public partial class WebForm12 : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            dispdata();
        }

        private void dispdata()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                String s = "select * from suppliers";
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                GridView1.DataSource = td;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            GridView1.DataBind();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
            TextBox nm = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox mo = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;

            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "update suppliers set sname = '" + nm.Text + "',mob = '" + mo.Text + "' where id = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Supplier Updated!','','success')", true);
                GridView1.EditIndex = -1;
                dispdata();
            }

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
                string s = "delete from suppliers where id = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Supplier deleted!','','success')", true);
                GridView1.EditIndex = -1;
                dispdata();
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            dispdata();
        }
    }
}