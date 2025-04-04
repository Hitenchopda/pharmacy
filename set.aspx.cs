using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class set : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            r.Value = "1";
            ss.Value = "1";
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            if (!Page.IsPostBack)
            {
                using (SqlConnection con = new SqlConnection(cons))
                {
                    string q = "select cmpname from setting";
                    SqlDataAdapter sd = new SqlDataAdapter(q, con);
                    DataTable td = new DataTable();
                    sd.Fill(td);
                    lg.Value = td.Rows[0]["cmpname"].ToString();
                }
            }
            detail();
        }

        public void detail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string q = "select * from users where email ='" + Session["user"].ToString() + "'";
                SqlDataAdapter sd = new SqlDataAdapter(q, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                od.Value = td.Rows[0]["password"].ToString();
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            detail();
            if (opd.Value == od.Value)
            {
                if (npd.Value == cpd.Value)
                {
                    using (SqlConnection con = new SqlConnection(cons))
                    {
                        string q = "update users set password='" + npd.Value + "' where email ='" + Session["user"].ToString() + "'";
                        con.Open();
                        cmd = new SqlCommand(q, con);
                        cmd.ExecuteNonQuery();
                        con.Close();
                        ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Password Updated!','','success')", true);
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Password do not match!','','info')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Incorrect Old Password!','','info')", true);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            if (pd.Value == pwd.Value)
            {
                using (SqlConnection con = new SqlConnection(cons))
                {
                    cmd = new SqlCommand("insert into users values(@name,@email,@password,@status,@role)", con);
                    con.Open();
                    cmd.Parameters.AddWithValue("@name", nm.Value);
                    cmd.Parameters.AddWithValue("@email", el.Value);
                    cmd.Parameters.AddWithValue("@password", pd.Value);
                    cmd.Parameters.AddWithValue("@status", ss.Value);
                    cmd.Parameters.AddWithValue("@role", r.Value);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Admin Added Successfully!','','success')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Password do not match!','','info')", true);
            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            if (lg.Value != null)
            {
                using (SqlConnection con = new SqlConnection(cons))
                {
                    string q = "update setting set cmpname='" + lg.Value + "' where id = 1";
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Changes Saved!','','success')", true);
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Invalid data!','','info')", true);
            }
        }
    }
}