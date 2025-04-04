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
    public partial class report1 : System.Web.UI.Page
    {
        string con = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
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
            String s = "SELECT MAX(DATENAME(MM,pdate)) as Monthame,SUM(total) as Amount FROM purchase GROUP BY MONTH(pdate)";
            SqlDataAdapter sd = new SqlDataAdapter(s, con);
            DataTable td = new DataTable();
            sd.Fill(td);
            GridView1.DataSource = td;
            GridView1.DataBind();
        }
    }
}