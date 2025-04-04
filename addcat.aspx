<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="addcat.aspx.cs" Inherits="pharmacy.addcat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container-fluid" style="margin-left:30rem;margin-top:10rem;">
        <div class="card w-50">
            <div class="card-body">
                <h4 class="text-primary text-center mt-3"><b>New Category</b></h4>
                <div class="row">
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Category name</label>
                        <input type="text" class="form-control"  runat="server" id="cn" required>
                    </div>
                </div>
                
                
                <div class="text-center mt-1 p-2">
                    <asp:Button ID="Button1" runat="server" Text="Save" CssClass="btn btn-primary btn-block" OnClick="Button1_Click"/>
                </div>
            </div>
        </div>
    </div>

    
                      

</asp:Content>
