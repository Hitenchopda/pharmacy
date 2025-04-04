using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class dashboard2 : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        string cr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            nosale();
            totalsales();
            totbill();
            todaysale();
        }

        public void chdetail()
        {
            string q = "select * from users where email='" + Session["cashier"].ToString() + "'";
            SqlDataAdapter sd = new SqlDataAdapter(q, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            cr = td.Rows[0]["name"].ToString();
        }

        public void nosale()
        {
            chdetail();
            string t = "select count(id) from sales where cashier ='" + cr + "'";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            nosal.InnerText = td.Rows[0][0].ToString();
        }

        public void totbill()
        {
            chdetail();
            string t = "select count(bid) from bill where cashier ='" + cr + "'";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            totin.InnerText = td.Rows[0][0].ToString();
        }
        public void totalsales()
        {
            try
            {
                chdetail();
                string t = "select sum(total) from sales where cashier ='" + cr + "'";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                totsal.InnerText = "Rs " + td.Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                totsal.InnerText = "Rs 0";
            }
        }

        public void todaysale()
        {
            try
            {
                chdetail();
                string d = DateTime.Today.ToString();
                string t = "select sum(total) from sales where sdate = convert(datetime,'" + d + "',105) and cashier ='" + cr + "'";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                tdsl.InnerText = "Rs " + td.Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                tdsl.InnerText = "Rs 0";
            }
        }
    }
}