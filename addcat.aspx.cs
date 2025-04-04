using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.WebSockets;
using System.Web.Services.Description;

namespace pharmacy
{
    public partial class addcat : System.Web.UI.Page
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
            if (cn.Value == null)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Ivalid data!','','info')", true);
            }
            else
            {
                string n = cn.Value;
                String s = "insert into category values('{0}')";
                s = string.Format(s, n);
                con.setdata(s);
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Category Added!','','success')", true);
                cn.Value = "";
            }
        }
    }
}