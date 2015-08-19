
<html>
	<head> 
		<title>Credit USA Distributor Registration</title>
	<style>
	</style>
	</head> 
	<link href="../stylesheet/creditusa_inner.css" type="text/css" rel="stylesheet" />
	<body>
	<form name="distributorRegistration" action="#" method="post">
	<!--
	<div style="padding-left:10px;padding-top:10px;font-size:13px;font-weight:bold;"><U> Distributor Details</U></div><BR/>
	-->
	<div class="formSubhead">Distributor Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE >
				<TR>
					<TD>Distributor Type</TD>
					<TD><select class="formSelect" onchange="showDetails(this.value)" readonly>
										<option value="I">Individual</option>
										<option value="C">Company</option>
									</select>
					</TD>
					<TD colspan=2>&nbsp;</TD>
				</TR>
				<TR>
					<TD width="25%">First Name</TD>
					<TD  width="35%"><input type="text" class="formTxt" name="distributorFirstName" id="distributorFirstName" value="Mike" ></TD>
					<TD  width="20%">Middle Name</TD>
					<TD  width="30%"><input type="text" class="formTxt" name="distributorMiddleName" id="distributorMiddleName" value=""></TD>
				</TR>
				<TR>
					<TD>Last Name</TD>
					<TD><input type="text" class="formTxt" name="distributorLastName" id="distributorLastName" value="Taylor" ></TD>
					<TD>SSN</TD>
					<TD><input type="text" class="formTxt" name="distributorSSN" id="distributorSSN" value="US56789" ></TD>
				</TR>
				<TR>
					<TD>Company Name</TD>
					<TD><input type="text" class="formTxt" name="distributorCompanyName" id="distributorCompanyName" value="Tea Break" ></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>
				<TR>
					<TD>Address 1</TD>
					<TD><input type="text" class="formTxt" name="distributorAddress1" id="distributorAddress1" value="Flat No : 198" ><div>
					<TD>Address 2</TD>
					<TD><input type="text" class="formTxt" name="distributorAddress2" id="distributorAddress2" value="CA" ></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><input type="text" class="formTxt" name="distributorCity" id="distributorCity" value="CA" ></TD>	
					<TD>Zip</TD>
					<TD><input type="text" class="formTxt" name="distributorZip" id="distributorZip" value="234" ></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><input type="text" class="formTxt" name="distributorState" id="distributorState" value="CA" ></TD>
					<TD>Country</TD>
					<TD><input type="text" class="formTxt" name="distributorState" id="distributorState" value="CA" ></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD><input type="text" class="formTxt" name="distributorPhone" id="distributorPhone" value="001111111111" ></TD>
					<TD>Mobile</TD>
					<TD><input type="text" class="formTxt" name="distributorMobile" id="distributorMobile" value="001222222222" ></TD>
				</TR>
				<TR>
					<TD>Work</TD>
					<TD><input type="text" class="formTxt" name="distributorWork" id="distributorWork" value="001222444442" ></TD>
					<TD>E-Mail</TD>
					<TD><input type="text" class="formTxt" name="distributorEMail" id="distributorEMail" value="123@123.com" ></TD>
				</div></TD>
				</TR>
				<!--
				<TR>
					<TD>Registered By</TD>
					<TD><input type="text" class="formTxt" name="distributorRegisteredBy" id="distributorRegisteredBy" value="Mike" disabled></TD>
					<TD>Reports To</TD>
					<TD><select class="formSelect">
								<option value="Mike">Mike</option>
							</select></TD>
				</TR>
				-->
				<TR>
					<TD>Parent</TD>
					<TD><select class="formSelect">
								<option value="Mike">Mike</option>
							</select></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<!--
				<TR>
					<TD>Role</TD>
					<TD><input type="text" class="formTxt" name="distributorRole" id="distributorRole" value="Sub Distributor" disabled></TD>
					<TD>Level</TD>
					<TD><input type="text" class="formTxt" name="distributorLevel" id="distributorLevel" value="2" disabled></TD>
				</TR>
				-->
				<TR>
					<TD>Commision On Mike</TD>
					<TD>$2500</TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>Active</TD>
					<TD><input type="CheckBox" name="distributorEnableFlag" id="distributorEnableFlag" value="" disabled checked></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>Start Date</TD>
					<TD><input type="text" class="formTxt" name="distributorStartDate" id="distributorStartDate" value="10/10/2007" disabled></TD>
					<TD>End Date</TD>
					<TD><input type="text" class="formTxt" name="distributorEndDate" id="distributorEndDate" value="" disabled></TD>
				</TR>
			</TABLE>
