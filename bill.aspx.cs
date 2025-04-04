using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace pharmacy
{
    public partial class WebForm10 : System.Web.UI.Page
    {
        string cons = System.Configuration.ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        SqlCommand cmd = new SqlCommand();
        SqlCommand cmd1 = new SqlCommand();
        SqlCommand cmd2 = new SqlCommand();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["cashier"] == null)
            {
                Response.Redirect("login.aspx");
            }
            bd.Value = DateTime.Now.ToString("MM-dd-yyyy");
            chdetail();
            TextBox1.AutoPostBack = true;
            if (!IsPostBack)
            {
                DataTable td = new DataTable();
                td.Columns.AddRange(
                    new DataColumn[6]
                    {
                  new DataColumn("id"),
                  new DataColumn("bill date"),
                  new DataColumn("medicine name"),
                  new DataColumn("medicine price"),
                  new DataColumn("medicine quantity"),
                  new DataColumn("total")
                    }
                    );
                ViewState["bill"] = td;
                this.BindGrid();
            }
        }
        protected void BindGrid()
        {
            GridView1.DataSource = (DataTable)ViewState["bill"];
            GridView1.DataBind();
        }
        
        public void chdetail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                string q = "select * from users where email='" + Session["cashier"].ToString() + "'";
                SqlDataAdapter sd = new SqlDataAdapter(q, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                ch.Value = td.Rows[0]["name"].ToString();
            }
        }

        public void updatestock()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                int s = int.Parse(TextBox1.Text);
                int qt = int.Parse(q.Value);
                int so = s - qt;
                con.Open();
                String a = "update medicines set stock = '" + so + "' where Id = '" + DropDownList1.SelectedValue + "'";
                cmd = new SqlCommand(a, con);
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
       
        public void mdetail()
        {
            using (SqlConnection con = new SqlConnection(cons))
            {
                int n = Convert.ToInt32(DropDownList1.SelectedValue);
                String s = "select * from medicines where Id = " + n;
                SqlDataAdapter sd = new SqlDataAdapter(s, con);
                DataTable td = new DataTable();
                sd.Fill(td);
                pr.Value = td.Rows[0]["price"].ToString();
                TextBox1.Text = td.Rows[0]["stock"].ToString();
            }
        }

        protected void DropDownList1_SelectedIndexChanged1(object sender, EventArgs e)
        {
            mdetail();
        }

        int gt = 0;
        public static int amt;
        public void sales()
        {
            string d = DateTime.Today.ToString("MM-dd-yyyy");
            string nm = cn.Value;
            string c = ch.Value;
            int m = int.Parse(mo.Value);
            int tot = amt;

            using (SqlConnection con = new SqlConnection(cons))
            {
                string s = "insert into bill values(@date,@cname,@cashier,@mob,@amount) select @@identity;";
                con.Open();
                cmd = new SqlCommand(s, con);
                cmd.Parameters.AddWithValue("@date", d);
                cmd.Parameters.AddWithValue("@cname", nm);
                cmd.Parameters.AddWithValue("@cashier", c);
                cmd.Parameters.AddWithValue("@mob", m);
                cmd.Parameters.AddWithValue("@amount", tot);
                int sid = int.Parse(cmd.ExecuteScalar().ToString());

                string q = "insert into customers values(@name,@mob)";
                cmd2 = new SqlCommand(q, con);
                cmd2.Parameters.AddWithValue("@name", nm);
                cmd2.Parameters.AddWithValue("@mob", m);
                cmd2.ExecuteNonQuery();


                int t;

                for (int row = 0; row < GridView1.Rows.Count; row++)
                {
                    string o = GridView1.Rows[row].Cells[2].Text;
                    string dnm = GridView1.Rows[row].Cells[3].Text;
                    int j = int.Parse(GridView1.Rows[row].Cells[4].Text);
                    int k = int.Parse(GridView1.Rows[row].Cells[5].Text);
                    t = int.Parse(GridView1.Rows[row].Cells[6].Text);

                    string sq = "insert into sales values(@bid,@sdate,@mname,@cashier,@pr,@qty,@total)";
                    cmd1 = new SqlCommand(sq, con);
                    cmd1.Parameters.AddWithValue("@bid", sid);
                    cmd1.Parameters.AddWithValue("@sdate", o);
                    cmd1.Parameters.AddWithValue("@mname", dnm);
                    cmd1.Parameters.AddWithValue("cashier", c);
                    cmd1.Parameters.AddWithValue("@pr", j);
                    cmd1.Parameters.AddWithValue("@qty", k);
                    cmd1.Parameters.AddWithValue("@total", t);
                    cmd1.ExecuteNonQuery();
                }
                message.InnerText = "success";
                Response.Redirect("invoice.aspx?id=" + sid + "");
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string d = bd.Value;
            string mn = DropDownList1.SelectedItem.Text;
            string n = cn.Value;
            int m = int.Parse(mo.Value);
            int p = int.Parse(pr.Value);
            int qt = int.Parse(q.Value);
            updatestock();
            int t = p * qt;
            DataTable td = (DataTable)ViewState["bill"];
            td.Rows.Add(GridView1.Rows.Count + 1, d, mn.Trim(), p, qt, t);
            ViewState["bill"] = td;
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
            sales();
            
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            DataTable td = (DataTable)ViewState["bill"];
            if (td.Rows.Count > 0)
            {
                string n = GridView1.Rows[e.RowIndex].Cells[3].Text;
                int qt = int.Parse(GridView1.Rows[e.RowIndex].Cells[5].Text);

                using (SqlConnection con = new SqlConnection(cons))
                {
                    con.Open();
                    String a = "update medicines set stock = stock +'" + qt + "' where name = '" + n + "'";
                    cmd = new SqlCommand(a, con);
                    cmd.ExecuteNonQuery();
                    con.Close();

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
                        grdtot.Visible = false;
                    }
                    else
                    {
                        grdtot.InnerText = "Total Rs " + gt;
                    }
                }

            }

        }
    }
}