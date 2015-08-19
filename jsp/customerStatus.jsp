<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<div class="formSubhead">List of Customers</div><BR/>
	<form name="customerSearchForm" action="customer.do" method="post">
	<div style="border:1px solid #A5B2BD;width:95%;padding-bottom:4px;padding-top:5px">
		<div class="boldItalic" style="padding-bottom:4px;">Search Customer Order Status</div>
				<input type="hidden" name="selectedCustomersForReports" value="">
				<input type="hidden" name="selectedCustomerId" value="">
				<input type="hidden" name="selectedCustomerSsn" value="">
				<input type="hidden" name="acode" id="acode" value="1005">
				First Name : <input type="text" name="searchFirstName" class="formTxt" value="">&nbsp;&nbsp;
				Last Name : <input type="text" name="searchLastName" class="formTxt" value="">&nbsp;&nbsp;
				<logic:notPresent name="loggeddist" scope="session">
				   Distributor : <input type="text" name="searchDistributorName" class="formTxt" value="">&nbsp;&nbsp;
				 </logic:notPresent>  
				   Status : <select class="formSelect" name="searchCustomerStatus" id="searchcustomerstatus">
				   		<logic:present name="statusList" scope="request">
				   			<logic:iterate id="status" name="statusList" type="com.creditusa.model.GenericVO">
				   				<option value='<bean:write name="status" property="value"/>'><bean:write name="status" property="label"/></option>
				   			</logic:iterate>
				   		</logic:present>
				   </select>&nbsp;&nbsp;
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
	<table width="89%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder" id="customersStatusTable">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						Customer Name
					</TH>
					<TH  class="tableHeader">
						Distributor Name 
					</TH>
					<TH  class="tableHeader">
						Ordered Date
					</TH>
					<TH  class="tableHeader">
						Status of Order
					</TH>
					<TH  class="tableHeader">
						Customer Status
					</TH>					
					<TH  class="tableHeader" nowarap>
						 <input type="checkbox" name="getAllReports" id= "getAllReports" onclick="checkAllGetReports(this.checked)">Reoprt
					</TH>
					<TH  class="tableHeader">
						Docs
					</TH>					
					<TH  class="tableHeader">
						View Report
					</TH>
					<logic:present name="accessrole">
					<logic:equal name="accessrole" property="usermgmt" value="on">
					<TH  class="tableHeader">
						View Accounts
					</TH>
					</logic:equal>
					</logic:present>
					<TH  class="tableHeaderLast">
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
								<logic:notEmpty name="customer" property="orderstatus">
									<bean:write name="customer" property="orderstatus"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="orderstatus">
									--
								</logic:empty>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="status">
									<logic:equal name="customer" property="status" value="P">
										Paid
									</logic:equal>	
									<logic:equal name="customer" property="status" value="R">
										Declined
									</logic:equal>
									<logic:equal name="customer" property="status" value="C">
										Closed
									</logic:equal>
									<logic:equal name="customer" property="status" value="N">
										New
									</logic:equal>					
								</logic:notEmpty>	
								<logic:empty name="customer" property="status">
									--
								</logic:empty>
							</TD>							
							<TD class="tableData" style="text-align:center">
								<logic:notEmpty name="customer" property="customerid">
									<input type="checkbox" name="getReport" id="getReport" value='<bean:write name="customer" property="customerid"/>'>
								</logic:notEmpty>	
								<logic:empty name="customer" property="customerid">
									<input type="checkbox" name="getReport" id="getReport" disabled>
								</logic:empty>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="customer" property="availableDocuments">
									<bean:write name="customer" property="availableDocuments"/> / <bean:write name="customer" property="totalDocuments"/>
								</logic:notEmpty>	
								<logic:empty name="customer" property="availableDocuments">
									--
								</logic:empty>
							</TD>							
							<TD class="tableData">
								<input type="button" value="View Report" class="smallButton"  onclick="showCustomerReport('<bean:write name="customer" property="ssn"/>')">
							</TD>
							<logic:present name="accessrole">
							<logic:equal name="accessrole" property="usermgmt" value="on">
							
							<TD class="tableData">
								<input type="button" value="View Accounts" class="smallButton"  onclick="showCustomerAccounts('<bean:write name="customer" property="customerid"/>','<bean:write name="customer" property="ssn"/>')">
							</TD>
							</logic:equal>
							</logic:present>
							<TD class="tableDataLast">
								<input type="button" value="View Details" class="smallButton"  onclick="showCustomerDetails('<bean:write name="customer" property="customerid"/>')">
							</TD>
						</TR>
					</logic:iterate>
				</logic:present>
				<logic:notPresent name="customersList"> 
					<TR>
						<TD class="tableDataLast" style="text-align:center;font-weight:bold" colspan="9">
							No Customers Found
						</TD>
					</TR>
				</logic:notPresent>
				</TBODY>
				</TABLE>
		</td>
	</tr>
</table>

<div style="padding-top:10px">
<input type="button" value="Get Report" class="smallButton"  onclick="getCustomerReports()">
</div>
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
		customerDetailsWindow =  window.open("customerDetails.html","","width=600,height=600,resizable=no,location=no");
	}
	*/
	function showCustomerDetails(customerId)
	{
		document.customerForm.acode.value="1001";
		document.customerForm.customerId.value=customerId;
		document.customerForm.submit();
	}	
	var reportWindow;
	function showCustomerReport(selectedCustomerForReport)
	{
		//selectedCustomerForReport = '000000001';
		var url = "customer.do?acode=1012&selectedCustomerForReport="+selectedCustomerForReport;
		if(reportWindow)
			reportWindow.close();
		reportWindow =  window.open(url,"","scrollbars=yes,width=650,height=600,resizable=no,location=no");		
	}
	function checkAllGetReports(isSelected)
	{
		var elements = document.getElementsByName("getReport");
		var element;
		for(var index =0; index < elements.length;index++)
		{
			element = elements[index];
			element.checked=isSelected;
		}
	}
	if(customersListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('customersStatusTable'),300);
	}
	else if(customersListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('customersStatusTable').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('customersStatusTable'),targettedScrollHeight);
	}	
	function getCustomerReports()
	{
		var elements = document.getElementsByName("getReport");
		var element;
		var selectedCustomers = "";
		for(var index =0; index < elements.length;index++)
		{
			element = elements[index];
			if(element.checked)
			{
				if(selectedCustomers != "")
				{
					selectedCustomers += ",";
				}
				selectedCustomers += element.value;
			}
		}
		if(selectedCustomers == "")
		{
			alert("Select atleast one customer to get reports");
		}
		else
		{
			document.customerSearchForm.selectedCustomersForReports.value=selectedCustomers;
			document.customerSearchForm.acode.value="1011";
			document.customerSearchForm.submit();
		}
	}
	var customerAccountsWindow;
	function showCustomerAccounts(customerId,ssn)
	{
		//ssn = '000000001';
		var url = "customer.do?acode=1013&selectedCustomerId="+customerId+"&selectedCustomerSsn="+ssn;
		if(customerAccountsWindow)
			customerAccountsWindow.close();
		customerAccountsWindow =  window.open(url,"","scrollbars=yes,width=700,height=600,resizable=no,location=no");	
	}	
</script>