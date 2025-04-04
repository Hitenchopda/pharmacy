<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="manage cat.aspx.cs" Inherits="pharmacy.manage_cat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
     <div style="margin-left:31rem;margin-top:5rem;">
                           <h3 class="text-primary mt-3">Category Lists</h3>
                           <asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="None" Width="732px" AutoGenerateColumns="False" EnableViewState="False" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
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
                                   <asp:TemplateField HeaderText="Name">
                                       <EditItemTemplate>
                                           <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("catname") %>'></asp:TextBox>
                                       </EditItemTemplate>
                                       <ItemTemplate>
                                           <asp:Label ID="Label2" runat="server" Text='<%# Eval("catname") %>'></asp:Label>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                                   
                                   <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-primary" ControlStyle-ForeColor="White" HeaderText="Action">
                                   </asp:CommandField>

                                   <asp:TemplateField HeaderText="Action">
                                       <ItemTemplate>
                                           <asp:Button CommandName="Delete" CssClass="btn btn-danger" runat="server" Text="Delete" OnClientClick="return confirm('Are you sure to delete the record?');"/>
                                       </ItemTemplate>
                                   </asp:TemplateField>
                               </Columns>
                               <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                               <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center"/>
                               <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                               <RowStyle BackColor="#EFF3FB" HorizontalAlign="Center"/>
                               <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                               <SortedAscendingCellStyle BackColor="#F5F7FB" />
                               <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                               <SortedDescendingCellStyle BackColor="#E9EBEF" />
                               <SortedDescendingHeaderStyle BackColor="#4870BE" />
                           </asp:GridView>
                       </div>
    <script>
      
    </script>
</asp:Content>
