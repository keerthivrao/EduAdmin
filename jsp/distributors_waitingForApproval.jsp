
	
	<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
	<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
	<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
	<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<div class="formSubhead">List of Distributors </div><BR/>
	<form action="distributor.do" method="post">
	<div style="border:1px solid #A5B2BD;width:75%;padding-bottom:4px;padding-top:5px">
		<div class="boldItalic" style="padding-bottom:4px;">Search Pending Distributors</div>
			
				<input type="hidden" name="acode" id="acode" value="1007">
				First Name : <input type="text" name="searchFirstName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				Last Name : <input type="text" name="searchLastName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
			<logic:notPresent name="loggeddist" scope="session">
				   Parent : <input type="text" name="searchParentName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
			</logic:notPresent> 	   
				<Input type="submit" value="Search" class="smallButton">
				

	</div>
	
	<div style="height:5px"></div>
	</form>
	<script>					 
		var distributorsWaitingListSize = 13; 
	</script>
	<html:form action="distributor.do" method="post">
	<html:hidden property="acode" value="1001"/>
	<html:hidden property="addressid"/>
	<html:hidden property="paymentId"/>
	<html:hidden property="primaryaddressid"/>
	<html:hidden property="distributorId"/>
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder" id="distributorsWaitingList">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						Distributor Name
					</TH>
					<TH  class="tableHeader">
						Parent 
					</TH>
					<TH  class="tableHeader">
						Registered Date
					</TH>
					<TH  class="tableHeader">
						Amount
					</TH>
					<TH  class="tableHeaderLast">
						Payment Confirmation
					</TH>
					<TH  class="tableHeaderLast">
						View & Approve
					</TH>

				</TR>
				</THEAD>
				<TBODY>
				<logic:present name="distributorsList">
					<bean:size id="distributorsWaitingListCount" name="distributorsList"/>
					<script>					 
						distributorsWaitingListSize = '<%=distributorsWaitingListCount%>';
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
								<logic:notEmpty name="distributor" property="parentname">
									<bean:write name="distributor" property="parentname"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="parentname">
									--
								</logic:empty>							
							</TD>
							<TD  class="tableData">
								<logic:notEmpty name="distributor" property="registereddate">
									<bean:write name="distributor" property="registereddate"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="registereddate">
									--
								</logic:empty>							
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="distributor" property="amount">
									<bean:write name="distributor" property="amount"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="amount">
									--
								</logic:empty>							
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="distributor" property="paymentstatus">
									<bean:write name="distributor" property="paymentstatus"/>
								</logic:notEmpty>	
								<logic:empty name="distributor" property="paymentstatus">
									--
								</logic:empty>								
							</TD>
							<TD class="tableDataLast" style="text-align:center">
								<input type="button" value="View Details" class="smallButton"  onclick="showDistributorDetails('<bean:write name="distributor" property="distributorid"/>')">
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="distributorsList"> 
					<TR>
						<TD class="tableDataLast" colspan="6" align="center">
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
	function submitForm()
	{
		document.customerRegistration.submit();
	}
	var distributorDetailsWindow;
	/*
	function showDistributorDetails()
	{
		if(distributorDetailsWindow)
			distributorDetailsWindow.close();
		distributorDetailsWindow =  window.open("distributorDetails.html","","scrollbars=yes,width=600,height=600,resizable=no,location=no");
	}
	*/
	function showDistributorDetails(distributorId)
	{
		document.distributorForm.acode.value="1001";
		document.distributorForm.distributorId.value=distributorId;
		document.distributorForm.submit();
	}

	if(distributorsWaitingListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('distributorsWaitingList'),300);
	}
	else if(distributorsWaitingListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('distributorsWaitingList').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('distributorsWaitingList'),targettedScrollHeight);
	}	
	
</script>