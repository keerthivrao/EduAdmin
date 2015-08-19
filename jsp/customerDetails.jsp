<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<html:form action="customer.do" method="post">
	<html:hidden property="acode"/>
	<div style="padding-left:15px">
	<div class="formSubhead">Customer Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE>
				<TR>
					<TD width="25%">First Name</TD>
					<TD width="35%"><html:text styleClass="formTxt" property="firstname" /></TD>
					<TD width="20%">Middle Name</TD>
					<TD width="30%"><html:text styleClass="formTxt" property="middlename" /></TD>
				</TR>
				<TR>
					<TD>Last Name</TD>
					<TD><html:text styleClass="formTxt" property="lastname" /></TD>
					<TD>SSN</TD>
					<TD><html:text styleClass="formTxt" property="ssn" /></TD>
				</TR>
				<TR>
					<TD>Date Of Birth</TD>
					<TD><html:text styleClass="formTxt" property="dob" /></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>
				<TR>
					<TD>Address 1</TD>
					<TD><html:text styleClass="formTxt" property="address1" /><div>
					<TD>Address 2</TD>
					<TD><html:text styleClass="formTxt" property="address2" /></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" property="city" /></TD>	
					<TD>Zip</TD>
					<TD><html:text styleClass="formTxt" property="zip" /></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:text styleClass="formTxt" property="state" /></TD>
					<TD>Country</TD>
					<TD><html:text styleClass="formTxt" property="country" /></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD><html:text styleClass="formTxt" property="phone" /></TD>
					<TD>Mobile</TD>
					<TD><html:text styleClass="formTxt" property="mobile" /></TD>
				</TR>
				<TR>
					<TD>Work</TD>
					<TD><html:text styleClass="formTxt" property="work" /></TD>
					<TD>E-Mail</TD>
					<TD><html:text styleClass="formTxt" property="email" /></TD>
				</div></TD>
				</TR>
				<TR>
					<TD>Enrolled Distributor</TD>
					<TD><input type="text" class="formTxt"name="customerRegisteredBy" id="customerRegisteredBy" value="Mike" disabled></TD>
					<TD>Customer Status</TD>
					<TD><select class="formSelect">
								<option value="N" selected>New</option>
								<option value="P">Paid</option>
								<option value="C">Closed</option>
							</select></TD>
				</TR>
				<!--
				<TR>
					<TD colspan=4>
					Payment Details
					</TD>
				</TR>
				<TR>
					<TD>Pay By</TD>
					<TD><select class="formSelect">
								<option value="CC" selected>Credit Card Pay</option>
								<option value="CQ">Cheque</option>
								<option value="MO">Money Order</option>
					 </select></TD>
					<TD>Routing Number</TD>
					<TD><input type="text" class="formTxt"name="customerRoutingNo" id="customerRoutingNo" value="1234567890"></TD>
				</TR>
				<TR>
					<TD>Account Number</TD>
					<TD><select class="formSelect">
								<option value="CC" selected>Credit Card Pay</option>
								<option value="CQ">Cheque</option>
								<option value="MO">Money Order</option>
					 </select></TD>
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
					<TD colspan=4 class="boldItalic">To be Filled By BOU</TD>
				</TR>
				-->
				<TR>
					<TD>Amount Received</TD>
					<TD><input type="CheckBox" name="amountReceivedFlag" id="amountReceivedFlag" value="" disabled></TD>
					<TD>Approval Code</TD>
					<TD><input type="text" class="formTxt"name="custApprCode" id="custApprCode" value="System Generated Code" disabled></TD>
				</TR>
				<TR>
					<TD colspan=2>Customer Order Status</TD>
					<TD colspan=2><select class="formSelect">
									<option value="New">New Order</option>
									<option value="R" selected>Restoration Completed</option>
									<option value="F">Restoration Failed</option>
									<option value="Progress">Restoration in progress</option>
									</select>
					</TD>
				</TR>
			</TABLE>
<Div style="padding-bottom:5px;"></DIV>
				<Div style="border:1px solid #A5B2BD;padding-bottom:5px;">
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
		<td align="center">
		<input type="button" name="registerCustomer" value="Save Details" class="largeButton" onclick="alert('Details are saved \n click on close to exit the window')">&nbsp;&nbsp;
		<input type="button" name="registerCustomer" value="Approve" class="largeButton" onclick="alert('Customer approved\n click on close to exit the window')">&nbsp;&nbsp;<input type="button" name="registerCustomer" value="Reject" class="largeButton" onclick="alert('Customer rejected\n click on close to exit the window')">&nbsp;&nbsp;<input type="button" name="registerCustomer" value="Close" class="largeButton" onclick="self.close()">
		</td>		
	</tr>
</table>

</form>
</div>
