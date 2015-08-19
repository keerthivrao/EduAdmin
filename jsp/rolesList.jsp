<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<form action="role.do" method="post">
<input type="hidden" name="acode" id="acode" value="getRole">
	<div class="formSubhead">List of Roles </div><BR/>
	
	<div style="border:1px solid #A5B2BD;padding-top:10px;padding-bottom:5px;">
		<div class="boldItalic">Search Role</div>
		<div style="padding-left:5px">
			Name : <input type="text" name="roleName"  class="formTxt" >
		</div>	
		<div style="padding-left:50px;padding-top:5px;">
			<Input type="submit" value="Search" class="smallButton">
		</div>	
	</div>
</form>	
	<div style="padding-top:10px"></div>

		<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder">
				<TR>
					<TH class="tableHeader">
						Role Name
					</TH>
					<!--TH  class="tableHeader">
						Start Date
					</TH>
					<TH  class="tableHeader">
						End Date
					</TH-->
					<TH  class="tableHeaderLast">
						View/Edit Details
					</TH>
				</TR>				
				
				<logic:present name="rolesList"> 
					<logic:iterate id="role" name="rolesList" type="com.creditusa.model.RoleDTO">
						<TR>
							<TD class="tableData">
					
								<logic:empty name="role" property="rolename">
									-
								</logic:empty>
								<logic:notEmpty name="role" property="rolename">
									<bean:write name="role" property="rolename"/>
								</logic:notEmpty>
								
								
							</TD>
							<!--TD class="tableData">
								<logic:empty name="role" property="startdate">
									-
								</logic:empty>
								<logic:notEmpty name="role" property="startdate">
									<bean:write name="role" property="startdate"/>
								</logic:notEmpty>
								
							</TD>
							<TD class="tableData">
								<logic:empty name="role" property="enddate">
									-
								</logic:empty>
								<logic:notEmpty name="role" property="enddate">
									<bean:write name="role" property="enddate"/>
								</logic:notEmpty>
								
							</TD-->
							<TD class="tableDataLast" style="text-align:center">
								<input type="button" value="View Details" class="smallButton"  onclick="navigateToSpecified('role.do','updateRole','<bean:write name="role" property="roleid"/>')">
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="rolesList"> 
					<TR>
						<TD class="tableDataLast" colspan="5">
							No Roles Found
						</TD>
					</TR>
				</logic:notPresent>

				</TABLE>
		</td>
	</tr>
</table>
		<form name="leftPanelForm1" id="leftPanelForm" action="" method="post">
			<input type="hidden" name="acode" value="">
			<input type="hidden" name="roleId" value="">
		</form>
		<script>
		<!--
			function navigateToSpecified(action,acode,roleId)
			{
				document.leftPanelForm1.action = action;
				document.leftPanelForm1.acode.value=acode;
				document.leftPanelForm1.roleId.value=roleId;
				document.leftPanelForm1.submit();
			}
		//-->
		</script>

	
	
<script>
	var roleDetailsWindow;
	function showUserDetails()
	{
		if(roleDetailsWindow)
			roleDetailsWindow.close();
		roleDetailsWindow =  window.open("roleDetails.html","","scrollbars=yes,width=600,height=600,resizable=no,location=no");
	}
</script>