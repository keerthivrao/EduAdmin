<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>

	<html:form action="distributor.do" method="post">
	<html:hidden property="acode" value="1008"/>
	<html:hidden property="addressid"/>
	<html:hidden property="paymentId"/>
	<html:hidden property="primaryaddressid"/>
	<html:hidden property="distributorId"/>
	<html:hidden property="approvalStatus"/>
	<html:hidden property="preactivestatus"/>
	
	<div class="formSubhead">Distributor Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE width="90%">
				<TR>
					<TD>Distributor Type</TD>
					<TD>
						<html:select styleClass="formSelect" styleId="distributortype" property="distributortype"  onchange="showDetails(this.value)">
							<html:optionsCollection property="distributortypes" label="label" value="value"/>
						</html:select>
					</TD>
					<TD>Parent Distributor</TD>
					<logic:present name="loggeddist" scope="session">
						<TD><strong><bean:write name="loggeddist" property="firstname"/>&nbsp;<bean:write name="loggeddist" property="lastname"/></strong></TD>
						<bean:define id="distid" >
						    <bean:write name="loggeddist" property="distributorid" scope="session" />
						</bean:define>
						<html:hidden property="parentdistributor" value="<%=distid%>"/>	
					</logic:present>
				<logic:notPresent name="loggeddist" scope="session">
					
					<TD nowrap>
						<html:text styleClass="formTxt" styleId="parentdistributorname" property="parentdistributorname" />						
						<html:hidden property="parentdistributor"/>						
						<img src="images/lookUp.gif" height="16" style="cursor:hand;" onclick="showApprovedDistributorsList('parentdistributorname','parentdistributor')"/>
					</TD>
					</logic:notPresent>
				</TR>
				<TR>
					<TD colspan=4>
						<div id="individualDetails" width="100%">
							<TABLE width="100%">
								<TR>
									<TD width="25%">First Name</TD>
									<TD  width="35%"><html:text styleClass="formTxt" styleId="firstname" property="firstname" /></TD>
									<TD  width="20%">Middle Name</TD>
									<TD  width="30%"><html:text styleClass="formTxt" styleId="middlename" property="middlename" /></TD>
								</TR>
								<TR>
									<TD>Last Name</TD>
									<TD><html:text styleClass="formTxt" styleId="lastname" property="lastname" /></TD>
									<TD>SSN</TD>
									<TD>
									<input type="text" class="formSplitTxt" id="ssn~1" onkeyup="limitText('ssn~1', 3,'ssn~2')" />-<input type="text" class="formSplitTxt" id="ssn~2" onkeyup="limitText('ssn~2', 2,'ssn~3')" />-<input type="text" class="formSplitTxt" id="ssn~3" onkeyup="limitText('ssn~3', 4)" />
									<script>
									splitSSN('<bean:write name="distributorForm" property="ssn"/>','ssn');
									</script>
									<html:hidden styleClass="formTxt" styleId="ssn" property="ssn" /></TD>									
								</TR>
								<TR>
									<TD>DOB (mm/dd/yyyy)</TD>
									<TD><html:text styleClass="formTxt" styleId="dob" property="dob" readonly="false" onchange="validateDateFormat(this)"/>
									<!--
									<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('dob'),'mm/dd/yyyy',this)"/>
									-->
									<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('dob'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
									</TD>
									
									
									<TD>Active</TD>
									<TD><html:checkbox styleId="active" property="active" /></TD>									
									
								</TR>	
								<TR>
									<TD>Login Id</TD>
									<TD colspan=3 class="labelTxt">
										<logic:notEmpty name="distributorForm" property="loginid">
											<bean:write name="distributorForm" property="loginid"/>
										</logic:notEmpty>	
										<logic:empty name="distributorForm" property="loginid">
											--
										</logic:empty>	
									</TD>
								</TR>															
							</TABLE>
						</div>
					</TD>
				</TR>
				<TR>
					<TD colspan=4>
						<div id="companyDetails">
							<TABLE width="100%">
								<TR>
									<TD width="25%">Company Name</TD>
									<TD  width="35%"><html:text styleClass="formTxt" styleId="companyname" property="companyname" /></TD>
									<TD  width="20%">Company ID</TD>
									<TD  width="30%"><html:text styleClass="formTxt" styleId="companyid" property="companyid" /></TD>
								</TR>
							</TABLE>
						</div>
					</TD>
				</TR>

				<TR>
					
					<TD colspan=4>
						<div id="companyPrimaryContactDetails">
							<table width="100%">
										<TR>

					<TD colspan=4>&nbsp;
					</TD>
				</TR>
							<TR>
					<TD colspan=4 class="boldItalic">Primary Contact Details</TD>
				</TR>
				<TR>
					<TD width="25%">Contact Person Name</TD>
					<TD width="35%"><html:text styleClass="formTxt" styleId="primarycontactperson" property="primarycontactperson" /></TD>
					<TD colspan=2>&nbsp;</TD>
				</TR>
				<TR>
					<TD width="25%">Address 1</TD>
					<TD width="35%"><html:text styleClass="formTxt" styleId="primaryaddress1" property="primaryaddress1" /></TD>
					<TD width="20%">Address 2</TD>
					<TD width="30%"><html:text styleClass="formTxt" styleId="primaryaddress2" property="primaryaddress2" /></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" styleId="primarycity" property="primarycity" /></TD>	
					<TD>Zip</TD>
					<TD><html:text styleClass="formTxt" styleId="primaryzip" property="primaryzip" onchange="setState(this,'primarystate','primarydisplaystate')"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:hidden styleId="primarystate" property="primarystate" />
					<input type="text" class="formTxt" id="primarydisplaystate" name="primarydisplaystate" disabled/>
					</TD>
					<TD>Country</TD>
					<TD><html:text styleClass="formTxt" styleId="primarycountry" property="primarycountry" /></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="primaryphone~1" onkeyup="limitText('primaryphone~1', 3,'primaryphone~2')" />-<input type="text" class="formSplitTxt" id="primaryphone~2" onkeyup="limitText('primaryphone~2', 3,'primaryphone~3')" />-<input type="text" class="formSplitTxt" id="primaryphone~3" onkeyup="limitText('primaryphone~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="primaryphone"/>','primaryphone');
					</script>
					<html:hidden styleClass="formTxt" styleId="primaryphone" property="primaryphone" /></TD>
					<TD>Mobile</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="primarymobile~1" onkeyup="limitText('primarymobile~1', 3,'primarymobile~2')" />-<input type="text" class="formSplitTxt" id="primarymobile~2" onkeyup="limitText('primarymobile~2', 3,'primarymobile~3')" />-<input type="text" class="formSplitTxt" id="primarymobile~3" onkeyup="limitText('primarymobile~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="primarymobile"/>','primaryphone');
					</script>
					<html:hidden styleClass="formTxt" styleId="primarymobile" property="primarymobile" />
					</TD>
				</TR>
				<TR>
					<TD>Work</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="primarywork~1" onkeyup="limitText('primarywork~1', 3,'primarywork~2')" />-<input type="text" class="formSplitTxt" id="primarywork~2" onkeyup="limitText('primarywork~2', 3,'primarywork~3')" />-<input type="text" class="formSplitTxt" id="primarywork~3" onkeyup="limitText('primarywork~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="primarywork"/>','primarywork');
					</script>
					<html:hidden styleClass="formTxt" styleId="primarywork" property="primarywork" />
					</TD>					
					<TD>E-Mail</TD>
					<TD><html:text styleClass="formTxt" styleId="primaryemail" property="primaryemail" /></TD>
				</TR>	
							</table>
						</div>
					</TD>
				</TR>



				<TR>
					<TD colspan=4>&nbsp;
					</TD>
				</TR>
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>

				<TR>
					<TD width="25%">Address 1</TD>
					<TD width="35%"><html:text styleClass="formTxt" styleId="address1" property="address1" /></TD>
					<TD width="20%">Address 2</TD>
					<TD width="30%"><html:text styleClass="formTxt" styleId="address2" property="address2" /></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" styleId="city" property="city" /></TD>	
					<TD>Zip</TD>
					<TD><html:text styleClass="formTxt" styleId="zip" property="zip" onchange="setState(this,'state','displaystate')"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:hidden styleId="state" property="state" />
					<input type="text" class="formTxt" id="displaystate" name="displaystate" disabled/></TD>
					<TD>Country</TD>
					<TD><html:text styleClass="formTxt" styleId="country" property="country" /></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="phone~1" onkeyup="limitText('phone~1', 3,'phone~2')" />-<input type="text" class="formSplitTxt" id="phone~2" onkeyup="limitText('phone~2', 3,'phone~3')" />-<input type="text" class="formSplitTxt" id="phone~3" onkeyup="limitText('phone~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="phone"/>','phone');
					</script>
					<html:hidden styleClass="formTxt" styleId="phone" property="phone" />
					</TD>					
					<TD>Mobile</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="mobile~1" onkeyup="limitText('mobile~1', 3,'mobile~2')" />-<input type="text" class="formSplitTxt" id="mobile~2" onkeyup="limitText('mobile~2', 3,'mobile~3')" />-<input type="text" class="formSplitTxt" id="mobile~3" onkeyup="limitText('mobile~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="mobile"/>','mobile');
					</script>
					<html:hidden styleClass="formTxt" styleId="mobile" property="mobile" />
					</TD>					
				</TR>
				<TR>
					<TD>Work</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="work~1" onkeyup="limitText('work~1', 3,'work~2')" />-<input type="text" class="formSplitTxt" id="work~2" onkeyup="limitText('work~2', 3,'work~3')" />-<input type="text" class="formSplitTxt" id="work~3" onkeyup="limitText('work~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="distributorForm" property="work"/>','work');
					</script>
					<html:hidden styleClass="formTxt" styleId="work" property="work" />
					</TD>					
					<TD>E-Mail</TD>
					<TD><html:text styleClass="formTxt" styleId="email" property="email" /></TD>
				</TR>
				</Table>
				<Div style="padding-bottom:5px;"></DIV>
				<Div style="border:1px solid #A5B2BD;padding-bottom:5px;width:90%;">
				<Table width="100%">
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
					<TD colspan=3><html:text styleClass="formTxt" styleId="ccExpirydate" property="expirydate" readonly="false" onchange="validateDateFormat(this)"/>
					<!--
					<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('ccExpirydate'),'mm/dd/yyyy',this)"/> 
					-->
					<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('ccExpirydate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
					</TD>
					
				
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
				</TR>
				
				
				</DIV>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">
		<logic:equal name="distributorForm" property="approvalStatus" value="New">
				<logic:equal name="distributorForm" property="paymentconfirmed" value="false">
					<input type="button" name="approveDistributorBtn" id="approveDistributorBtn" value="Approve" onclick="approveDistributor()" class="largeButton" disabled>&nbsp;&nbsp;				
				</logic:equal>
				<logic:notEqual name="distributorForm" property="paymentconfirmed" value="false">
					<input type="button" name="approveDistributorBtn" id="approveDistributorBtn" value="Approve" onclick="approveDistributor()" class="largeButton">&nbsp;&nbsp;
				</logic:notEqual>			
			<input type="button" name="rejectDistributorBtn" value="Reject" onclick="rejectDistributor()" class="largeButton">&nbsp;&nbsp;
		</logic:equal>
		<logic:present name="accessrole">
			<logic:equal name="accessrole" property="addDistributor" value="on">
			<input type="button" name="saveDistributorDetails" value="Save Details" onclick="registerDistributor()" class="largeButton">&nbsp;&nbsp;<input type="reset" name="cancel" value="Cancel" class="largeButton">
			</logic:equal>
		</logic:present>
		
		</td>		
	</tr>
</table>
<!-- 
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="calScripts/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
 -->
</html:form>
<script>
	<!--
	function registerDistributor()
	{
		setPhoneNumbers();
		setSsn();
		if(validateDistributorForm())
			document.distributorForm.submit();
	}
	function approveDistributor()
		{
		setPhoneNumbers();
		setSsn();
		if(validateDistributorForm()) {
		prepareToProcess();
		clearValues(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv']);
		document.distributorForm.acode.value="1009";
		document.distributorForm.submit();
		}

	}
	function rejectDistributor()
	{
		clearValues(['paymentCcnumber','paymentCcHolderName','ccExpirydate','cvv']);
		document.distributorForm.acode.value="1010";
		document.distributorForm.submit();
	}	
	function showDetails(selectedValue)
	{
		if(selectedValue == "I")
		{
			
			document.getElementById("individualDetails").style.display="block";
			document.getElementById("companyDetails").style.display="none";
			document.getElementById("companyPrimaryContactDetails").style.display="none";
		}
		else
		{
			document.getElementById("individualDetails").style.display="none";
			document.getElementById("companyDetails").style.display="block";
			
			document.getElementById("companyPrimaryContactDetails").style.display="block";
		}
	}
	var selectedDistributorType='<bean:write name="distributorForm" property="distributortype"/>';
	if(selectedDistributorType == "")
		selectedDistributorType = "I";
	showDetails(selectedDistributorType);
	
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
		
		var searchDisplayName = document.getElementById("parentdistributorname");
		
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
		concatenateSSN('ssn');
	}
	function setPhoneNumbers()
	{
		concatenatePhoneNumber('primaryphone');
		concatenatePhoneNumber('primarymobile');
		concatenatePhoneNumber('primarywork');
		concatenatePhoneNumber('phone');
		concatenatePhoneNumber('mobile');
		concatenatePhoneNumber('work');		
	}
	function validateDistributorForm() {
		
		var formObj = document.distributorForm;
		
		var distributorType = formObj.distributortype.value;
		var isValidForm = true;
		var tempElement;
		var tempValue;
		var message = "";
		tempElement = formObj.parentdistributor;
		if(tempElement)
			tempValue = tempElement.value;
		if(tempValue == "")
		{
			isValidForm = false;
			message += "\n Parent distributor should be selected";
		}		
		if(distributorType == "I")
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
		else
		{
			tempValue = formObj.companyname.value;
			
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
			
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Company name should not be left blank";
			}
			tempValue = formObj.companyid.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Company id should not be left blank";
			}
			tempValue = formObj.primarycontactperson.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Primary contact person should not be left blank";
			}
			tempValue = formObj.primaryaddress1.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Primary Address1 should not be left blank";
			}	
			tempValue = formObj.primarycity.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Primary City should not be left blank";
			}
			tempValue = formObj.primaryzip.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Primary Zip should not be left blank";
			}
			tempValue = formObj.primarycountry.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Primary Country should not be left blank";
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
		
		if(formObj.paymentconfirmed && formObj.paymentconfirmed.checked) 
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
			else if(!(trim(tempValue).length !=16))
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
		var approveBtn = document.getElementById('approveDistributorBtn');
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
	
	setMandatoryFields(['parentdistributorname','firstname','lastname','ssn~1','ssn~2','ssn~3','dob','primaryaddress1','primarycity','primaryzip','primarycountry','address1','city','zip','country','paymentAmount','paymentdate']);
	//-->
</script>