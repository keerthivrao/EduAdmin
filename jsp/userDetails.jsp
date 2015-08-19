<%@ include file="taglibs.jsp"%>
<html:form action="user.do" method="post">
	
	<html:hidden property="acode"/>
	<html:hidden property="userid"/>
	<html:hidden property="addressid"/>
	<html:hidden property="distributorid"/>
	<html:hidden property="loginid"/>
	<html:hidden property="self"/>	
	<html:hidden property="pwd"/>
	<div class="formSubhead">User Details<logic:notEqual name="userForm" property="userid" value=""> - <bean:write name="userForm" property="loginid"/></logic:notEqual></div><BR/>
	<%
		boolean notself = true;
		if(request.getAttribute("self") != null) {
		 notself = false;
		}		
	%>

	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>

			<TABLE >
				

				<TR>
					<TD width="25%">First Name</TD>
					<TD  width="35%"><html:text styleClass="formTxt" property="firstname" styleId="firstname"/></TD>
					<TD  width="20%">Middle Name</TD>
					<TD  width="30%"><html:text styleClass="formTxt" property="middlename"/></TD>
				</TR>
				<TR>
					<TD>Last Name</TD>
					<TD><html:text styleClass="formTxt" property="lastname" styleId="lastname"/></TD>
					<TD>SSN</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="ssn~1" onkeyup="limitText('ssn~1', 3,'ssn~2')" />-<input type="text" class="formSplitTxt" id="ssn~2" onkeyup="limitText('ssn~2', 2,'ssn~3')" />-<input type="text" class="formSplitTxt" id="ssn~3" onkeyup="limitText('ssn~3', 4)" />
					<script>
					splitSSN('<bean:write name="userForm" property="ssn"/>','ssn');
					</script>
					<html:hidden styleClass="formTxt" styleId="ssn" property="ssn" /></TD>		
				</TR>
				<TR>
					<TD>Date Of Birth (mm/dd/yyyy)</TD>
					<TD><html:text styleClass="formTxt" styleId="dateofbirth" property="dateofbirth" readonly="false"  onchange="validateDateFormat(this)"/>
					<!-- 
					<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('dateofbirth'),'mm/dd/yyyy',this)"/>
					-->
					<a href="javascript:void(0)" onclick="if(window.gfPop)gfPop.fPopCalendar(document.getElementById('dateofbirth'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
					</TD>					
					<TD></TD>
					<TD></TD>
				</TR>
				<logic:notEqual name="userForm" property="userid" value="">
				<TR>
					<TD>Login Password</TD>
					<TD><html:password styleClass="formTxt" property="cpwd" value="-99999"/></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<TR>
					<TD>Confirm Password</TD>
					<TD><input class="formTxt" type="password" name="confirmpwd" id="confirmpwd" value="-99999"/></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				</logic:notEqual>
				<TR>
					<TD colspan=4>&nbsp;</TD>
				</TR>				
				<TR>
					<TD colspan=4 class="boldItalic">Mailing Address</TD>
				</TR>
				<TR>
					<TD>Address 1</TD>
					<TD><html:text styleClass="formTxt" property="address1" styleId="address1"/><div>
					<TD>Address 2</TD>
					<TD><html:text styleClass="formTxt" property="address2"/></TD>
				</TR>
				<TR>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" property="city" styleId="city"/></TD>	
					<TD>Zip</TD>
					<TD><html:text styleClass="formTxt" property="zip"  styleId="zip" onchange="setState(this,'state','displaypaymentstate')"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:hidden styleClass="formTxt" property="state" styleId="state"/><input type="text" class="formTxt" id="displaypaymentstate" name="displaypaymentstate" disabled/></TD>
					<TD>Country</TD>
					<TD><html:text styleClass="formTxt" property="country"  styleId="country"/></TD>
				</TR>
				<TR>
					<TD>Phone</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="phone~1" onkeyup="limitText('phone~1', 3,'phone~2')" />-<input type="text" class="formSplitTxt" id="phone~2" onkeyup="limitText('phone~2', 3,'phone~3')" />-<input type="text" class="formSplitTxt" id="phone~3" onkeyup="limitText('phone~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="userForm" property="phone"/>','phone');
					</script>
					<html:hidden styleClass="formTxt" styleId="phone" property="phone" />
					</TD>					
					<TD>Mobile</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="mobile~1" onkeyup="limitText('mobile~1', 3,'mobile~2')" />-<input type="text" class="formSplitTxt" id="mobile~2" onkeyup="limitText('mobile~2', 3,'mobile~3')" />-<input type="text" class="formSplitTxt" id="mobile~3" onkeyup="limitText('mobile~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="userForm" property="mobile"/>','mobile');
					</script>
					<html:hidden styleClass="formTxt" styleId="mobile" property="mobile" />
					</TD>					
				</TR>
				<TR>
					<TD>Work</TD>
					<TD>
					<input type="text" class="formSplitTxt" id="work~1" onkeyup="limitText('work~1', 3,'work~2')" />-<input type="text" class="formSplitTxt" id="work~2" onkeyup="limitText('work~2', 3,'work~3')" />-<input type="text" class="formSplitTxt" id="work~3" onkeyup="limitText('work~3', 4)" />
					<script>
					splitPhoneNumber('<bean:write name="userForm" property="work"/>','work');
					</script>
					<html:hidden styleClass="formTxt" styleId="work" property="work" />
					</TD>					
					<TD>E-Mail</TD>
					<TD><html:text styleClass="formTxt" property="email"/></TD>
				</TR>
				<%if(notself) {%>	
				<TR>
					<TD>Role</TD>
					<TD>
						
						<html:select styleClass="formSelect" property="roleid" styleId="roleid">
							<html:optionsCollection property="roles" label="label" value="value"/>
						</html:select>
						
					</TD>
					<TD></TD>
					<TD></TD>
				</TR>
				
				<TR>
					<TD>Active</TD>
					<TD><html:checkbox property="active1"/></TD>
					<TD></TD>
					<TD></TD>
				</TR>
				<%} else {%>
						<html:hidden property="roleid"/>
						<html:hidden property="active1"/>	
				<%}%>
				<!--TR>
					<TD>Start Date</TD>
					<TD><html:text styleClass="formTxt" property="startdate" disabled="true"/></TD>
					<TD>End Date</TD>
					<TD><html:text styleClass="formTxt" property="enddate" disabled="true"/></TD>
				</TR-->
			</TABLE>			
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">	
		<input type="button" name="registerCustomer" value="Save Details" class="largeButton" onclick="submitDetails()">&nbsp;&nbsp;
		<input type="button" name="registerCustomer" value="Close" class="largeButton" onclick="self.close()"></td>		
	</tr>
