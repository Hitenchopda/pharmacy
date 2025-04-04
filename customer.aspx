<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="customer.aspx.cs" Inherits="pharmacy.WebForm6" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

                       <div style="margin-left:31rem;margin-top:5rem;">
                           <h3 class="mt-3  text-primary">Customer's List <label id="message" class="text-primary" runat="server" style="font-size:large;margin-left:18rem"></label></h3>
                           <asp:GridView ID="GridView1" runat="server" ForeColor="#333333" AutoGenerateColumns="False" CellPadding="4" GridLines="None" Width="785px" OnRowDeleting="GridView1_RowDeleting">
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
<asp:BoundField DataField="name" HeaderText="Name"></asp:BoundField>
                                   <asp:BoundField DataField="mob" HeaderText="Mobile no." />
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
