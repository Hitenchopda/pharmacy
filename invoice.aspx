<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="invoice.aspx.cs" Inherits="pharmacy.invoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/s.css" rel="stylesheet" >
<link href="css/bootstrap.css" rel="stylesheet">

    <style>
			.invoice-box {
				max-width: 800px;
				margin: auto;
				padding: 30px;
				border: 1px solid #eee;
				box-shadow: 0 0 10px rgba(0, 0, 0, 0.15);
				font-size: 16px;
				line-height: 24px;
				font-family: 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
				color: #555;
			}

			.invoice-box table {
				width: 100%;
				line-height: inherit;
				text-align: left;
			}

			.invoice-box table td {
				padding: 5px;
				vertical-align: top;
			}

			.invoice-box table tr td:nth-child(2) {
				text-align: right;
			}

			.invoice-box table tr.top table td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.top table td.title {
				font-size: 45px;
				line-height: 45px;
				color: #333;
			}

			.invoice-box table tr.information table td {
				padding-bottom: 40px;
			}

			.invoice-box table tr.heading td {
				background: #eee;
				border-bottom: 1px solid #ddd;
				font-weight: bold;
			}

			.invoice-box table tr.details td {
				padding-bottom: 20px;
			}

			.invoice-box table tr.item td {
				border-bottom: 1px solid #eee;
			}

			.invoice-box table tr.item.last td {
				border-bottom: none;
			}

			.invoice-box table tr.total td:nth-child(2) {
				border-top: 2px solid #eee;
				font-weight: bold;
			}

			@media only screen and (max-width: 600px) {
				.invoice-box table tr.top table td {
					width: 100%;
					display: block;
					text-align: center;
				}

				.invoice-box table tr.information table td {
					width: 100%;
					display: block;
					text-align: center;
				}
			}

			/** RTL **/
			.invoice-box.rtl {
				direction: rtl;
				font-family: Tahoma, 'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
			}

			.invoice-box.rtl table {
				text-align: left;
			}

			.invoice-box.rtl table tr td:nth-child(2) {
				text-align: left;
			}
		</style>
	
	<script type="text/javascript">
        function disp() {
            window.print();
        }
    </script>
</head>
<body onload="disp()">
    <div class="invoice-box" style="margin-top:5rem;" id="bill">
		<div style="border:double;">
		<h3 class="text-center " style="background-color:royalblue;color:white;"><b>PHARMACY</b></h3>
			<table>
				<tr class="top">
					<td>
						<table>
							<tr>
								<td>
									<span class="text-primary">Bill No #:</span> <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label><br />
								</td>
								<td>
									<span class="text-primary">Bill date:</span> <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label><br />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<tr class="information">
					<td colspan="4">
						<table>
							<tr>
								<td colspan="3">
									<h5 class="text-primary"><b>Company details</b></h5>
									Pharmacy, Inc.<br />
									Pn marg road<br />
									Jamnagar, 12345
								</td>
								<td class="align-center" colspan="3">
									<asp:Image ID="Image1" runat="server" Height="100px" Width="150px" />
								</td>
								<td colspan3>
									<h5 class="text-primary"><b>Customer details</b></h5>
										Name <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label><br />
										Mob no. <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label><br />
								</td>
							</tr>
						</table>
					</td>
				</tr>

				<div class="invoice-body">
					<!-- Row start -->
					<div class="row gutters">
						<div class="col-lg-12 col-md-12 col-sm-12">
							<div class="table-responsive">
								<table class="table custom-table m-0">
									<thead style="background-color:royalblue;color:white;">
										<tr>
											<th>Sr no.</th>
											<th>Items</th>
											<th>Price</th>
											<th>Quantity</th>
											<th>Total</th>
										</tr>
									</thead>
									<tbody id="mytb" runat="server">
										
										
									</tbody>
								</table>
								<table style="table-layout:fixed;">
									<tr>
										<td style="white-space:nowrap;overflow:hidden;">
											<h5 ><strong>Payment</strong></h5>
											<h5 class="text-primary"><strong>Cash<br></strong></h5>
										</td>
										
										<td>
											<h5 ><strong>Grand Total</strong></h5>
											<h5 class="text-primary"><strong>Rs  <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label><br></strong></h5>
										</td>
									</tr>
								</table>
							</div>
							
						</div>
					</div>
					<!-- Row end -->
			</table>
			</div>
		</div>
	
</body>
</html>