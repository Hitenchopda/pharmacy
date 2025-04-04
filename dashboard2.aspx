<%@ Page Title="" Language="C#" MasterPageFile="~/Site2.Master" AutoEventWireup="true" CodeBehind="dashboard2.aspx.cs" Inherits="pharmacy.dashboard2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <style type="text/css">
        .dashboard .sales-card .card-icon {
             color: #fff;
             background: #0066FF;
        }

        .dashboard .sale-card .card-icon {
            color: #fff;
            background: #2eca6a;
        }

        .dashboard .pur-card .card-icon {
            color: #fff;
            background: #0094ff;
        }
        .dashboard .tdsale-card .card-icon {
            color: #fff;
            background: #00ff90;
        }
        </style>

    <section class="section dashboard">
      <div class="row" style="margin-left:21rem;margin-top:6rem;">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sales-card">

                

                <div class="card-body">
                  <h5 class="card-title">No. of Sales</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-capsule-pill"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:20px;"><label id="nosal" runat="server"></label></h6>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card sale-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Sales</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cash-stack"></i>
                    </div>
                    <div class="ps-3">
                      <h6 ><label id="totsal" runat="server"></label></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            

            <!-- Customers Card -->
            <div class="col-xxl-4 col-md-6">

              <div class="card info-card pur-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Invoices</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-layout-text-sidebar-reverse"></i>
                    </div>
                    <div class="ps-3">
                      <h6 ><label id="totin" runat="server"></label></h6>
                      

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->


              <div class="col-xxl-4 col-md-6" style="margin-left:48.6rem;margin-top:-11.8rem;">

              <div class="card info-card tdsale-card">

                

                <div class="card-body">
                  <h5 class="card-title">Today Sale</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-currency-rupee"></i>
                    </div>
                    <div class="ps-3">
                      <h6 ><label id="tdsl" runat="server"></label></h6>
                      

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

              </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>


</asp:Content>
