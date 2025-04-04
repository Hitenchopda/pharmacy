<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="orders.aspx.cs" Inherits="pharmacy.orders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div style="margin-left:35rem;margin-top:5rem;margin-right:15rem;">
        <h3 class="text-primary">Orders <label id="message" class="text-primary" runat="server" style="font-size:large;margin-left:18rem"></label></h3>
    <asp:GridView ID="GridView1" runat="server" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" Width="785px" EnableViewState="False" OnRowDeleting="GridView1_RowDeleting" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Sr no">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("id") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="sname" HeaderText="Supplier name" />
            <asp:BoundField DataField="mob" HeaderText="Mobile no." />
            <asp:BoundField DataField="date" HeaderText="order date" />
            <asp:BoundField DataField="amount" HeaderText="Amount" />
            <asp:CommandField ShowDeleteButton="true" ControlStyle-CssClass="btn btn-primary" ControlStyle-ForeColor="White" HeaderText="Action">
<ControlStyle CssClass="btn btn-primary" ForeColor="White"></ControlStyle>
            </asp:CommandField>
        </Columns>
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
    </asp:GridView>
        </div>
</asp:Content>
