<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="bills.aspx.cs" Inherits="pharmacy.bills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <div style="margin-left:30rem;margin-top:5rem;margin-right:10rem;">
        <h3 style="color:royalblue;">Invoice's List <label id="message" class="text-primary" runat="server" style="font-size:large;margin-left:18rem"></label></h3>
        
    <asp:GridView ID="GridView1" runat="server"  ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" CellPadding="4" Width="879px" OnRowDeleting="GridView1_RowDeleting" >
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:TemplateField HeaderText="Sr no.">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("bid") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("bid") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="cashier" HeaderText="Cashier" />
            <asp:BoundField DataField="date" HeaderText="Bill date" />
            <asp:BoundField DataField="cname" HeaderText="Customer name" />
            <asp:BoundField DataField="mob" HeaderText="Mobile no." />
            <asp:BoundField DataField="amount" HeaderText="Amount" />
            <asp:CommandField HeaderText="Action" ShowDeleteButton="True" >
                <ControlStyle CssClass="btn btn-primary" ForeColor="White"></ControlStyle>
                                     </asp:CommandField>
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
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
