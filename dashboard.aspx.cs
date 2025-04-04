using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Reflection.Emit;

namespace pharmacy
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            totalpur();
            totalsales();
            totalmedicine();
            totalusers();
            totalcash();
            totalbill();
            totalsup();
            outstk();
            expmed();
            totord();
            todaysale();
            todaypurchase();
        }

        public void totalmedicine()
        {
            string t = "select count(id) from medicines";
            SqlDataAdapter sd = new SqlDataAdapter(t ,con);
            DataTable td = new DataTable();
            sd.Fill(td);
            totmed.InnerText = td.Rows[0][0].ToString();
        }

        public void totalusers()
        {
            string t = "select count(id) from customers";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            totus.InnerText = td.Rows[0][0].ToString();
        }

        public void totalcash()
        {
            string t = "select count(id) from users where role = 0";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            chr.InnerText = td.Rows[0][0].ToString();
        }
        public void totalsales()
        {
            try
            {
                string t = "select sum(total) from sales";
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

        public void totalpur()
        {
            try
            {
                string t = "select sum(total) from purchase";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                totpc.InnerText = "Rs " + td.Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                totpc.InnerText = "Rs 0";
            }
        }
        public void totalbill()
        {
            string t = "select count(bid) from bill";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            tb.InnerText = td.Rows[0][0].ToString();
        }

        public void totalsup()
        {
            string t = "select count(id) from suppliers";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            totsup.InnerText = td.Rows[0][0].ToString();
        }

        public void outstk()
        {
            string t = "select count(id) from medicines where stock = 0";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            ost.InnerText = td.Rows[0][0].ToString();
        }

        public void expmed()
        {
            try
            {
                string d = DateTime.Today.ToString();
                string t = "select count(id) from medicines where expdate <= convert(datetime,'" + d + "',105)";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                ex.InnerText = td.Rows[0][0].ToString();
            }
            catch (Exception e)
            {
                ex.InnerText = "error";
            }
        }
        public void todaysale()
        {
            try
            {
                string d = DateTime.Today.ToString();
                string t = "select sum(total) from sales where sdate = convert(datetime,'" + d + "',105)";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                sale.InnerText = "Rs " + td.Rows[0][0].ToString();
                
            }
            catch (Exception e)
            {
                sale.InnerText = "Rs 0";
            }
        }

        public void todaypurchase()
        {
            try
            {
                string d = DateTime.Today.ToString();
                string t = "select sum(total) from purchase where pdate = convert(datetime,'" + d + "',105)";
                SqlDataAdapter sd = new SqlDataAdapter(t, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                pur.InnerText = "Rs "+ td.Rows[0][0].ToString();
                            
            }
            catch (Exception e)
            {
                pur.InnerText = "Rs 0";
            }
        }

        public void totord()
        {
            string t = "select count(id) from orders";
            SqlDataAdapter sd = new SqlDataAdapter(t, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            od.InnerText = td.Rows[0][0].ToString();
        }
    }
}