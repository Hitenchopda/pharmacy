<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="pharmacy.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style2.css" rel="stylesheet">

    <title>login

    </title>
    <style type="text/css">
        #bg {
            background-image:url("assets/bg3.jpg");
            background-size:cover;
        }
    </style>
</head>
<body id="bg">
    <main>
    <div class="container">

      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-5 col-md-6 d-flex flex-column " style="margin-left:40rem;margin-right:-10rem;">

        

              <div class="card mb-3">

                <div class="card-body">

                  <div class=" pb-2">
                    <h5 class="card-title text-center pb-0 fs-4" style="color:mediumturquoise;">Welcome Back!</h5>
                  </div>

                  <form class="row g-3 needs-validation" novalidate runat="server">
                      <asp:Label ID="Label1" runat="server" Text="Label" Font-Size="Large"></asp:Label>
                    <div class="col-12">
                      <label for="yourUsername" class="form-label">Email</label>
                      <div class="input-group has-validation">
                          <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" TextMode="Email"></asp:TextBox>
                        <div class="invalid-feedback">Please enter your username.</div>
                      </div>
                    </div>

                    <div class="col-12">
                      <label for="yourPassword" class="form-label">Password</label>
                        <asp:TextBox ID="TextBox2" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                      <div class="invalid-feedback">Please enter your password!</div>
                    </div>
                    
                    <div class="col-12">
                        <asp:Button ID="Button1" runat="server" CssClass="form-control" Text="login" OnClick="Button1_Click" style="background-color:mediumturquoise;" ForeColor="White" />
                    </div>
                    <div class="col-12">
                      
                    </div>
                  </form>

                </div>
              </div>

            

            </div>
          </div>
        </div>

      </section>

</body>
</html>
