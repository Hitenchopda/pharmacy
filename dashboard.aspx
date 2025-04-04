<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="dashboard.aspx.cs" Inherits="pharmacy.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
            background: #ff771d;
        }
        .dashboard .outstk-card .card-icon {
            color: #fff;
            background: #ffd800;
        }
        .dashboard .bill-card .card-icon {
            color: #fff;
            background: #0094ff;
        }
        .dashboard .cust-card .card-icon {
            color: #fff;
            background: #00ff90;
        }
        .dashboard .supp-card .card-icon {
            color: #fff;
            background: brown;
        }
        .dashboard .exp-card .card-icon {
            color: #fff;
            background: red;
        }
        .dashboard .customers-card .card-icon {
            color: #fff;
            background: #335c67;
        }
        .dashboard .cash-card .card-icon {
            color: #fff;
            background: #e1ad01;
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
                  <h5 class="card-title">Total Medicines</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-capsule-pill"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:20px;"><label id="totmed" runat="server"></label></h6>

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
                      <i class="bi bi-currency-rupee"></i>
                    </div>
                    <div class="ps-3">
                      <h6 ><label id="totsal" runat="server"></label></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

            

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card pur-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total purchase</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-cart-plus"></i>
                    </div>
                    <div class="ps-3">
                      <h6 ><label id="totpc" runat="server"></label></h6>
                      

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

  </main><!-- End #main -->


    <!-- pt 2-->
    <section class="section dashboard">
      <div class="row" style="margin-left:21rem;">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Sales Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card bill-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Invoices</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-layout-text-sidebar-reverse"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:10px;"><label id="tb" runat="server"></label></h6>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->

            <!-- Revenue Card -->
            <div class="col-xxl-3 col-md-6">
              <div class="card info-card cust-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Customers</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:10px;"><label id="totus" runat="server"></label></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->

              <div class="col-xxl-3 col-md-6">
              <div class="card info-card cash-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Cashiers</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-person-fill"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:10px;"><label id="chr" runat="server"></label></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->
            

              <div class="col-xxl-3 col-xl-12">

              <div class="card info-card supp-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total Suppliers</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-people"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:10px;"><label id="totsup" runat="server"></label></h6>
                      

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->

              <!-- Revenue Card -->
            

            
              </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

    <!-- pt 3-->

    <section class="section dashboard">
      <div class="row" style="margin-left:21rem;">

        <!-- Left side columns -->
        <div class="col-lg-8">
          <div class="row">

            <!-- Customers Card -->
            <div class="col-xxl-4 col-xl-12">

              <div class="card info-card customers-card">

                

                <div class="card-body">
                  <h5 class="card-title">Total orders</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-clipboard2-check"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:20px;"><label id="od" runat="server"></label></h6>
                      

                    </div>
                  </div>

                </div>
              </div>

            </div><!-- End Customers Card -->


              <!-- Customers Card -->
            
                                                            
              <!-- Sales Card -->
            <div class="col-xxl-4 col-md-6">
              <div class="card info-card outstk-card">

                

                <div class="card-body">
                  <h5 class="card-title">Out of stock medicines</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-archive"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:20px;"><label id="ost" runat="server"></label></h6>

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Sales Card -->


              <div class="col-xxl-4 col-md-6">
              <div class="card info-card exp-card">

                

                <div class="card-body">
                  <h5 class="card-title">Expired Medicines</h5>

                  <div class="d-flex align-items-center">
                    <div class="card-icon rounded-circle d-flex align-items-center justify-content-center">
                      <i class="bi bi-exclamation-octagon"></i>
                    </div>
                    <div class="ps-3">
                      <h6 style="margin-left:10px;"><label id="ex" runat="server"></label></h6>
                      

                    </div>
                  </div>
                </div>

              </div>
            </div><!-- End Revenue Card -->


              </div>
          </div><!-- End News & Updates -->

        </div><!-- End Right side columns -->

      </div>
    </section>

  </main><!-- End #main -->

    <!-- my right -->


    <!-- Right side columns -->
        <div class="col-lg-2" style="margin-left:73.6rem;margin-top:-27.6rem;">

          <!-- Recent Activity -->
          <div class="card">
           
            <div class="card-body">
              <h4 class="card-title" style="padding-left:34px;"><b>Today's Report</b></h4>

                        <table class="table table-bordered">
 
  <tbody>
    <tr>
        <th scope="col">Today Sales</th>
        </tr>
      <tr>
        <th scope="col" >
            <h4><b><label class="text-success text-center" runat="server" id="sale" ></b></label></h4>
        </th>
          </tr>
      <tr>
      <th scope="col">Today Purchase</th>
          </tr>
      <tr>
      <th scope="row" >
          <h4><b><label class="text-danger text-center" runat="server" id="pur"></b></label></h4>
      </th>
    </tr>
    
  </tbody>
</table>              

              </div>

            </div>
          </div><!-- End Recent Activity -->

        </div><!-- End Right side columns -->




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
</asp:Content>
