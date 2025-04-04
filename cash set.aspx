<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="cash set.aspx.cs" Inherits="pharmacy.cash_set" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-left:25rem;margin-top:6rem;">
        <div class="col-md-11">
          <div class="card">
            <div class="card-header border-bottom mb-3 d-flex">
              <ul class="nav nav-pills nav-fill">
               
                  
                <li class="nav-item active">
                  <a href="#account" data-bs-toggle="tab" class="nav-link has-icon active"><i class="bi bi-shield" style="font-size:1.5rem;"></i></a>
                </li>
                  <li class="nav-item">
                  <a href="#security" data-bs-toggle="tab" class="nav-link has-icon"><i class="bi bi-layout-text-sidebar-reverse" style="font-size:1.5rem;"></i></a>
                </li>
              </ul>
            </div>
            <div class="card-body tab-content">
              <div class="tab-pane active" id="account">
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
              <div class="tab-pane" id="security">
                <h6 class="text-primary">BILL SETTINGS</h6>
                <hr>
                  <div class="row">
                    <div class="col-12 mt-2">
                        <label for="yourUsername" class="form-label">Store logo</label>
                        <asp:Image ID="Image1" runat="server" CssClass="form-control" Height="200px" Width="200px"/>
                        <asp:FileUpload ID="FileUpload1" runat="server" CssClass="form-control mt-2"/>
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
