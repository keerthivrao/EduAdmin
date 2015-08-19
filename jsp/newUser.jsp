
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
	<div class="formSubhead">User Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE >
				<TR>
					<TD width="25%">First Name</TD>
					<TD  width="35%"><input type="text" class="formTxt" name="distributorFirstName" id="distributorFirstName" value="" ></TD>
					<TD  width="20%">Middle Name</TD>
					<TD  width="30%"><input type="text" class="formTxt" name="distributorMiddleName" id="distributorMiddleName" value=""></TD>
				</TR>
				<TR>
					<TD>Last Name</TD>
					<TD><input type="text" class="formTxt" name="distributorLastName" id="distributorLastName" value="" ></TD>
					<TD>SSN</TD>
					<TD><input type="text" class="formTxt" name="distributorSSN" id="distributorSSN" value="" ></TD>
				</TR>
				<!--
				<TR>
					<TD>Company Name</TD>
					<TD><input type="text" class="formTxt" name="distributorCompanyName" id="distributorCompanyName" value="Tea Break" ></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				-->
				<TR>
					<TD colspan=4>&nbsp;</TD>
				</TR>				
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>
				<TR>
					<TD>Address 1</TD>
					<TD><input type="text" class="formTxt" name="distributorAddress1" id="distributorAddress1" value="" ><div>
					<TD>Address 2</TD>
					<TD><input type="text" class="formTxt" name="distributorAddress2" id="distributorAddress2" value="" ></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><input type="text" class="formTxt" name="distributorCity" id="distributorCity" value="" ></TD>	
					<TD>Zip</TD>
					<TD><input type="text" class="formTxt" name="distributorZip" id="distributorZip" value="" ></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><input type="text" class="formTxt" name="distributorState" id="distributorState" value="" ></TD>
					<TD>Country</TD>
					<TD><input type="text" class="formTxt" name="distributorState" id="distributorState" value="" ></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD><input type="text" class="formTxt" name="distributorPhone" id="distributorPhone" value="" ></TD>
					<TD>Mobile</TD>
					<TD><input type="text" class="formTxt" name="distributorMobile" id="distributorMobile" value="" ></TD>
				</TR>
				<TR>
					<TD>Work</TD>
					<TD><input type="text" class="formTxt" name="distributorWork" id="distributorWork" value="" ></TD>
					<TD>E-Mail</TD>
					<TD><input type="text" class="formTxt" name="distributorEMail" id="distributorEMail" value="" ></TD>
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
				
				<TR>
					<TD>Parent</TD>
					<TD><select class="formSelect">
								<option value="Mike">Mike</option>
							</select></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				-->
				<!--
				<TR>
					<TD>Role</TD>
					<TD><input type="text" class="formTxt" name="distributorRole" id="distributorRole" value="Sub Distributor" disabled></TD>
					<TD>Level</TD>
					<TD><input type="text" class="formTxt" name="distributorLevel" id="distributorLevel" value="2" disabled></TD>
				</TR>
				-->
				<TR>
					<TD>Role</TD>
					<TD>
						<select class="formSelect">
							<option value="1">Role1</option>
							<option value="2">Role2</option>
							<option value="3">Role3</option>
						</select>
					</TD>
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
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">		<input type="button" name="registerCustomer" value="Save Details" class="largeButton" onclick="alert('Details are saved \n click on close to exit the window')">&nbsp;&nbsp;
		<input type="button" name="registerCustomer" value="Close" class="largeButton" ></td>		
	</tr>
</table>

</form>
</body>
</html>
