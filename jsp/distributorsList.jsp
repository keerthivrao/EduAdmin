<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<div class="formSubhead">List of Distributors </div><BR/>
	<form action="distributor.do" method="post">
	<div style="border:1px solid #A5B2BD;width:75%;padding-bottom:4px;padding-top:5px">
		<div class="boldItalic" style="padding-bottom:4px;">Search Distributors</div>
			
				<input type="hidden" name="acode" id="acode" value="1006">
				First Name : <input type="text" name="searchFirstName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				Last Name : <input type="text" name="searchLastName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				<logic:notPresent name="loggeddist" scope="session">
				   Parent : <input type="text" name="searchParentName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				<Input type="submit" value="Search" class="smallButton">
				</logic:notPresent>

	</div>
	<script>					 
		var distributorsListSize = 0; 
	</script>
	<div style="height:5px"></div>
	</form>
	<html:form action="distributor.do" method="post">
	<html:hidden property="acode" value="1001"/>
	<html:hidden property="addressid"/>
	<html:hidden property="paymentId"/>
	<html:hidden property="primaryaddressid"/>
	<html:hidden property="distributorId"/>
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE width="90%" id="distributorsTable" class="tableBorder">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						Distributor Name
					</TH>
					<TH class="tableHeader">
						Approved Status
					</TH>
					<TH  class="tableHeader">
						Parent 
					</TH>
					<TH  class="tableHeader">
						Joining Date
					</TH>
					<TH  class="tableHeader">
						View/Edit Details
					</TH>
					<logic:present name="accessrole">
						<logic:equal name="accessrole" property="viewothershirearchy" value="on">
						<TH  class="tableHeaderLast">
							View Hierarchy
						</TH>
						</logic:equal>
					</logic:present>
				</TR>				
				</THEAD>
				<TBODY>
				<logic:present name="distributorsList"> 
					<bean:size id="distributorsListCount" name="distributorsList"/>
					<script>					 
						distributorsListSize = <%=distributorsListCount%>;
					</script> 
					<logic:iterate id="distributor" name="distributorsList" type="com.creditusa.model.DistributorDTO">
						<TR>
							<TD class="tableData">
								<logic:notEmpty name="distributor" property="lastname">
									<bean:write name="distributor" property="lastname"/>,
								</logic:notEmpty>
								<logic:notEmpty name="distributor" property="firstname">
									<bean:write name="distributor" property="firstname"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="firstname">
									--
								</logic:empty>	
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="distributor" property="approvalstatus">
									<bean:write name="distributor" property="approvalstatus"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="approvalstatus">
									--
								</logic:empty>
							</TD>
							<TD  class="tableData">
								<logic:notEmpty name="distributor" property="parentname">
									<bean:write name="distributor" property="parentname"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="parentname">
									--
								</logic:empty>					
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="distributor" property="joiningdate">
									<bean:write name="distributor" property="joiningdate"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="joiningdate">
									--
								</logic:empty>
							</TD>
							<TD class="tableData" style="text-align:center">
								<input type="button" value="View Details" class="smallButton"  onclick="showDistributorDetails('<bean:write name="distributor" property="distributorid"/>')">
							</TD>
							<logic:present name="accessrole">
							<logic:equal name="accessrole" property="viewothershirearchy" value="on">
							<TD class="tableDataLast" style="text-align:center">
								<input type="button" value="View Hierarchy" class="smallButton"  onclick="showDistributorHierarchy('<bean:write name="distributor" property="distributorid"/>')">
							</TD>
							</logic:equal>
							</logic:present>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="distributorsList"> 
					<TR>
						<TD class="tableDataLast" colspan="6">
							No Distributors Found
						</TD>
					</TR>
				</logic:notPresent>
				</TBODY>
				</TABLE>
		</td>
	</tr>
</table>
</html:form>
<script>
	function showDistributorDetails(distributorId)
	{
		
		document.distributorForm.acode.value="1001";
		document.distributorForm.distributorId.value=distributorId;
		document.distributorForm.submit();
	}
	function showDistributorHierarchy(distributorId)
	{
		document.distributorForm.acode.value="1011";
		document.distributorForm.distributorId.value=distributorId;
		document.distributorForm.submit();
	}
	

	if(distributorsListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('distributorsTable'),300);
	}
	else if(distributorsListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('distributorsTable').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('distributorsTable'),targettedScrollHeight);
	}
</script>