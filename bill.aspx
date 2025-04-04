<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="bill.aspx.cs" Inherits="pharmacy.WebForm10" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--<div style="background-color:royalblue;height:50px;margin-left:19rem;margin-top:5rem;width:51rem;" >
            <table>
                <tr>
                    <td><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox4" runat="server"></asp:TextBox></td>
                    <td><asp:TextBox ID="TextBox5" runat="server"></asp:TextBox></td>
                </tr>
            </table>
        </div>-->
    <div class="container-fluid" style="margin-left:30rem;margin-top:5rem;">
        
        

        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>New Invoice</b></h4>
                <div class="row">
                    <h5 class="text-primary">Customer details</h5>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Name</label>
                  <input type="text" class="form-control" runat="server" placeholder="" id="cn" required>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">mob no.</label>
                  <input type="text" class="form-control" runat="server" placeholder="" id="mo" required>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Bill date</label>
                 <input type="text" class="form-control" runat="server" placeholder="" id="bd" readonly>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Cashier</label>
                 <input type="text" class="form-control" runat="server" placeholder="" id="ch" readonly>
                    </div>
                </div>
                <hr>
                <div class="row">
                    <h5 class="text-primary">Medicine details</h5>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Select name</label>
                        <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="Id" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged1" AutoPostBack="True" ></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [medicines]"></asp:SqlDataSource>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">price</label>
                        <input type="text" class="form-control" runat="server" placeholder="" id="pr" readonly>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Current stock</label>
                        <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server" ReadOnly="True"></asp:TextBox>
                    </div>
                    <div class="col-3">
                        <label for="yourUsername" class="form-label">Quantity</label>
                        <input type="text" class="form-control" runat="server" placeholder="" id="q" required>
                    </div>
                </div>
                <div align="center" class="mt-3">
                    <label id="message" class="text-primary" runat="server" style="font-size:large"></label>
                  </div>
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Add item" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/>
                    <asp:Button ID="Button2" runat="server" Text="Print invoice" CssClass="btn btn-info btn-block" OnClick="Button2_Click"  ForeColor="White" />
                </div>
            </div>
        </div>
    </div>
                 <div style="margin-left:31rem;margin-top:5rem;">
                           <h4 class="mt-3">Item List <b><label id="grdtot" class="text-warning" runat="server" style="font-size:large;margin-left:22rem;"></label></b></h4>
                           <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AutoGenerateDeleteButton="True">
                               <AlternatingRowStyle BackColor="White" />
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center"/>
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <SortedAscendingCellStyle BackColor="#F5F7FB" />
                               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                               <SortedDescendingCellStyle BackColor="#E9EBEF" />
                               <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                       </div>
</asp:Content>
