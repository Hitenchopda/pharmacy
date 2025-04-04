using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace pharmacy
{
    public partial class WebForm5 : System.Web.UI.Page
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
            if (mn.Value == "                        ")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Invalid Data!','','info')", true);
            }
            else
            {
                string n = mn.Value;
                string p = pr.Value;
                string sk = st.Value;
                string ex = ed.Value;
                string c = DropDownList1.SelectedItem.Value;
                string co = DropDownList2.SelectedItem.Value;
                String s = "insert into medicines values('{0}',{1},{2},'{3}','{4}','{5}')";
                s = string.Format(s, n, p, sk, ex, c, co);
                con.setdata(s);
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Medicine added!','','success')", true);
                mn.Value = "";
                pr.Value = "";
                st.Value = "";
            }
        }
    }
}