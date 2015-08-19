<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<script>
var paymentsListSize = 0; 
</script>	
	<body>
	<div>
	<div class="formSubhead">Payments Made</div><BR/>
	<logic:present name="accessrole">
<logic:equal name="accessrole" property="makepayment" value="on">	
	<html:form action="payment.do" method="post">
	<html:hidden property="acode" value="1008"/>

	<div style="border:1px solid #A5B2BD;padding-top:5px;padding-bottom:5px;">

		<div class="boldItalic" style="padding-bottom:3px;">Make Payment</div>
		<div>
		<table>
			<tr>
				<td>
					Distributor
				</td>
				
				<TD nowrap>
					<input type="text" class="formTxt" id="distributorDisplayName" name="distributorDisplayName"/>
					<html:hidden property="distributor" value=""/>						
					<img src="images/lookUp.gif" height="16" style="cursor:hand;" onclick="showApprovedDistributorsList('distributorDisplayName','distributor')"/>
				</TD>
				<td>
					Amount
				</td>
				<td>
					<html:text styleClass="formTxt" styleId="amount" property="amount" />
				</td>
			</tr>
			<tr>
				<td>
					Check Number
				</td>
				<td>
					<html:text styleClass="formTxt" styleId="chequenumber" property="chequenumber" />
				</td>
				<td>
					Description
				</td>
				<td>
					<html:textarea styleClass="formTxt" styleId="description" property="description" />
				</td>				
			</tr>	
			<tr>
			</tr>
			<tr>
			<td>
					Account Number
				</td>
				<td>
					<html:text styleClass="formTxt" styleId="accountnumber" property="accountnumber" />
				</td>
			<td >Payment Date :
			</td>
			<td>
			<html:text styleClass="formTxt" property="paymentDate" styleId="paymentDate"  readonly="false" onchange="validateDateFormat(this)"/>
			<!-- 
			<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('paymentDate'),'mm/dd/yyyy',this)"/></TD>
			-->
			<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('paymentDate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
			</td>

				
			</tr>
			<tr>	
				<td>
					&nbsp;
				</td>
				<td>
					<Input type="button" value="Make Payment" onclick="makePayment()" class="smallButton">
				</td>				
			</tr>
		</table>
		</div>
	</div>
	</html:form>
	</logic:equal>
	</logic:present>
	<form name="paymentsSearchForm" action="payment.do" method="post">
	<input type="hidden" name="acode" id="acode">
	<input type="hidden" name="paymentid" id="paymentid">
	<div style="border:1px solid #A5B2BD;padding-top:5px;padding-bottom:5px;">
		<div class="boldItalic" style="padding-bottom:3px;">Search Payments</div>
		<div>
		<table width="90%">
		<tr width="100%">
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
			<td >Start Date :
			</td>
			<td><input type="text" class="formTxt" value="" name="searchStDate" id="searchStDate"  onchange="validateDateFormat(this)"/>
			<!--  
			<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('searchStDate'),'mm/dd/yyyy',this)"/></TD>
			-->
			<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('searchStDate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
			
			</td>
			<td>End Date : 
			</td>
			<td> <input type="text" class="formTxt" value="" name="searchEndDate" id="searchEndDate"  onchange="validateDateFormat(this)"/>
			<!-- 
			<img src="images/calendar.gif" width="16" height="16" border="0" align="absmiddle" onclick="displayCalendar(document.getElementById('searchEndDate'),'mm/dd/yyyy',this)"/></TD>
			-->
			<a href="javascript:void(0)" onclick="if(self.gfPop)gfPop.fPopCalendar(document.getElementById('searchEndDate'));return false;" ><img class="PopcalTrigger" align="absmiddle" src="images/calendar.gif" width="16" height="16" border="0" alt=""></a>
			</td>
			<td colspan=2 align="right"><Input type="button" value="Search" class="smallButton" onclick="searchPaymentsMade()">
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
			<TABLE class="tableBorder" id="paymentsMadeList">
				<THEAD>
				<TR>
					<TH class="tableHeader">
						Payment Date
					</TH>
					<TH  class="tableHeader">
						Distributor Name
					</TH>
					<TH  class="tableHeader">
						Account Number
					</TH>					
					<TH  class="tableHeader">
						Amount
					</TH>
					<TH  class="tableHeaderLast">
						Description
					</TH>	
					<TH  class="tableHeaderLast">
						Delete
					</TH>				
				</TR>
				</THEAD>
				<TBODY>				
				<logic:present name="paymentsList"> 
					<bean:size id="paymentsListCount" name="paymentsList"/>
					<script>
						paymentsListSize = '<%=paymentsListCount%>';
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
					<TD  class="tableData">
						<logic:notEmpty name="payment" property="distriutorname">
							<bean:write name="payment" property="distriutorname"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="distriutorname">
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
					<TD class="tableData">
						<logic:notEmpty name="payment" property="description">
							<bean:write name="payment" property="description"/>
						</logic:notEmpty>	
						<logic:empty name="payment" property="description">
							--
						</logic:empty>
					</TD>		
					<TD class="tableDataLast">
						&nbsp;&nbsp;<A HREF="#" onclick="deletePayment(<bean:write name="payment" property="paymentid"/>)"><img src="images/delete.gif" alt="" width="20" height="20" border="0" align="middle"></a>
					</TD>			
				</TR>
					</logic:iterate>
					</logic:present>
				<logic:equal name="paymentsListCount" value="0"> 
					<TR>
							<td colspan=6 align="center" class="tableDataLast">
								No Payments Found
							</td>	
					</TR>
				</logic:equal>		
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
		if(validatePaymentForm())
			document.paymentForm.submit();
	}
	function searchPaymentsMade()
	{

		document.paymentsSearchForm.acode.value="1005";
		document.paymentsSearchForm.submit();
	}
	function deletePayment(paymentId)
	{
		document.paymentsSearchForm.acode.value="1011";
		document.paymentsSearchForm.paymentid.value=paymentId;
		document.paymentsSearchForm.submit();
	}
