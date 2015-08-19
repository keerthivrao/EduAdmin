<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<div class="formSubhead">List of Customers</div><BR/>
	<form action="customer.do" method="post">
	<div style="border:1px solid #A5B2BD;width:79%;padding-bottom:4px;padding-top:5px">
		<div class="boldItalic" style="padding-bottom:4px;">Search Pending Customer Orders</div>
			
				<input type="hidden" name="acode" id="acode" value="1006">
				First Name : <input type="text" name="searchFirstName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
				Last Name : <input type="text" name="searchLastName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
<logic:notPresent name="loggeddist" scope="session">
				   Distributor : <input type="text" name="searchDistributorName" class="formTxt" value="">&nbsp;&nbsp;&nbsp;
</logic:notPresent>
				<Input type="submit" value="Search" class="smallButton">

	</div>
	
	<div style="height:5px"></div>
	</form>	
	<script>					 
		var customersListSize = 13; 
	</script>
	<html:form action="customer.do" method="post">
	<html:hidden property="customerId"/>
	<html:hidden property="acode"/>
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder" id="waitingCustomersTable">
				<THEAD>
				<TR>
					<TH class="tableHeader" nowrap>
						Customer Name
					</TH>
					<TH  class="tableHeader" nowrap>
						Distributor Name 
					</TH>
					<TH  class="tableHeader" nowrap>
						Ordered Date
					</TH>
					<TH class="tableHeader" nowrap>
						Amount
					</TH>
					<TH class="tableHeader">
						Payment Confirmation
					</TH>
					<TH  class="tableHeaderLast" >
						View Details
					</TH>
				</TR>	
				</THEAD>
				<TBODY>			
				<logic:present name="customersList"> 
					<bean:size id="customersListCount" name="customersList"/>
					<script>					 
						customersListSize = '<%=customersListCount%>';
					</script>
					<logic:iterate id="customer" name="customersList" type="com.creditusa.model.CustomerDTO">
						<TR>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="lastname">
									<bean:write name="customer" property="lastname"/>,
								</logic:notEmpty>
								<logic:notEmpty name="customer" property="firstname">
									<bean:write name="customer" property="firstname"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="firstname">
									--
								</logic:empty>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="distributorname">
									<bean:write name="customer" property="distributorname"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="distributorname">
									--
								</logic:empty>
							</TD>
							<TD  class="tableData">
								<logic:notEmpty name="customer" property="ordereddate">
									<bean:write name="customer" property="ordereddate"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="ordereddate">
									--
								</logic:empty>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="amount">
									<bean:write name="customer" property="amount"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="amount">
									--
								</logic:empty>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="paymentstatus">
									<bean:write name="customer" property="paymentstatus"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="paymentstatus">
									--
								</logic:empty>
							</TD>
							<TD class="tableDataLast" style="text-align:center">
								<input type="button" value="View Details" class="smallButton"  onclick="showCustomerDetails('<bean:write name="customer" property="customerid"/>')">
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="customersList"> 
					<TR>
						<TD class="tableDataLast" align="center" colspan="6">
							No Customer Found
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
	var customerDetailsWindow;
	/*
	function showCustomerDetails()
	{
		if(customerDetailsWindow)
			customerDetailsWindow.close();
		customerDetailsWindow =  window.open("customerDetails.html","","scrollbars=yes,width=600,height=600,resizable=no,location=no");
	}
	*/
	function showCustomerDetails(customerId)
	{
	
		document.customerForm.acode.value="1001";

		document.customerForm.customerId.value=customerId;
		document.customerForm.submit();
	}
	var reportWindow;
	function showCustomerReport()
	{
		if(reportWindow)
			reportWindow.close();
		//reportWindow =  window.open("../resources/Mike_Credit report.pdf","","width=600,height=600,resizable=no,location=no");	
		reportWindow =  window.open("reports.html","","scrollbars=yes,width=600,height=600,resizable=no,location=no");		
	}
	
	if(customersListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('waitingCustomersTable'),300);
	}
	else if(customersListSize > 10) 
	{
		var targettedScrollHeight = document.getElementById('waitingCustomersTable').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('waitingCustomersTable'),targettedScrollHeight);
	}	
	
</script>