using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using static System.Net.Mime.MediaTypeNames;

namespace pharmacy
{
    public partial class WebForm7 : System.Web.UI.Page
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
                String s = "select * from users where role = 0";
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
            dispdata();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            dispdata();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
            TextBox nm = GridView1.Rows[e.RowIndex].FindControl("TextBox1") as TextBox;
            TextBox em = GridView1.Rows[e.RowIndex].FindControl("TextBox2") as TextBox;
            TextBox pd = GridView1.Rows[e.RowIndex].FindControl("TextBox3") as TextBox;
            TextBox ro = GridView1.Rows[e.RowIndex].FindControl("TextBox4") as TextBox;

            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "update users set name = '" + nm.Text + "',email = '" + em.Text + "',password = '" + pd.Text + "',role = '" + Convert.ToInt32(ro.Text) + "' where id = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Cashier Updated!','','success')", true);
                GridView1.EditIndex = -1;
                dispdata();
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                Label id = GridView1.Rows[e.RowIndex].FindControl("Label1") as Label;
                string s = "delete from users where id = '" + Convert.ToInt32(id.Text) + "'";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Cashier deleted!','','success')", true);
                GridView1.EditIndex = -1;
                dispdata();
            }
        }

        protected void status(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            GridViewRow row = btn.NamingContainer as GridViewRow;
            if (btn.Text == "Deactive")
            {
                btn.BackColor = Color.Red;
            }
            else
            {
                btn.BackColor = Color.Green;
            }
            int id = Convert.ToInt32(this.GridView1.DataKeys[row.RowIndex].Value);
            string s = "update users set status=@s where id=@i";

            using (SqlConnection con = new SqlConnection(cons))
            {
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@i", id);
                cmd.Parameters.AddWithValue("@s", btn.Text == "Deactive" ? 1 : 0);
                cmd.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Cashier status updated!','','success')", true);
                dispdata();
            }
        }
    }
}