function setSelectedDistributor(distributorName,distributorId)
	{
		var element = document.getElementById(targetDistributorName);
		if(element)
			element.value = distributorName;
		var element = document.getElementById(targetDistributorId);
		if(element)
			element.value = distributorId;		
		targetDistributorName = "";
		targetDistributorId = "";	
	}
var targetDistributorName;
	var targetDistributorId;
	var distributorsSelectionWindow;
	function showApprovedDistributorsList(distributorName,distributorId)
	{
		if(distributorsSelectionWindow)
		{
			distributorsSelectionWindow.close();
		}
		var url = "distributor.do?acode=1012";
		var searchDisplayName = document.getElementById("distributorDisplayName");
		if(searchDisplayName)
			searchDisplayName = searchDisplayName.value;
		if(searchDisplayName && searchDisplayName != "")
			url = url+"&searchName="+searchDisplayName;
		targetDistributorName = distributorName;
		targetDistributorId = distributorId;
		distributorsSelectionWindow = window.open(url,"","location=no,height=500,width=500");
	}
function validatePaymentForm() {
		var formObj = document.paymentForm;		
		var isValidForm = true;
		var tempElement;
		var tempValue;
		var message = "";
		tempElement = formObj.distributor;
		if(tempElement)
			tempValue = tempElement.value;
		if(tempValue == "")
		{
			isValidForm = false;
			message += "\n Distributor should be selected";
		}		
		tempValue = formObj.amount.value;
		if(!isNumber(tempValue))
		{
			isValidForm = false;
			message += "\n Amount should not be left blank";
		}
		tempValue = formObj.accountnumber.value;
		if(!isNumber(tempValue))
		{
			isValidForm = false;
			message += "\n Account number should Number";
		}
		tempValue = formObj.description.value;
		if(isNull(tempValue))
		{
			isValidForm = false;
			message += "\n Description can not be left blank";
		}
				tempValue = formObj.paymentDate.value;
		if(isNull(tempValue))
		{
			isValidForm = false;
			message += "\n Payment Date can not be left blank";
		}				

		if(!isValidForm)
			alert(message);
		return isValidForm;
	}
	if(paymentsListSize > 15)
	{
		var t = new ScrollableTable(document.getElementById('paymentsMadeList'),300);
	}
	else if(paymentsListSize > 10)
	{
		var targettedScrollHeight = document.getElementById('paymentsMadeList').offsetHeight;
		targettedScrollHeight = targettedScrollHeight+30;
		var t = new ScrollableTable(document.getElementById('paymentsMadeList'),targettedScrollHeight);
	}
	setMandatoryFields(['distributorDisplayName','amount','accountnumber','description','paymentDate']);
//-->	
		
</script>