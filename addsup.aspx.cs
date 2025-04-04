using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Services.Description;

namespace pharmacy
{

    public partial class WebForm8 : System.Web.UI.Page
    {
        assets.functions con;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            con = new assets.functions();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (sm.Value == "              ")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Invalid Data!','','info')", true);
            }
            else
            {
                string n = sm.Value;
                string m = mo.Value;
                String s = "insert into suppliers values('{0}',{1})";
                s = string.Format(s, n, m);
                con.setdata(s);
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Supplier added!','','success')", true);
                sm.Value = "";
                mo.Value = "";
            }
        }

    }
}