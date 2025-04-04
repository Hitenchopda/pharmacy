using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class addcash : System.Web.UI.Page
    {
        assets.functions con;
        protected void Page_Load(object sender, EventArgs e)
        {
            r.Value = "0";
            ss.Value = "0";
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            con = new assets.functions();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            if (p.Value == cp.Value) 
            {
                if (mn.Value == "                        ")
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Invalid Data!','','info')", true);
                }
                else
                {
                    string n = mn.Value;
                    string el = em.Value;
                    string pw = p.Value;
                    string ro = r.Value;
                    string st = ss.Value;
                    String s = "insert into users values('{0}','{1}',{2},{3},{4})";
                    s = string.Format(s, n, el, pw, st, ro);
                    con.setdata(s);
                    ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Cashier added!','','success')", true);
                    mn.Value = "";
                    em.Value = "";
                    p.Value = "";
                    cp.Value = "";
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Incorrect email or password!','','info')", true);
            }
        }
    }
}