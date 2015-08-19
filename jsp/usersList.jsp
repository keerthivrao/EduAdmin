<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<div class="formSubhead">List of Distributors </div><BR/>
	<form action="user.do" method="post">
	<div style="border:1px solid #A5B2BD;width:82%;padding-bottom:4px;padding-top:5px">
		<div class="boldItalic" style="padding-bottom:4px;">Search Users</div>
			
				<input type="hidden" name="acode" id="acode" value="searchUsers">
				First Name : <input type="text" name="searchFirstName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				Last Name : <input type="text" name="searchLastName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				   SSN : <input type="text" name="searchMiddleName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				   Role : 
				   <select class="formSelect" name="userRole" id="userRole">
				   <option value=''></option>
				   		<logic:present name="rolesList" scope="request">
				   			<logic:iterate id="role" name="rolesList" type="com.creditusa.model.GenericVO">
				   				<option value='<bean:write name="role" property="value"/>'><bean:write name="role" property="label"/></option>
				   			</logic:iterate>
				   		</logic:present>
				   </select>
				   			
				<Input type="submit" value="Search" class="smallButton">

	</div>
	<script>					 
		var usersListSize = 0; 
	</script>	
	<div style="height:5px"></div>
	</form>
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder" id="usersTable">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						User Name
					</TH>
					<TH class="tableHeader">
						Login ID
					</TH>
					<TH class="tableHeader">
						Role
					</TH>
					<!--TH  class="tableHeader">
						Joining Date
					</TH-->
					<TH  class="tableHeaderLast">
						View/Edit Details
					</TH>
				</TR>				
				</THEAD>
				<TBODY>
				<logic:present name="usersList"> 
					<bean:size id="usersListCount" name="usersList"/>
					<script>	 
						usersListSize = '<%=usersListCount%>';
					</script>
					<logic:iterate id="user" name="usersList" type="com.creditusa.model.UserDTO">
						<TR>
							<TD class="tableData">					
								<logic:empty name="user" property="firstname">
									-
								</logic:empty>
								<logic:notEmpty name="user" property="firstname">
									<bean:write name="user" property="firstname"/>
								</logic:notEmpty>
							</TD>
							<TD class="tableData">
								<logic:empty name="user" property="loginid">
									-
								</logic:empty>
								<logic:notEmpty name="user" property="loginid">
									<bean:write name="user" property="loginid"/>
								</logic:notEmpty>
								
							</TD>

							<TD class="tableData">
								<logic:empty name="user" property="role">
									-
								</logic:empty>
								<logic:notEmpty name="user" property="role">
									<bean:write name="user" property="role"/>
								</logic:notEmpty>
								
							</TD>
							<!--TD  class="tableData">
								<bean:write name="user" property="joiningdate"/>
							</TD-->
							<TD class="tableDataLast" style="text-align:center">
								<input type="button" value="View Details" class="smallButton"  onclick="navigateToSpecified('user.do','updateUser','<bean:write name="user" property="userid"/>')">
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="usersList"> 
					<TR>
						<TD class="tableDataLast" colspan="5">
							No Users Found
						</TD>
					</TR>
				</logic:notPresent>
				</TBODY>
				</TABLE>
		</td>
	</tr>
</table>
		<form name="leftPanelForm1" id="leftPanelForm" action="" method="post">
			<input type="hidden" name="acode" value="">
			<input type="hidden" name="userId" value="">
		</form>
		<script>
		<!--
			function navigateToSpecified(action,acode,userId)
			{
				document.leftPanelForm1.action = action;
				document.leftPanelForm1.acode.value=acode;
				document.leftPanelForm1.userId.value=userId;
				document.leftPanelForm1.submit();
			}
		//-->
		</script>
<script>
<!--
	var userDetailsWindow;
	function showUserDetails()
	{
		if(userDetailsWindow)
			userDetailsWindow.close();
		userDetailsWindow =  window.open("userDetails.html","","scrollbars=yes,width=600,height=600,resizable=no,location=no");
	}
	if(usersListSize !=0) {
	if(usersListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('usersTable'),300);
	}
	else if(usersListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('usersTable').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('usersTable'),targettedScrollHeight);
	}
	}
	//-->
</script>