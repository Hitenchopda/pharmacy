<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="set.aspx.cs" Inherits="pharmacy.set" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

  
    <div style="margin-left:25rem;margin-top:6rem;">
        <div class="col-md-11">
          <div class="card">
            <div class="card-header border-bottom mb-3 d-flex">
              <ul class="nav nav-pills nav-fill">
               
                  <li class="nav-item">
                  <a href="#security" data-bs-toggle="tab" class="nav-link has-icon active"><i class="bi bi-person-plus" style="font-size:1.5rem;"></i></a>
                </li>
                <li class="nav-item">
                  <a href="#account" data-bs-toggle="tab" class="nav-link has-icon"><i class="bi bi-shield" style="font-size:1.5rem;"></i></a>
                </li>
                
                <li class="nav-item">
                  <a href="#notification" data-bs-toggle="tab" class="nav-link has-icon"><i class="bi bi-gear" style="font-size:1.5rem;"></i></a>
                </li>
              </ul>
            </div>
            <div class="card-body tab-content">
              <div class="tab-pane" id="account">
                <h6 class="text-primary">SECURITY SETTINGS</h6>
                <hr>
                  <div class="row">
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Old password</label>
                        <input type="password" class="form-control"  runat="server" id="opd" required>
                        <input type="hidden" class="form-control"  runat="server" id="od" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">New password</label>
                        <input type="password" class="form-control"  runat="server" id="npd" required>
                    </div>
                </div><div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Confirm password</label>
                        <input type="password" class="form-control"  runat="server" id="cpd" required>
                    </div>
                </div>
                
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button2" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="Button2_Click" UseSubmitBehavior="False" />
                </div>
              </div>
              <div class="tab-pane active" id="security">
                <h6 class="text-primary">ADD ADMIN</h6>
                <hr>
                  <div class="row">
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Username</label>
                        <input type="text" class="form-control"  runat="server" id="nm" required>
                    </div>
                </div>
                  <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Email</label>
                        <input type="email" class="form-control"  runat="server" id="el" required>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Password</label>
                        <input type="password" class="form-control"  runat="server" id="pd" required>
                    </div>
                </div>
                  <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Confirm password</label>
                        <input type="password" class="form-control"  runat="server" id="pwd" required>
                        <input type="hidden" class="form-control"  runat="server" id="r">
                        <input type="hidden" class="form-control"  runat="server" id="ss">
                    </div>
                </div>
                
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button3" runat="server" Text="Add" CssClass="btn btn-primary btn-block" OnClick="Button3_Click" UseSubmitBehavior="False"/>
                </div>
              </div>
              <div class="tab-pane" id="notification">
                <h6 class="text-primary">SITE SETTINGS</h6>
                <hr>
                  <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Company Name</label>
                        <input type="text" class="form-control"  runat="server" id="lg" required>
                    </div>
                </div>
                
                <div class="text-center mt-1 p-2">
                    
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="btn btn-primary">Save</asp:LinkButton>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

</asp:Content>
