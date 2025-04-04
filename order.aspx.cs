using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace pharmacy
{
    public partial class WebForm9 : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            pd.Value = DateTime.Now.ToString("MM-dd-yyyy");
            if (!IsPostBack)
            {
                DataTable td = new DataTable();
                td.Columns.AddRange(
                    new DataColumn[6]
                    {
                  new DataColumn("id"),
                  new DataColumn("order date"),
                  new DataColumn("medicine name"),
                  new DataColumn("medicine price"),
                  new DataColumn("medicine quantity"),
                  new DataColumn("total")
                    }
                    );
                ViewState["order"] = td;
                this.BindGrid();
            }
        }

        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["order"];
            GridView1.DataBind();
        }
        public void sdetail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                int n = Convert.ToInt32(DropDownList1.SelectedValue);
                String s = "select * from suppliers where Id = " + n;
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                mo.Value = td.Rows[0]["mob"].ToString();
            }
        }
        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            sdetail();
        }

        public void purchase()
        {
            string d = DateTime.Now.ToString("MM-dd-yyyy");
            string nm = DropDownList1.SelectedItem.Text;
            int m = int.Parse(mo.Value);
            int tot = amt;

            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "insert into orders values(@date,@sname,@mob,@amount) select @@identity;";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@date", d);
                cmd.Parameters.AddWithValue("@sname", nm);
                cmd.Parameters.AddWithValue("@mob", m);
                cmd.Parameters.AddWithValue("@amount", tot);
                int kid = int.Parse(cmd.ExecuteScalar().ToString());


                int t = 0;

                for (int row = 0; row < GridView1.Rows.Count; row++)
                {
                    string o = GridView1.Rows[row].Cells[2].Text;
                    string dnm = GridView1.Rows[row].Cells[3].Text;
                    int j = int.Parse(GridView1.Rows[row].Cells[4].Text);
                    int k = int.Parse(GridView1.Rows[row].Cells[5].Text);
                    t = int.Parse(GridView1.Rows[row].Cells[6].Text);

                    string sq = "insert into purchase values(@pid,@pdate,@med,@pr,@qty,@total)";
                    cmd1 = new SqlCommand(sq, con);
                    cmd1.Parameters.AddWithValue("@pid", kid);
                    cmd1.Parameters.AddWithValue("@pdate", o);
                    cmd1.Parameters.AddWithValue("@med", dnm);
                    cmd1.Parameters.AddWithValue("@pr", j);
                    cmd1.Parameters.AddWithValue("@qty", k);
                    cmd1.Parameters.AddWithValue("@total", t);
                    cmd1.ExecuteNonQuery();
                }
                ClientScript.RegisterStartupScript(this.GetType(), "k", "swal('Order placed successfully!','','success')", true);
                con.Close();
            }
        }
        int gt = 0;
        public static int amt;
        protected void Button1_Click(object sender, EventArgs e)
        {
            string d = pd.Value.ToString();
            string sn = DropDownList1.SelectedItem.Text;
            string med = mn.Value;
            int m = int.Parse(mo.Value);
            int p = int.Parse(pr.Value);
            int qt = int.Parse(q.Value);
            int t = p * qt;
            DataTable td = (DataTable)ViewState["order"];
            td.Rows.Add(GridView1.Rows.Count + 1, d, med, p, qt, t);
            ViewState["order"] = td;
            this.BindGrid();

            
            for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
            {
                gt = gt + int.Parse(GridView1.Rows[i].Cells[6].Text);
            }
            message.InnerText = "item added";
            amt = gt;
            grdtot.InnerText = "Total Rs " + gt;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            purchase();
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable td = (DataTable)ViewState["order"];
            if (td.Rows.Count > 0)
            {
                td.Rows[e.RowIndex].Delete();
                GridView1.DataSource = td;
                GridView1.DataBind();
                for (int i = 0; i <= GridView1.Rows.Count - 1; i++)
                {
                    gt = gt + int.Parse(GridView1.Rows[i].Cells[6].Text);
                }

                message.InnerText = "item removed";
                amt = gt;
                if (gt == 0) 
                {
                    grdtot.Visible= false;
                }
                else
                {
                    grdtot.InnerText = "Total Rs " + gt;
                }
            }
        }
    }
}