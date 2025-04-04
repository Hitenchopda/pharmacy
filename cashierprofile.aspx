<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cashierprofile.aspx.cs" Inherits="pharmacy.cashierprofile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div class="container-fluid" style="margin-left:30rem;margin-top:10rem;">
        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>Update Profile</b></h4>
                <div class="row">
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Username</label>
                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Email</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                
                
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
