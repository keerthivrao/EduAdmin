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
	</script>
	<body style="background-color:#FFFFFF;">
	
	<div class="formSubhead">Customer Report</div>
		<DIV style="padding-left:20px;padding-top:5px;">
		<table class="tableBorder" cellpadding="2" cellspacing="0">
			<thead>
				<th class="tableHeaderLast" colspan=2>Summary
				</th>
			</thead>
			<tr>
				<td class="tableData">Original Accounts
				</td>
				<td class="tableDataLast"><bean:write name="reportDTO" property="originalAccounts"/>
				</td>
			</tr>
			<tr>
				<td class="tableData">Additional Accounts
				</td>
				<td class="tableDataLast"><bean:write name="reportDTO" property="additionalAccounts"/>
				</td>
			</tr>
			<tr>
				<td class="tableData">Total Accounts
				</td>
				<td class="tableDataLast"><bean:write name="reportDTO" property="totalAccounts"/>
				</td>
			</tr>
			<tr>
				<td class="tableData">Accounts Deleted
				</td>
				<td class="tableDataLast"><bean:write name="reportDTO" property="deletedAccounts"/>
				</td>
			</tr>
			<tr>
				<td class="tableData">Accounts In Dispute
				</td>
				<td class="tableDataLast"><bean:write name="reportDTO" property="accountsInDispute"/>
				</td>
			</tr>
		</table>

	<div style="padding-top:15px"></div>
	
	<TABLE class="tableBorder" id="customerAccountsStatusTable">
				<THEAD>
					<TR>
					<TH class="tableHeader">
						&nbsp;
					</TH>
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
						Report
					</TH>
					<TH  class="tableHeader" nowrap>
						Status Changed Date
					</TH>	
					<TH  class="tableHeaderLast" nowrap>
						Source
					</TH>				
					</TR>		
				</THEAD>
				<TBODY>
				<bean:define id="accountsList" name="reportDTO" property="accountsDetails"/>
				<logic:present name="accountsList">
					<logic:iterate id="accountList" name="accountsList">						
						<logic:notEmpty name="accountList">						
						<logic:iterate id="accountDetails" name="accountList" scope="page" type="com.creditusa.model.AccountDetailsDTO" indexId="index">
							<bean:define id="accountNumber" name="accountDetails" property="accountno"/>
							<logic:equal name="index" value="0">
								<%
									isHistory = "";
								%>
								<TR>
									<TD class="tableData">
										<img src='images/icon_expand.gif' name='sample2img' width='9' height='9' border='0' align='absmiddle' onclick='showHide("<%=accountNumber%>")' id="<%=accountNumber%>img"/>
									</TD>
							</logic:equal>
							<logic:notEqual name="index" value="0">
								<%
									isHistory = "history";
								%>
								
								<TR id="<%=accountNumber%>" name="<%=accountNumber%>" style="display:none;color:#FF0000;">
									<TD style="border-right:solid 1px #A5B2BD;">&nbsp;										
									</TD>
							</logic:notEqual>							
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="accountname">
										<bean:write name="accountDetails" property="accountname"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="accountname">
										--
									</logic:empty>
								</TD>
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="accountcreateddate">
										<bean:write name="accountDetails" property="accountcreateddate"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="accountcreateddate">
										--
									</logic:empty>
								</TD>
								<TD  class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="accounttype">
										<bean:write name="accountDetails" property="accounttype"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="accounttype">
										--
									</logic:empty>
								</TD>
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="accountstatus">
										<bean:write name="accountDetails" property="accountstatus"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="accountstatus">
										--
									</logic:empty>
								</TD>
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="htmlreportid">
										<input type="button" value="Report" class="smallButton"  onclick="showPulledCustomerReport('<bean:write name="accountDetails" property="htmlreportid"/>')">
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="htmlreportid">
										<input type="button" value="Report" class="smallButton" disabled="disabled">
									</logic:empty>
								</TD>
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="statusmodifieddate">
										<bean:write name="accountDetails" property="statusmodifieddate"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="statusmodifieddate">
										--
									</logic:empty>
								</TD>	
								<TD class="<%=isHistory%>tableData">
									<logic:notEmpty name="accountDetails" property="sourcetype">
										<bean:write name="accountDetails" property="sourcetype"/>
									</logic:notEmpty>	
									<logic:empty name="accountDetails" property="sourcetype">
										--
									</logic:empty>
								</TD>				
							</TR>
						</logic:iterate>
						</logic:notEmpty>						
					</logic:iterate>
				</logic:present>
				<logic:empty name="accountsList"> 
					<TR>
						<TD class="tableDataLast" style="text-align:center;font-weight:bold" colspan="9">
							No Reports Found
						</TD>
					</TR>
				</logic:empty>
				</TBODY>
				</TABLE>	
	</div>
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
	var pulledReportWindow;
	function showPulledCustomerReport(reportId)
	{
		if(!reportId || reportId == "")
		{
			alert('No report available');
			return;
		}
		//ssn = '000000001';
		
		var url = "customer.do?acode=1015&selectedReportId="+reportId;
		if(pulledReportWindow)
			pulledReportWindow.close();
		pulledReportWindow =  window.open(url,"","scrollbars=yes,width=700,height=600,resizable=no,location=no");	
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
	resetTableHeight();
</script>