	<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
	<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
	<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	<html:form action="payment.do" method="post">
	<div class="formSubhead">Payment Details</div><BR/>
	<table width="80%" cellpadding="0" cellspacing="0" border="0" class="table">
	<tr>
		<td>
			<TABLE >
				<TR>
					<TD>Distributor Name</TD>
					<TD><html:text styleClass="formTxt" styleId="distributorname" property="distributorname"/></TD>
					<TD width="25%">Customer Name</TD>
					<TD width="35%"><html:text styleClass="formTxt" styleId="customername" property="customername"/></TD>					
				</TR>
				<TR>
					<TD>Amount</TD>
					<TD colspan="3"><html:text styleClass="formTxt" styleId="amount" property="amount"/></TD>
				</TR>
				<TR>
					<TD>Payment Type</TD>
					<TD>
						<html:select styleClass="formSelect" styleId="paymenttype" property="paymenttype">
							<html:optionsCollection property="paymentmethods" label="label" value="value"/>
						</html:select>
					</TD>
					<TD>Payment Made By</TD>
					<TD><html:text styleClass="formTxt" styleId="paymentmadeby" property="paymentmadeby"/></TD>
					
					
				</TR>
				<TR>
					
					<TD width="25%">Payment Mode</TD>
					<TD width="35%">
						<html:select styleClass="formSelect" styleId="paymentmode" property="paymentmode">
							<html:optionsCollection property="paymentmodes" label="label" value="value"/>
						</html:select>
					</TD>
					 <TD>Account Number</TD>
					<TD><html:text styleClass="formTxt" styleId="accountnumber" property="accountnumber"/></TD>
					
				</TR>
				<TR>
					<TD>Check Number</TD>
					<TD><html:text styleClass="formTxt" styleId="chequenumber" property="chequenumber"/></TD>
					<TD>Credit Card Number</TD>
					<TD><html:text styleClass="formTxt" styleId="ccnumber" property="ccnumber"/></TD>
					
					
				</TR>
				<TR>
					<TD width="20%">Routing Number</TD>
					<TD width="30%"><html:text styleClass="formTxt" styleId="routingnumber" property="routingnumber"/></TD>
					<TD>Expiry Date</TD>
					<TD><html:text styleClass="formTxt" styleId="expirydate" property="expirydate"/></TD>
				</TR>
				<TR>
					<TD>Address</TD>
					<TD><html:text styleClass="formTxt" styleId="address" property="address"/></TD>
					<TD>City</TD>
					<TD><html:text styleClass="formTxt" styleId="city" property="city"/></TD>
				</TR>
				<TR>
					<TD>State</TD>
					<TD><html:text styleClass="formTxt" styleId="state" property="state"/></TD>
					<TD>Zip Code</TD>
					<TD><html:text styleClass="formTxt" styleId="zipcode" property="zipcode"/></TD>
				</TR>
				<TR>
					<TD>CVV</TD>
					<TD><html:text styleClass="formTxt" styleId="cvv" property="cvv"/></TD>
					<TD></TD>
					<TD></TD>
				</TR>
			</TABLE>
		</td>
	</tr>
	<tr>
		<td>&nbsp;</td>
	</tr>
	<tr>
		<td align="center"><input type="button" name="registerDistributor" value="Add Payment" class="largeButton">&nbsp;&nbsp;<input type="button" name="registerDistributor" value="Post Commisions" class="largeButton">&nbsp;&nbsp;<input type="reset" name="cancel" value="Cancel" class="largeButton"></td>		
	</tr>
</table>

</html:form>
