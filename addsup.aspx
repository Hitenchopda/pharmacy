<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addsup.aspx.cs" Inherits="pharmacy.WebForm8" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid" style="margin-left:30rem;margin-top:5rem;">
        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>New Supplier</b></h4>
                <div class="row mt-4">
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Enter name</label>
                  <input type="text" class="form-control" runat="server" id="sm" required>
                    </div>
                    <div class="col-6">
                        <label for="yourUsername" class="form-label">Mob no.</label>
                  <input type="text" class="form-control" runat="server"  id="mo" required maxlength="10">
                    </div>
                </div>
                
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>


                       
                   
</asp:Content>
