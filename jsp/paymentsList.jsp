<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<script>
var paymentsListSize = 0; 
</script>	
	<body>
	<div>
	<div class="formSubhead">Payments Received</div><BR/>

	<form name="paymentsSearchForm" action="payment.do" method="post">
	<input type="hidden" name="acode" id="acode">
	<div style="border:1px solid #A5B2BD;padding-top:10px;padding-bottom:5px;">
		<div class="boldItalic" style="padding-bottom:3px;">Search Payments</div>
		<div>
		<table width="100%">
		<tr>
			<!--td nowrap>Payment Mode : 
			</td>
			<td><select class="formSelect" name="searchMode" id="searchMode">
								<option value="" selected></option>
								<option value="CC" >Credit Card Pay</option>
								<option value="CQ">Cheque</option>
								<option value="MO">Money Order</option>
					 </select>
			</td-->
			<td nowrap>Time Period:
			</td>
			<td><select class="formSelect" name="searchTimePeriod" id="searchTimePeriod">
								<option value="" selected></option>
								<option value="7" >Last 7 days</option>
								<option value="15">Last 15 days</option>
								<option value="30">Last 30 days</option>
								<option value="90">Last 90 days</option>
								<option value="180">Last 180 days</option>
								<option value="365">Last 365 days</option>
					 </select>
			</td>
			<td>Amount  :
			</td>
			<td nowrap>
			<select class="formSelect" name="searchAmountOperator" id="searchAmountOperator">
								<option value=">" selected>Greater Than</option>
								<option value="<">Less Than</option>
								<option value="=">Equal To</option>
					 </select>
			<input type="text" class="formTxt" value="" name="searchAmount" id="searchAmount">
			</td>
		</tr>
		<tr>
			<td>Start Date :
			</td>
			<td><input type="text" class="formTxt" value="" name="searchStDate" id="searchStDate"  onchange="validateDateFormat(this)"/>
			<!-- 
			<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('searchStDate'),'mm/dd/yyyy',this)"/>
			-->
			<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('searchStDate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
			</TD>
			</td>
			<td>End Date : 
			</td>
			<td> <input type="text" class="formTxt" value="" name="searchEndDate" id="searchEndDate"  onchange="validateDateFormat(this)"/>
			<!-- 
			<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('searchEndDate'),'mm/dd/yyyy',this)"/></TD>
			-->
			<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('searchEndDate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
			</td>
			<td colspan=2 align="right"><Input type="button" value="Search" class="smallButton" onclick="searchPaymentsReceived()">
			</td>
		</tr>
		</table>
		</div>
	
	</div>
	</form>
	<div>
	<form name="paymentsMadeForm" action="payment.do" method="post">
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder" id="paymentsReceivedList">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						Payment Date
					</TH>
					<TH  class="tableHeader">
						Type
					</TH>
					<TH  class="tableHeader">
						Distributor Name
					</TH>
					<TH  class="tableHeader">
						Customer Name
					</TH>
					<TH  class="tableHeader">
						Account Number
					</TH>					
					<TH  class="tableHeader">
						Amount
					</TH>
					<TH  class="tableHeaderLast">
						Status
					</TH>					
				</TR>
				</THEAD>
				<TBODY>		
				<bean:size id="paymentsListCount" name="paymentsList"/>
				
				<logic:equal name="paymentsListCount" value="0"> 
					<TR>
			
							<td colspan=8 align="center" class="tableDataLast">
								No Payments Found
							</td>	
					</TR>
				</logic:equal>				
				<logic:present name="paymentsList"> 
					
					<script>
						paymentsListSize = <%=paymentsListCount%>;
					</script>
					<logic:iterate id="payment" name="paymentsList" type="com.creditusa.model.PaymentDTO">
				<TR>
					<TD class="tableData">
						<logic:notEmpty name="payment" property="paymentdate">
							<bean:write name="payment" property="paymentdate"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="paymentdate">
							--
						</logic:empty>	
					</TD>
					<TD class="tableData">
						<logic:notEmpty name="payment" property="type">
							<bean:write name="payment" property="type"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="type">
							--
						</logic:empty>	
					</TD>
					<TD  class="tableData">
						<logic:notEmpty name="payment" property="distriutorname">
							<bean:write name="payment" property="distriutorname"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="distriutorname">
							--
						</logic:empty>
					</TD>
					<TD class="tableData">
						<logic:notEmpty name="payment" property="customername">
							<bean:write name="payment" property="customername"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="customername">
							--
						</logic:empty>	
					</TD>
					<TD class="tableData">
						<logic:notEmpty name="payment" property="accountnumber">
							<bean:write name="payment" property="accountnumber"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="accountnumber">
							--
						</logic:empty>	
					</TD>					
					<TD class="tableData">
						<logic:notEmpty name="payment" property="amount">
							<bean:write name="payment" property="amount"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="amount">
							--
						</logic:empty>
					</TD>
					<TD class="tableDataLast">
						<logic:notEmpty name="payment" property="status">
							<bean:write name="payment" property="status"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="status">
							--
						</logic:empty>
					</TD>					
				</TR>
					</logic:iterate>
					</logic:present>
				
				</TBODY>						
				</TABLE>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</body>
<script>
<!--
	function submitForm()
	{
		document.customerRegistration.submit();
	}
	var customerDetailsWindow;
	function showDetails()
	{
		if(customerDetailsWindow)
			customerDetailsWindow.close();
		customerDetailsWindow =  window.open("paymentMade.html","","width=700,height=350,resizable=no,location=no");
	}
	function makePayment()
	{
		document.paymentForm.acode.value="1004";
		document.paymentForm.submit();
	}
	function searchPaymentsReceived()
	{
		document.paymentsSearchForm.acode.value="1006";
		document.paymentsSearchForm.submit();
	}

	if(paymentsListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('paymentsReceivedList'),300);
	}
	else if(paymentsListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('paymentsReceivedList').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('paymentsReceivedList'),targettedScrollHeight);
	}	
	
	
//-->	
</script>