<Div style="padding-bottom:5px;"></DIV>
				<Div style="border:1px solid #A5B2BD;padding-bottom:5px;width:90%;">
				<Table>
				<TR>
					<TD colspan=4 class="boldItalic">
					Payment Details
					</TD>
				</TR>
				<TR>
					<TD colspan=4>&nbsp;
					</TD>
				</TR>
				<TR>
					<TD width="25%">Amount</TD>
					<TD width="35%"><input type="text" class="formTxt" name="amountToPay" id="amountToPay" value="2500"></TD>
					<TD colspan=2></TD>
				</TR>
				<TR>
					<TD width="25%">Pay By</TD>
					<TD width="35%"><select class="formSelect">
								<option value="CC" selected>Credit Card Pay</option>
								<option value="CQ">Cheque</option>
								<option value="MO">Money Order</option>
					 </select></TD>
					<TD width="20%">Routing Number</TD>
					<TD width="30%"><input type="text" class="formTxt"name="customerRoutingNo" id="customerRoutingNo" value=""></TD>
				</TR>
				<TR>
					<TD>Account Number</TD>
					<TD><input type="text" class="formTxt"name="accNo" id="accNo" value=""></TD>
					<TD>Check Number</TD>
					<TD><input type="text" class="formTxt"name="chequeNo" id="chequeNo" value=""></TD>
				</TR>
				<TR>
					<TD>Credit Card Number</TD>
					<TD><input type="text" class="formTxt"name="ccNo" id="ccNo" value=""></TD>
					<TD>Holder Name</TD>
					<TD><input type="text" class="formTxt"name="ccHolderName" id="ccHolderName" value=""></TD>
				</TR>
				<TR>
					<TD>Expiration Date</TD>
					<TD><input type="text" class="formTxt"name="expirationDate" id="expirationDate" value="Not Required" disabled></TD>
					<TD>Holder Name</TD>
					<TD><input type="text" class="formTxt"name="ccHolderName" id="ccHolderName" value=""></TD>
				</TR>
				<TR>
					<TD>Address</TD>
					<TD><input type="text" class="formTxt"name="ccAddress" id="ccAddress" value=""></TD>
					<TD>City</TD>
					<TD><input type="text" class="formTxt"name="ccCity" id="ccCity" value=""></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><input type="text" class="formTxt"name="ccState" id="ccState" value=""></TD>
					<TD>Zip Code</TD>
					<TD><input type="text" class="formTxt"name="ccZC" id="ccZC" value=""></TD>
				</TR>
				<TR>
					<TD>CVV</TD>
					<TD><input type="text" class="formTxt"name="cvv" id="cvv" value="Not Required" disabled></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>Confirm Payment </TD>
					<TD><input type="button" class="largeButton" name="paymentConfirmed" id="paymentConfirmed" value="Confirm Payment" onclick="alert('Payment Confirmed !!');this.disabled=true"></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				
			</TABLE>
			</DIV>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">		<input type="button" name="registerCustomer" value="Save Details" class="largeButton" onclick="alert('Details are saved \n click on close to exit the window')">&nbsp;&nbsp;
		<input type="button" name="registerCustomer" value="Approve" class="largeButton" onclick="alert('Distributor approved\n click on close to exit the window')">&nbsp;&nbsp;<input type="button" name="registerCustomer" value="Reject" class="largeButton" onclick="alert('Distributor rejected\n click on close to exit the window')">&nbsp;&nbsp;<input type="button" name="registerCustomer" value="Close" class="largeButton" onclick="self.close()"></td>		
	</tr>
</table>

</form>
</body>
</html>