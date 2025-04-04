using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class cash_set : System.Web.UI.Page
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
                    string q = "select billimg from setting";
                    SqlDataAdapter sd = new SqlDataAdapter(q, con);
                    DataTable td = new DataTable();
                    sd.Fill(td);
                    Image1.ImageUrl = td.Rows[0]["billimg"].ToString();
                }
            }
            detail();
        }

        public void detail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string q = "select * from users where email ='" + Session["cashier"].ToString() + "'";
                SqlDataAdapter sd = new SqlDataAdapter(q, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                od.Value = td.Rows[0]["password"].ToString();
            }
        }
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string img;
            if (FileUpload1.HasFile)
            {
                using (SqlConnection con = new SqlConnection(cons))
                {
                    string ip = "/assets/img/";
                    img = ip + FileUpload1.FileName;
                    FileUpload1.SaveAs(Server.MapPath(img));
                    string q = "update setting set billimg='" + img + "' where id=1";
                    con.Open();
                    cmd = new SqlCommand(q, con);
                    cmd.ExecuteNonQuery();
                    con.Close();
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Settings Updated!','','success')", true);
                }
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
                        string q = "update users set password='" + npd.Value + "' where email ='" + Session["cashier"].ToString() + "'";
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
    }
}