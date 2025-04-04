<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addmed.aspx.cs" Inherits="pharmacy.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid" style="margin-left:30rem;margin-top:10rem;">
        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>New Medicine's</b></h4>
                <div class="row mt-4">
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Enter name</label>
                  <input type="text" class="form-control"  runat="server" id="mn" required>
                    </div>
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Select category</label>
                  <asp:DropDownList ID="DropDownList1" runat="server" CssClass="form-control" DataSourceID="SqlDataSource1" DataTextField="catname" DataValueField="catname" AutoPostBack="True" ></asp:DropDownList>
                 <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT * FROM [category]"></asp:SqlDataSource>
                    </div>
                </div>
                
                <div class="row mt-3">
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Price</label>
                        <input type="text" class="form-control"  runat="server" id="pr" required>
                    </div>
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Select company</label>
                        <asp:DropDownList ID="DropDownList2" CssClass="form-control" runat="server" DataSourceID="SqlDataSource2" DataTextField="sname" DataValueField="sname" AutoPostBack="True"></asp:DropDownList>
                  <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=|DataDirectory|\Database1.mdf;Integrated Security=True" ProviderName="System.Data.SqlClient" SelectCommand="SELECT [sname] FROM [suppliers]"></asp:SqlDataSource>
                    </div>
                </div>
                <div class="row mt-3">
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">stock</label>
                        <input type="text" class="form-control"  runat="server" id="st" required>
                    </div>
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Expiry date</label>
                        <input type="date" class="form-control" runat="server"  id="ed" required>
                    </div>
                </div>
                <div align="center" class="mt-3">
                    <label id="message" class="text-primary" runat="server" style="font-size:large"></label>
                  </div>
                <div class="text-center mt-4 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
