<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<html>
<%
	String isHistory = "history";
%>
<script language="javascript" type="text/javascript" src="js/javascript_lib.js"></script>
<link href="<%=request.getContextPath()%>/stylesheet/creditusa.css" type="text/css" rel="stylesheet" />
	<script>					 
		var customersAccountsListSize = 13;
		var accStatuses = new Array(); 
	</script>
	<body style="background-color:#FFFFFF;">
	<form action="customer.do" name="accountstatusform" id="accountstatusform" method="post">
	<input type="hidden" name="selectedAccounts" value="">
	<input type="hidden" name="customerssn" value="">
	<input type="hidden" name="acode" value="1014">
	<div class="formSubhead">Customer Accounts</div>
		<DIV style="padding-left:20px;padding-top:5px;">
	<TABLE class="tableBorder" id="customerAccountsStatusTable">
				<THEAD>
					<TR>
					<TH class="tableHeader" nowrap>
						Account Name
					</TH>
					<TH  class="tableHeader" nowrap>
						Date Entered 
					</TH>
					<TH  class="tableHeader" nowrap>
						Category
					</TH>
					<TH  class="tableHeader" nowrap>
						Status
					</TH>
					<TH  class="tableHeader" nowrap>
						Status Changed Date
					</TH>	
					<TH  class="tableHeader" nowrap>
						Source
					</TH>
					<TH  class="tableHeaderLast" nowrap>
						<img src="images/update.gif">
					</TH>				
					</TR>		
				</THEAD>
				<TBODY>
				<logic:present name="customerAccounts">
					<logic:iterate id="accountDetails" name="customerAccounts" type="com.creditusa.model.AccountDetailsDTO" indexId="index">
						<TR>
							<TD class="tableData">
								<logic:notEmpty name="accountDetails" property="accountname">
									<bean:write name="accountDetails" property="accountname"/>
								</logic:notEmpty>	
								<logic:empty name="accountDetails" property="accountname">
									--
								</logic:empty>
								<input type="hidden" name="customerssn" id="customerssn<%=index%>" value='<bean:write name="accountDetails" property="ssn"/>'>								
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="accountDetails" property="accountcreateddate">
									<bean:write name="accountDetails" property="accountcreateddate"/>
								</logic:notEmpty>	
								<logic:empty name="accountDetails" property="accountcreateddate">
									--
								</logic:empty>
							</TD>
							<TD  class="tableData">
								<logic:notEmpty name="accountDetails" property="accounttype">
									<bean:write name="accountDetails" property="accounttype"/>
								</logic:notEmpty>	
								<logic:empty name="accountDetails" property="accounttype">
									--
								</logic:empty>
							</TD>
							<TD class="tableData">
								<select name="accountstatus" value='<bean:write name="accountDetails" property="accountstatus"/>' class="formSelect" id="accountstatus<%=index%>" onchange="setAsModified('modifedAccount<%=index%>')">
									<logic:iterate id="possibleAccountStatus" name="possibleAccountStatusList" type="com.creditusa.model.GenericVO">
										<option value='<bean:write name="possibleAccountStatus" property="value"/>'><bean:write name="possibleAccountStatus" property="label"/></option>
									</logic:iterate>
								</select>
								<script>
									accStatuses[accStatuses.length] = '<bean:write name="accountDetails" property="accountstatus"/>';									
								</script>
							</TD>
							<TD class="tableData">
								<logic:notEmpty name="accountDetails" property="statusmodifieddate">
									<bean:write name="accountDetails" property="statusmodifieddate"/>
								</logic:notEmpty>	
								<logic:empty name="accountDetails" property="statusmodifieddate">
									--
								</logic:empty>
							</TD>	
							<TD class="tableData">
								<logic:notEmpty name="accountDetails" property="sourcetype">
									<bean:write name="accountDetails" property="sourcetype"/>
								</logic:notEmpty>	
								<logic:empty name="accountDetails" property="sourcetype">
									--
								</logic:empty>
							</TD>	
							<TD class="tableDataLast">
								<input type="checkbox" name="modifedAccount" id="modifedAccount<%=index%>" value='<bean:write name="accountDetails" property="accountno"/>' disabled>
							</TD>
						</TR>
						</logic:iterate>
				</logic:present>
				<logic:empty name="customerAccounts"> 
					<TR>
						<TD class="tableDataLast" style="text-align:center;font-weight:bold" colspan="9">
							No Reports Found
						</TD>
					</TR>
				</logic:empty>
				</TBODY>
				</TABLE>
				<div style="padding-top:15px;">
				<input type="button" class="smallButton" name="saveAccStatus" value="Save Account Status" onclick="saveStatuses()">
				<input type="button" class="smallButton" name="resetAccStatus" value="Cancel" onclick="resetForm()">
				<input type="button" class="smallButton" name="closeAccStatus" value="Close" onclick="window.close()" >
	</div>
	</form>	
	</body>
	</html>
