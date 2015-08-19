<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<link href="<%=request.getContextPath()%>/stylesheet/creditusa.css" type="text/css" rel="stylesheet" />
<div class="formSubhead">Distributor Details</div><BR/>
<logic:present name="distributorsList"> 
	<div style="width:80%;padding-left:30px">
	<logic:iterate id="distributor" name="distributorsList" type="com.creditusa.model.DistributorDTO">
		<div width="33%">		
				<logic:notEmpty name="distributor" property="firstname">
					<a href="javascript:void(0)" onclick="postToParent('<bean:write name="distributor" property="firstname"/>','<bean:write name="distributor" property="distributorid"/>')"> <bean:write name="distributor" property="firstname"/></a>
				</logic:notEmpty>	
				<logic:empty name="distributor" property="firstname">
					--
				</logic:empty>
		</div>		
	</logic:iterate>
	</div>
</logic:present>
<logic:notPresent name="distributorsList"> 
		No Distributors Found		
</logic:notPresent>
</div>

<script>
<!--
function postToParent(distributorName,distributorId)
{
	var parentwindow = window.opener;
	parentwindow.setSelectedDistributor(distributorName,distributorId);
	self.close();
}
//-->
</script>
