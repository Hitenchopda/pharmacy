using pharmacy.assets;
using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class invoice : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            bill();
            detail();
            mytb.InnerHtml = data();
            string data()
            {
                string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
                SqlCommand cmd = new SqlCommand();
                using (SqlConnection con = new SqlConnection(cons))
                {
                    int a = Convert.ToInt32(Request.QueryString["id"].ToString());
                    string s = "select * from sales where bid='" + a + "'";
                    cmd = new SqlCommand(s, con);
                    con.Open();
                    SqlDataReader r = cmd.ExecuteReader();
                    string h = "";
                    if (r.HasRows)
                    {
                        int i = 1;
                        while (r.Read())
                        {
                            h = h + "<tr><td>" + i + "</td>";
                            h = h + "<td style='text-align:left;'>" + r["mname"].ToString() + "</td>";
                            h = h + "<td>" + r["pr"].ToString() + "</td>";
                            h = h + "<td>" + r["qty"].ToString() + "</td>";
                            h = h + "<td>" + r["total"].ToString() + "</td>";
                            h = h + "</tr>";
                            i++;
                        }
                    }
                    con.Close();
                    return h;
                }
            }
        }

        public void detail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "select cmpname,billimg from setting";
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                Image1.ImageUrl = td.Rows[0]["billimg"].ToString();
            }
        }

        public void bill()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                con.Open();
                int a = Convert.ToInt32(Request.QueryString["id"].ToString());
                string s = "select * from bill where bid='" + a + "'";
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                Label1.Text = td.Rows[0]["bid"].ToString();
                Label2.Text = td.Rows[0]["date"].ToString();
                Label3.Text = td.Rows[0]["cname"].ToString();
                Label4.Text = td.Rows[0]["mob"].ToString();
                Label5.Text = td.Rows[0]["amount"].ToString();
                con.Close();
            }
        }
        
    }
}