<script>
	function resetTableHeight()
	{
		if(getTableRowsLength('customerAccountsStatusTable') > 15)
		{
			var t = new ScrollableTable(document.getElementById('customerAccountsStatusTable'),300);
		}
		else if(getTableRowsLength('customerAccountsStatusTable') > 10)
		{
			var targettedScrollHeight = document.getElementById('customerAccountsStatusTable').offsetHeight;
			targettedScrollHeight = targettedScrollHeight+30;
			var t = new ScrollableTable(document.getElementById('customerAccountsStatusTable'),targettedScrollHeight);
		}	
	}
	function getTableRowsLength(tableName)
	{
		var element = document.getElementById(tableName);
		var totalRows = element.rows;
		if(totalRows)
		{
			totalRows = totalRows.length;
		}
		else
		{
			totalRows = 0;
		}
		return totalRows;
	}
	function showHide(objId)
	{
		var elements = document.getElementsByName(objId);
		var ele;
		if(elements)
		{
			for(var index =0; index < elements.length; index++)
			{
				ele = elements[index];
				if(ele)
				{
					if(ele.style.display != 'none')
						ele.style.display = 'none';
					else
						ele.style.display = 'block';
				}
			}
			resetTableHeight();
		}
		var img = document.getElementById(objId + 'img');
		if((img != null) && (img.src != null))
		{
			if(img.src.indexOf('expand') > -1)
				img.src = img.src.replace('expand','collapse');
			else
				img.src = img.src.replace('collapse','expand');
		}		
	}
	function setAsModified(modifiedCheckBox)
	{
		var element = document.getElementById(modifiedCheckBox);
		if(element)
		{
			element.checked = true;
		}
	}	
	function saveStatuses()
	{
		var elements = document.getElementsByName('modifedAccount');
		var element;
		var tempElement;
		var accountStatus;
		var tempElementName;
		var accountsStatuses = "";
		var colSep = String.fromCharCode(222);
		var rowSep = String.fromCharCode(223);
		var customerssn = "";
		if(elements)
		{
			for(var index =0; index < elements.length ; index++)
			{
				element = elements[index];
				if(element && element.checked)
				{
					tempElementName = 'accountstatus'+index;
					tempElement = document.getElementById(tempElementName);
					if(tempElement)
					{
						accountStatus = tempElement.value;
						if(customerssn == "")
						{
							tempElementName = 'customerssn'+index;
							tempElement = document.getElementById(tempElementName);
							customerssn = tempElement.value;
							tempElement = document.getElementById('customerssn');
							tempElement.value = customerssn; 
						} 
						if(accountsStatuses != "")
							accountsStatuses += rowSep;
						accountsStatuses += element.value+colSep+accountStatus;
					}
				}
			}
		}
		if(accountsStatuses != "")
		{
			document.accountstatusform.selectedAccounts.value = accountsStatuses;
			document.accountstatusform.submit();
		}
		
	}
	function setAccountsStatuses()
	{
		var elements = document.getElementsByName('accountstatus');
		var element;
		if(elements)
		{
			for(var index =0; index < elements.length; index++)
			{
				element = elements[index];				
				element.value = accStatuses[index];
			}
		}
	}
	function resetForm()
	{
		document.accountstatusform.reset();
		setAccountsStatuses();
	}
	setAccountsStatuses();
	resetTableHeight();
</script>