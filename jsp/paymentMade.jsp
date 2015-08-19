
<html>
	<head> 
		<title>Credit USA Add Payment</title>
	<style>
	</style>
	</head> 
	<link href="../stylesheet/creditusa_inner.css" type="text/css" rel="stylesheet" />
	<body>
	<form name="distributorRegistration" action="#" method="post">
	<!--
	<div style="padding-left:10px;padding-top:10px;font-size:13px;font-weight:bold;"><U> Distributor Details</U></div><BR/>
	-->
	<div class="formSubhead">Payment Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE >
				<TR>
					<TD width="25%">Payment Made By</TD>
					<TD width="35%"><input type="text" class="formTxt"name="ccHolderName" id="ccHolderName" value="Aless"></TD>
					<TD width="20%">Payment Mode</TD>
					<TD width="30%"><select class="formSelect">
								<option value="CC" >Credit Card Pay</option>
								<option value="CQ" selected>Cheque</option>
								<option value="MO">Money Order</option>
					 </select></TD>
					
				</TR>
				<TR>
					<TD>Account Number</TD>
					<TD><input type="text" class="formTxt"name="chequeNo" id="chequeNo" value="412909090909090909"></TD>
					<TD>Check Number</TD>
					<TD><input type="text" class="formTxt"name="chequeNo" id="chequeNo" value="55434556"></TD>
				</TR>
				<TR>
					<TD>Credit Card Number</TD>
					<TD><input type="text" class="formTxt"name="ccNo" id="ccNo" value=""></TD>
					<TD width="20%">Routing Number</TD>
					<TD width="30%"><input type="text" class="formTxt"name="customerRoutingNo" id="customerRoutingNo" value="1234567890"></TD>
					
				</TR>
				<TR>
					<TD>Expiration Date</TD>
					<TD><input type="text" class="formTxt"name="expirationDate" id="expirationDate" value="Not Required" disabled></TD>
					<TD>&nbsp;</TD>
					<TD>&nbsp;</TD>
				</TR>
				<TR>
					<TD>Address</TD>
					<TD><input type="text" class="formTxt"name="ccAddress" id="ccAddress" value="102"></TD>
					<TD>City</TD>
					<TD><input type="text" class="formTxt"name="ccCity" id="ccCity" value="CA"></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><input type="text" class="formTxt"name="ccState" id="ccState" value="CA"></TD>
					<TD>Zip Code</TD>
					<TD><input type="text" class="formTxt"name="ccZC" id="ccZC" value="456"></TD>
				</TR>
				<TR>
					<TD>CVV</TD>
					<TD><input type="text" class="formTxt"name="cvv" id="cvv" value="Not Required" disabled></TD>
					<TD></TD>
					<TD></TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="registerCustomer" value="Close" class="largeButton" onclick="self.close()">&nbsp;&nbsp;<input type="button" name="registerDistributor" value="Post Commisions" class="largeButton"></td>		
	</tr>
</table>

</form>
</body>
</html>