<%@ include file="taglibs.jsp"%>
	<html:form action="customer.do" method="post">
	<html:hidden property="acode" value="1007"/>
	<html:hidden property="addressid"/>
	<html:hidden property="paymentId"/>
	<html:hidden property="customerId"/>
	<html:hidden  property="customerstatus"/>
	<div class="formSubhead">Enroll Customer</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE>
				<TR>
					<TD width="25%">First Name</TD>
					<TD width="35%"><html:text styleClass="formTxt" styleId="customerFirstName" property="firstname" /></TD>
					<TD width="20%">Middle Name</TD>
					<TD width="30%"><html:text styleClass="formTxt" styleId="customerMiddleName" property="middlename" /></TD>
				</TR>
				<TR>
					<TD>Last Name</TD>
					<TD><html:text styleClass="formTxt" styleId="customerlastName" property="lastname" /></TD>
					<TD>SSN</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="customerssn~1" onkeyup="limitText('customerssn~1', 3,'customerssn~2')" />-<input type="text" class="formSplitTxt" id="customerssn~2" onkeyup="limitText('customerssn~2', 2,'customerssn~3')" />-<input type="text" class="formSplitTxt" id="customerssn~3" onkeyup="limitText('customerssn~3', 4)" />
					<script>
					splitSSN('<bean:write name="customerForm" property="ssn"/>','customerssn');
					</script>
					<html:hidden styleClass="formTxt" styleId="customerssn" property="ssn" /></TD>					
				</TR>
				<TR>
					<TD>Date Of Birth (mm/dd/yyyy)</TD>
					<TD><html:text styleClass="formTxt" styleId="customerdob" property="dob" readonly="false" onchange="validateDateFormat(this)"/>
					<!-- 
					<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('dob'),'mm/dd/yyyy',this)"/>
					-->
					<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('customerdob'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
					</TD>
					<TD>Order Status</TD>
					<TD>
						<logic:equal name="customerForm" property="customerstatus" value="N">
							<html:select styleClass="formSelect" styleId="orderStatus" property="orderStatus" disabled="true">
								<html:optionsCollection property="orderStatusList" label="label" value="value"/>
							</html:select>
						</logic:equal>
						<logic:empty name="customerForm" property="customerstatus">
							<html:select styleClass="formSelect" styleId="orderStatus" property="orderStatus" disabled="true">
								<html:optionsCollection property="orderStatusList" label="label" value="value"/>
							</html:select>
						</logic:empty>
						<logic:notEmpty name="customerForm" property="customerstatus">
							<logic:notEqual name="customerForm" property="customerstatus" value="N">								
								<html:select styleClass="formSelect" styleId="orderStatus" property="orderStatus">
									<html:optionsCollection property="orderStatusList" label="label" value="value"/>
								</html:select>
							</logic:notEqual>
						</logic:notEmpty>
					</TD>
				</TR>
				<TR>
					<TD colspan=4>&nbsp;</TD>
				</TR>
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>
				<TR>
					<TD>Address 1</TD>
					<TD><html:text styleClass="formTxt" styleId="customerAddress1" property="address1" /><div>
					<TD>Address 2</TD>
					<TD><html:text styleClass="formTxt" styleId="customerAddress2" property="address2" /></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" styleId="customerCity" property="city" /></TD>	
					<TD>Zip</TD>
					<TD><html:text styleClass="formTxt" styleId="customerZip" property="zip" onchange="setState(this,'customerState','displaycustomerState')"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:hidden styleClass="formTxt" styleId="customerState" property="state" />
					<input type="text" class="formTxt" id="displaycustomerState" name="displaycustomerState" disabled/>
					</TD>
					<TD>Country</TD>
					<TD><html:text styleClass="formTxt" styleId="customerCountry" property="country" disabled="true"/></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="customerPhone~1" onkeyup="limitText('customerPhone~1', 3,'customerPhone~2')" />-<input type="text" class="formSplitTxt" id="customerPhone~2" onkeyup="limitText('customerPhone~2', 3,'customerPhone~3')" />-<input type="text" class="formSplitTxt" id="customerPhone~3" onkeyup="limitText('customerPhone~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="customerForm" property="phone"/>','customerPhone');
					</script>
					<html:hidden styleClass="formTxt" styleId="customerPhone" property="phone" /></TD>
					<TD>Mobile</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="customerMobile~1" onkeyup="limitText('customerMobile~1', 3,'customerMobile~2')" />-<input type="text" class="formSplitTxt" id="customerMobile~2" onkeyup="limitText('customerMobile~2', 3,'customerMobile~3')" />-<input type="text" class="formSplitTxt" id="customerMobile~3" onkeyup="limitText('customerMobile~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="customerForm" property="mobile"/>','customerMobile');
					</script>
					<html:hidden styleClass="formTxt" styleId="customerMobile" property="mobile" />
					</TD>	
				</TR>
				<TR>
					<TD>Work</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="customerWork~1" onkeyup="limitText('customerWork~1', 3,'customerWork~2')" />-<input type="text" class="formSplitTxt" id="customerWork~2" onkeyup="limitText('customerWork~2', 3,'customerWork~3')" />-<input type="text" class="formSplitTxt" id="customerWork~3" onkeyup="limitText('customerWork~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="customerForm" property="work"/>','customerWork');
					</script>
					<html:hidden styleClass="formTxt" styleId="customerWork" property="work" />
					</TD>
					<TD>E-Mail</TD>
					<TD><html:text styleClass="formTxt" styleId="customerEmail" property="email" /></TD>
				</TD>
				</TR>
				<TR>
					<logic:present name="loggeddist" scope="session">
						<TD>Distributor Name</TD>
						<TD><strong><bean:write name="loggeddist" property="firstname"/>&nbsp;<bean:write name="loggeddist" property="lastname"/></strong></TD>
						<html:hidden name="loggeddist" property="distributorid" />
					</logic:present>
				<logic:notPresent name="loggeddist" scope="session">
					<TD>Distributor Name</TD>
					<TD colspan=3 nowrap>
						<html:text styleClass="formTxt" styleId="distributorname" property="distributorname" />
						<html:hidden property="distributorid"/>						
						<img src="images/lookUp.gif" height="16" style="cursor:hand;" onclick="showApprovedDistributorsList('distributorname','distributorid')"/>
					</TD>			
					</logic:notPresent>	
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
					<TD width="35%"><html:text styleClass="formTxt" styleId="paymentAmount" property="amount"/></TD>
					<TD colspan=2></TD>
				</TR>
				<TR>
					<TD width="25%">Pay By</TD>
					<TD width="35%">
						<html:select styleClass="formSelect"  styleId="paymenttype" property="paymenttype" onchange="setPaymentType(this)">
							<html:optionsCollection property="paymentmethods" label="label" value="value"/>
						</html:select>
					</TD>
					<TD width="20%">Routing Number</TD>
					<TD width="30%"><html:text styleClass="formTxt" styleId="paymentRoutingNumber" property="routingnumber"/></TD>
				</TR>
				<TR>
					<TD>Account Number</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentAccountnumber" property="accountnumber"/></TD>
					<TD>Check Number</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentChequenumber" property="chequenumber"/></TD>
				</TR>
				<TR>
					<TD>Credit Card Number</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentCcnumber" property="ccnumber"/></TD>
					<TD>Holder Name</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentCcHolderName" property="holdername"/></TD>
				</TR>
				<TR>
					<TD>Expiry Date (mm/dd/yyyy)</TD>
					<TD colspan=3><html:text styleClass="formTxt" styleId="ccExpirydate" property="expirydate" readonly="false"  onchange="validateDateFormat(this)"/>
					<!-- 
					<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('ccExpirydate'),'mm/dd/yyyy',this)"/></TD>
					-->
					<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('ccExpirydate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
				</TR>
								<TR>
				<TD>Payment Date (mm/dd/yyyy)</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentdate" property="paymentdate" readonly="false" onchange="validateDateFormat(this)"/>
					<!-- 
					<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('paymentdate'),'mm/dd/yyyy',this)"/>
					-->
					<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('paymentdate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
					</TD>
				</TR>	
				<TR>
					<TD>Address</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentaddress" property="paymentaddress"/></TD>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentcity" property="paymentcity"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:hidden styleClass="formTxt" styleId="paymentstate" property="paymentstate"/>
					<input type="text" class="formTxt" id="displaypaymentstate" name="displaypaymentstate" disabled/>
					</TD>
					<TD>Zip Code</TD>
					<TD><html:text styleClass="formTxt" styleId="zipcode" property="zipcode" onchange="setState(this,'paymentstate','displaypaymentstate')"/></TD>
				</TR>
				<TR>
					<TD>CVV</TD>
					<TD><html:text styleClass="formTxt" styleId="cvv" property="cvv"/></TD>
					<logic:present name="accessrole">
						<logic:equal name="accessrole" property="confirmpayment" value="on">
							<TD>Payment Confirmed</TD>
							<TD><html:checkbox styleId="paymentconfirmed" property="paymentconfirmed" onclick="changeApproveStatus(this)"/></TD>
						</logic:equal>
					</logic:present>
					<logic:notPresent name="accessrole">
							<TD>&nbsp;</TD>
							<TD>&nbsp;</TD>
					</logic:notPresent>
					
				</TR>
				<TR>
					<TD>Amount Received</TD>
					<TD><html:text styleClass="formTxt" styleId="amountreceived" property="amountreceived"/></TD>
					<TD></TD>
					<TD></TD>
				</TR>				
			</TABLE>
			</DIV>
			<Div style="padding-bottom:5px;"></DIV>
				<Div style="border:1px solid #A5B2BD;padding-bottom:5px;width:90%;">
				<Table>
				<TR>
					<TD colspan=4 class="boldItalic">
					Document Details
					</TD>
				</TR>
				<TR>
					<TD colspan=4>&nbsp;
					</TD>
				</TR>
				<TR>
					<TD width="45%">Social Security Verification</TD>
					<TD width="5%" colspan=3><html:checkbox styleId="ssnproof" property="ssnproof"/></TD>
				</TR>
				<TR>
					<TD width="45%">Address Verification</TD>
					<TD width="10%" align="left"><html:checkbox styleId="addressproof" property="addressproof"/>
					</TD>
					<TD width="45%">Completed Application</TD>
					<TD width="10%"><html:checkbox styleId="completedapplication" property="completedapplication"/></TD>
				</TR>
				<TR>
					<TD>Terms & Conditions Acceptance</TD>
					<TD><html:checkbox styleId="tcacceptance" property="tcacceptance"/></TD>
					<TD>Signed Limited Power Of Attorney</TD>
					<TD><html:checkbox styleId="ltdpoasigned" property="ltdpoasigned"/></TD>
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
		<logic:equal name="customerForm" property="customerstatus" value="N">
			<logic:equal name="customerForm" property="paymentconfirmed" value="false">			
				<input type="button" name="approveCustomerBtn" id="approveCustomerBtn" value="Approve" onclick="approveCustomer()" class="largeButton" disabled>&nbsp;&nbsp;
			</logic:equal>	
			<logic:notEqual name="customerForm" property="paymentconfirmed" value="false">			
				<input type="button" name="approveCustomerBtn" id="approveCustomerBtn" value="Approve" onclick="approveCustomer()" class="largeButton">&nbsp;&nbsp;
			</logic:notEqual>
			<input type="button" name="rejectDistributorBtn" value="Reject" onclick="rejectCustomer()" class="largeButton">&nbsp;&nbsp;
		</logic:equal>
		<logic:equal name="customerForm" property="customerstatus" value="P">
			<input type="button" name="closeDistributorBtn" value="Close" onclick="closeCustomer()" class="largeButton">&nbsp;&nbsp;
		</logic:equal>		
			<input type="button" name="registerCustomer" value="Save Details" onclick="enrollCustomer()" class="largeButton">&nbsp;&nbsp;<input type="reset" name="cancel" value="Cancel" class="largeButton"></td>		
	</tr>
</table>
<!-- 
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="calScripts/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
 -->
</html:form>
<script>
<!--
function enrollCustomer()
{
	if(validateCustomerForm())
		document.customerForm.submit();
}
function approveCustomer()
{
		if(validateCustomerForm()) {
		prepareToProcess();
		clearValues(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv']);
		document.customerForm.acode.value="1008";
		document.customerForm.submit();
		}
}
function rejectCustomer()
{
	clearValues(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv']);
	document.customerForm.acode.value="1009";
	document.customerForm.submit();
}
function closeCustomer()
{
	document.customerForm.acode.value="1010";
	document.customerForm.submit();
}
function setSelectedDistributor(distributorName,distributorId)
	{
		var element = document.getElementById(targetDistributorName);
		if(element)
			element.value = distributorName;
		var element = document.getElementById(targetDistributorId);
		if(element)
			element.value = distributorId;		
		targetDistributorName = "";
		targetDistributorId = "";	
	}
var targetDistributorName;
	var targetDistributorId;
	var distributorsSelectionWindow;
	function showApprovedDistributorsList(distributorName,distributorId)
	{
		if(distributorsSelectionWindow)
		{
			distributorsSelectionWindow.close();
		}
		var url = "distributor.do?acode=1012";
		var searchDisplayName = document.getElementById("distributorname");
		if(searchDisplayName)
			searchDisplayName = searchDisplayName.value;
		if(searchDisplayName && searchDisplayName != "")
			url = url+"&searchName="+searchDisplayName;
		targetDistributorName = distributorName;
		targetDistributorId = distributorId;
		distributorsSelectionWindow = window.open(url,"","location=no,height=500,width=500");
	}
	function setSsn()
	{
		concatenateSSN('customerssn');
	}
	function setPhoneNumbers()
	{
		concatenatePhoneNumber('customerPhone');
		concatenatePhoneNumber('customerMobile');
		concatenatePhoneNumber('customerWork');
	}
	function validateCustomerForm() {
		var formObj = document.customerForm;
		setPhoneNumbers();
		setSsn();
		var isValidForm = true;
		var tempElement;
		var tempValue;
		var message = "";
		{
			tempValue = formObj.firstname.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n First name should not be left blank";
			}
			else if(!hasOnlyCharacters(tempValue))
			{
				isValidForm = false;
				message += "\n First name should contain only characters";
			}
			tempValue = formObj.lastname.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Last name should not be left blank";
			}
			else if(!hasOnlyCharacters(tempValue))
			{
				isValidForm = false;
				message += "\n Last name should contain only characters";
			}
			tempValue = formObj.ssn.value;
			alert(tempValue)
			if(!isValidSSN(tempValue))
			{
				isValidForm = false;
				message += "\n SSN is not valid, SSN should have 9 disgits either as  \n \t NNN-NN-NNNN format or NNNNNNNNN format";
			}
			tempValue = formObj.dob.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Date of Birth can not be left blank";
			}	
			tempValue = formObj.address1.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Address1 should not be left blank";
			}
			tempValue = formObj.city.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n City should not be left blank";
			}
			tempValue = formObj.zip.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Zip should not be left blank";
			}
			else if(!isNumber(tempValue) || isValueInAllowableLimit(tempValue,5,5) !=0)
			{
				isValidForm = false;
				message += "\n Zip should be in 5 digits only";
			}
			tempValue = formObj.country.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Country should not be left blank";
			}					
		}
		
		//if(formObj.paymentconfirmed.checked) 
		{
		
			tempValue = formObj.paymentdate.value;
		    if(isNull(tempValue))
			{
		   
				isValidForm = false;
				message += "\n Payment Date is mandatory";
			}
		}

		
		tempValue = document.getElementById('paymentAmount').value;
		if(isValidAmount(tempValue))
		{
			isValidForm = false;
			message += "\n Amount should be in numerics only, \n Amount should not contain more than 4 numbers after a decimal";
		}
		
		tempValue = document.getElementById('paymentAccountnumber').value;
		if(!isNumber(tempValue))
		{
			isValidForm = false;
			message += "\n Account number should be contain digits only";
		}
		tempValue = document.getElementById('paymenttype').value;
		if(tempValue == "CC")
		{
			tempValue = document.getElementById('paymentCcnumber').value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Credit card number should not be left blank";
			}
			else if((trim(tempValue).length !=16))
			{
				isValidForm = false;
				message += "\n Credit card number should contain 16 digits";
			}
			else if(!isNumber(tempValue))
			{
				isValidForm = false;
				message += "\n Credit card number should contain 16 digits";
			}			
			tempValue = document.getElementById('paymentCcHolderName').value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Card holder name should not be left blank";
			}
			tempValue = document.getElementById('ccExpirydate').value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Expiry date should not be left blank";
			}
		}
		if(!isValidForm)
			alert(message);
		return isValidForm;
	}
	function isValidSSN(ssn) {
		var matchArr = ssn.match(/^(\d{3})-?\d{2}-?\d{4}$/);
		var numDashes = ssn.split('-').length - 1;
		if (matchArr == null || numDashes == 1) {
			return false;
		}
		else if (parseInt(matchArr[1],10)==0) {
			return false;
		}
		else {
			return true;		
   		}
	}	
	function changeApproveStatus(paymentConfirmation)
	{
		paymentConfirmation = paymentConfirmation.checked;
		var approveBtn = document.getElementById('approveCustomerBtn');
		if(approveBtn)
			approveBtn.disabled = !paymentConfirmation;	
	}
	function setPaymentType(paymentOptions)
	{
		var selectedVal = paymentOptions.options[paymentOptions.selectedIndex].value;
		if(selectedVal == "CC")
		{
			changeFieldsStatus(['paymentChequenumber','paymentAccountnumber'],true);
			changeFieldsStatus(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv'],false);
			clearValues(['paymentChequenumber','paymentAccountnumber']);
		}
		else if(selectedVal == "C")
		{
			changeFieldsStatus(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv'],true);
			changeFieldsStatus(['paymentChequenumber','paymentAccountnumber'],false);
			clearValues(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv']);
		}
		else if(selectedVal == "MO")
		{
			changeFieldsStatus(['paymentChequenumber','paymentCcnumber','paymentAccountnumber','paymentCcHolderName','ccExpirydate','cvv'],true);
			clearValues(['paymentChequenumber','paymentCcnumber','paymentAccountnumber','paymentCcHolderName','ccExpirydate','cvv']);			
		}	
		//clearValues(['paymentChequenumber','paymentCcnumber','paymentAccountnumber','paymentCcHolderName','ccExpirydate','cvv']);					
	}
	function setInitialPaymentType()
	{
		var element = document.getElementById('paymenttype');
		setPaymentType(element);
	}
	
	setInitialPaymentType();
	setMandatoryFields(['customerFirstName','customerlastName','customerssn~1','customerssn~2','customerssn~3','customerdob','customerAddress1','customerCity','customerZip','paymentAmount','paymentdate']);
//-->
</script>