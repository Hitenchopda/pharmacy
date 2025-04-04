<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addcash.aspx.cs" Inherits="pharmacy.addcash" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid" style="margin-left:30rem;margin-top:10rem;">
        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>New Cashier</b></h4>
                <div class="row mb-4">
                    <div class="col-sm-12">
                  <label for="yourUsername" class="form-label">Enter name</label>
                  <input type="text" class="form-control"  runat="server" id="mn" required>
                  </div>
                    </div>

                <div class="row mb-4">
                    <div class="col-sm-12">
                  <label for="yourUsername" class="form-label">Enter email</label>
                  <input type="email" class="form-control"  runat="server" id="em" required>
                    </div>
                    </div>

                <div class="row mb-4">
                    <div class="col-sm-12">
                  <label for="yourUsername" class="form-label">Enter password</label>
                  <input type="password" class="form-control"  runat="server" id="p" required>
                </div>
                    </div>

                <div class="row mb-4">
                    <div class="col-12">
                  <label for="yourUsername" class="form-label">Enter confirm password</label>
                  <input type="password" class="form-control"  runat="server" id="cp" required>
                  </div>
                    </div>
                <input type="hidden" class="form-control"  runat="server" id="r">
                <input type="hidden" class="form-control"  runat="server" id="ss">
                <div class="text-center mt-4 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
