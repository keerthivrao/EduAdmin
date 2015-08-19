<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<html:form action="role.do" method="post">
	<html:hidden property="acode"/>
	<html:hidden property="roleid"/>
	<div style="padding-left:15px">
	<div class="formSubhead">Role Details</div><BR/>
	<% boolean dontChange = false; %>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE >
				<TR>
					<TD width="25%">Role Name</TD>
					 <logic:equal name="roleForm" property="rolename" value="ADMIN">
					<TD  width="35%"><strong>ADMIN</strong>	<%  dontChange = true; %></TD>
					</logic:equal>
					 <logic:equal name="roleForm" property="rolename" value="DISTRIBUTOR">
					<TD  width="35%"><strong>DISTRIBUTOR<% dontChange = true; %></strong>	</TD>
					</logic:equal>
					<logic:notEqual name="roleForm" property="rolename" value="ADMIN">
					<logic:notEqual name="roleForm" property="rolename" value="DISTRIBUTOR">
					<TD  width="35%"><html:text styleClass="formTxt" property="rolename" styleId="rolename" /></TD>
					</logic:notEqual>
					</logic:notEqual>
				</TR>

				<!--TR>

					
					<TD>Start Date</TD>
					<TD><html:text styleClass="formTxt" property="startdate" disabled="true"/></TD>
					<TD>End Date</TD>
					<TD><html:text styleClass="formTxt" property="enddate" disabled="true"/></TD>
				</TR-->
				<TR>
					<TD colspan=4>&nbsp;</TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td valign="top">
		<div class="boldItalic">User Actions </div>
		<TABLE class="tableBorder">
		<TR>
			<TH width="10" class="tableHeader"> S.No</TH>
			<TH class="tableHeader">Action Name</TH>
			<TH class="tableHeaderLast">Available</TH>
		</TR>
		<TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">User and Role Management[Admin]</TD>
			<TD class="tableDataLast"><html:checkbox property="usermgmt" disabled="<%=dontChange%>"/></TD>
		</TR>
		<!--TR>
			<TD class="tableData">2</TD>
			<TD class="tableData">Add/Edit Users</TD>
			<TD class="tableDataLast"><html:checkbox property="editusers"/></TD>
		</TR>
		</TABLE>		
		</td>
<td valign="top">
		<div class="boldItalic">Role Actions</div>
		<TABLE class="tableBorder">
		<TR>
			<TH width="10" class="tableHeader"> S.No</TH>
			<TH class="tableHeader">Action Name</TH>
			<TH class="tableHeaderLast">Available</TH>
		</TR>
		<TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">Add/Edit Role</TD>
			<TD class="tableDataLast"><html:checkbox property="addRole"/></TD>
		</TR>
		<TR>
			<TD class="tableData">2</TD>
			<TD class="tableData">View Role</TD>
			<TD class="tableDataLast"><html:checkbox property="viewRole"/></TD>
		</TR-->
		</TABLE>		
		</td>

	</tr>
	<tr>
		<td>&nbsp;
		</td>
	</tr>
<tr>
		<td valign="top">
		<div class="boldItalic">Customer Actions</div>
		<TABLE class="tableBorder">
		<TR>
			<TH width="10" class="tableHeader"> S.No</TH>
			<TH class="tableHeader">Action Name</TH>
			<TH class="tableHeaderLast">Available</TH>
		</TR>
		<TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">Enroll Customer</TD>
			<TD class="tableDataLast"><html:checkbox property="enrollCustomer" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">2</TD>
			<TD class="tableData">Approve Customer</TD>
			<TD class="tableDataLast"><html:checkbox property="approveCustomer" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">3</TD>
			<TD class="tableData">Customer Status</TD>
			<TD class="tableDataLast"><html:checkbox property="customerStatus" disabled="<%=dontChange%>"/></TD>
		</TR>
		</TABLE>		
		</td>
<td valign="top">
		<div class="boldItalic">Distributor Actions</div>
		<TABLE class="tableBorder">
		<TR>
			<TH width="10" class="tableHeader"> S.No</TH>
			<TH class="tableHeader">Action Name</TH>
			<TH class="tableHeaderLast">Available</TH>
		</TR>
		<TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">Add/Edit Distributors</TD>
			<TD class="tableDataLast"><html:checkbox property="addDistributor" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">2</TD>
			<TD class="tableData">View Distributors</TD>
			<TD class="tableDataLast"><html:checkbox property="viewDistributor" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">3</TD>
			<TD class="tableData">Approve Distributor</TD>
			<TD class="tableDataLast"><html:checkbox property="approveDistributor" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">4</TD>
			<TD class="tableData">View My Hierarchy [Distributor]</TD>
			<TD class="tableDataLast"><html:checkbox property="viewmyhirearchy" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">5</TD>
			<TD class="tableData">View All Distributors Hierarchy [Admin View] </TD>
			<TD class="tableDataLast"><html:checkbox property="viewothershirearchy" disabled="<%=dontChange%>"/></TD>
		</TR>
		</TABLE>		
		</td>

	</tr>
	<tr>
		<td valign="top">
		<div class="boldItalic">Payment Actions</div>
		<TABLE class="tableBorder">
		<TR>
			<TH width="10" class="tableHeader"> S.No</TH>
			<TH class="tableHeader">Action Name</TH>
			<TH class="tableHeaderLast">Available</TH>
		</TR>
		<!--TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">Add Payment</TD>
			<TD class="tableDataLast"><html:checkbox property="addPayment" disabled="<%=dontChange%>"/></TD>
		</TR-->
		<TR>
			<TD class="tableData">1</TD>
			<TD class="tableData">Payments Received (to Credit USA)[Admin View]</TD>
			<TD class="tableDataLast"><html:checkbox property="paymentReceivedbyCU" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">2</TD>
			<TD class="tableData">Make/View Payment[Admin Action]</TD>
			<TD class="tableDataLast"><html:checkbox property="makepayment" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">3</TD>
			<TD class="tableData">View Payments (by Credit USA)[Admin View] </TD>
			<TD class="tableDataLast"><html:checkbox property="paymentsmade" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">4</TD>
			<TD class="tableData">My Payments - Payments Received From Credit USA[Distributor View]</TD>
			<TD class="tableDataLast"><html:checkbox property="paymentReceivedfrmCU" disabled="<%=dontChange%>"/></TD>
		</TR>
		<TR>
			<TD class="tableData">4</TD>
			<TD class="tableData">Confirm Payment[Distributor/Customer]</TD>
			<TD class="tableDataLast"><html:checkbox property="confirmpayment" disabled="<%=dontChange%>"/></TD>
		</TR>
		</TABLE>		
		</td>
<td valign="top">
			
		</td>

	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center">		<input type="button" name="registerCustomer" value="Save Details" class="largeButton" onclick="submitDetails()">&nbsp;&nbsp;
		<input type="button" name="registerCustomer" value="Close" class="largeButton" ></td>		
	</tr>
</table>


</div>
</html:form>
<script>
<!--
	function submitDetails()
	{
	var element = document.getElementById('rolename');
	
	if(element && !isNull(element.value))
		{
			document.roleForm.acode.value="createRole";
			document.roleForm.submit();
		}
	else
	{
		alert("Role name should not be left blank");
	}		
	}
setMandatoryFields(['rolename']);
//-->
</script>