</table>
</html:form>
<script>
<!--
	function submitDetails()
	{
		
		document.userForm.acode.value="createUser";
		if(validateUserForm())
			document.userForm.submit();		
	}
	function validateUserForm() {
		
		var formObj = document.userForm;
		setSsn();
		setPhoneNumbers();
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
			tempValue = formObj.lastname.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Last name should not be left blank";
			}
			
			tempValue = formObj.ssn.value;
			if(!isValidSSN(tempValue))
			{
				isValidForm = false;
				message += "\n SSN is not valid, SSN should have 9 disgits either as  \n \t NNN-NN-NNNN format or NNNNNNNNN format";
			}
			tempValue = formObj.dateofbirth.value;
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
			tempValue = formObj.country.value;
			if(isNull(tempValue))
			{
				isValidForm = false;
				message += "\n Country should not be left blank";
			}					
		}

		 var tvar = document.getElementById('roleid');
		if(tvar) {
		tempValue = tvar.value;
		if(isNull(tempValue))
		{
			isValidForm = false;
			message += "\n Role should be selected";
		}
		}
		if(!isValidForm)
			alert(message);
		return isValidForm;
	}
	function setSsn()
	{
		concatenateSSN('ssn');
	}
	function setPhoneNumbers()
	{
		concatenatePhoneNumber('phone');
		concatenatePhoneNumber('mobile');
		concatenatePhoneNumber('work');
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
	setMandatoryFields(['firstname','lastname','ssn~1','ssn~2','ssn~3','dateofbirth','address1','city','zip','country']);
//-->
</script>