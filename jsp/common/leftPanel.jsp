<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>

<%String my ="";%>
<logic:present name="loggeddist" scope="session">
<% my="My";%>
</logic:present>
 
<div style="margin-left:10px">
		  <div id="sideMenu">
				<div id="menuDivider"><!--Blue Divider--></div>
				<div id="menuTitle"><!-- Menu Title --></div>
				<div id="topMenu">
					<a href="#1;" >Distributor</a>
				</div>
				<div id="distributorRegistration" class="subMenu">
				<logic:present name="accessrole">
				<logic:equal name="accessrole" property="addDistributor" value="on">	
						<a href="#2" onclick="navigateToSpecified('distributor.do','1002')">Add Distributor</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="viewDistributor" value="on">		
						<a href="#3" onclick="navigateToSpecified('distributor.do','1003')">View <%=my%> Distributors</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="approveDistributor" value="on">			
						<a href="#4" onclick="navigateToSpecified('distributor.do','1004')">Approve <%=my%> Distributors</a>
				</logic:equal>		

				<logic:equal name="accessrole" property="viewmyhirearchy" value="on">
						<a href="#5" onclick="navigateToSpecified('distributor.do','1011')">Show My Hierarchy</a>
				</logic:equal>				
				</div>
				<div id="topMenu">
					<a href="#6;">Customer</a>	
				</div>
				<div id="customers" class="subMenu">
				<logic:equal name="accessrole" property="enrollCustomer" value="on">
						<a href="#7" onclick="navigateToSpecified('customer.do','1002')">Enroll Customer</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="approveCustomer" value="on">		
						<a href="#8" onclick="navigateToSpecified('customer.do','1003')">Approve <%=my%> Customers</a>				
				</logic:equal>				
				<logic:equal name="accessrole" property="customerStatus" value="on">		
						<a href="#9" onclick="navigateToSpecified('customer.do','1004')"><%=my%> Customer Status</a>
				</logic:equal>				
				</div>
				<div id="topMenu">
					<a href="#10;">Payments</a>	
				</div>
				<div id="payments" class="subMenu">
						<!--
						<a href="#11" onclick="navigateToSpecified('payment.do','1002')">Add Payment</a>
						-->
				<logic:equal name="accessrole" property="paymentReceivedbyCU" value="on">
						<a href="#12" onclick="navigateToSpecified('payment.do','1008')">Payments Received</a>
				</logic:equal>				
				<logic:equal name="accessrole" property="paymentsmade" value="on">
					<logic:equal name="accessrole" property="makepayment" value="on">
					<a href="#13" onclick="navigateToSpecified('payment.do','1001')">Make/View Payments</a>
					</logic:equal>
					<logic:notEqual name="accessrole" property="makepayment" value="on">	
					<a href="#14" onclick="navigateToSpecified('payment.do','1001')">View Payments</a>
					</logic:notEqual>
				</logic:equal>				
					<logic:notEqual name="accessrole" property="paymentsmade" value="on">	
					<logic:equal name="accessrole" property="makepayment" value="on">
					<a href="#15" onclick="navigateToSpecified('payment.do','1001')">Make/View Payments</a>
					</logic:equal>
					</logic:notEqual>
				
				<logic:equal name="accessrole" property="paymentReceivedfrmCU" value="on">
						<a href="#16" onclick="navigateToSpecified('payment.do','1009')">My Payments </a>
				</logic:equal>				

				</div>
				
				<logic:equal name="accessrole" property="usermgmt" value="on">
				
				<div id="topMenu">
					<a href="#17;">User Management</a>	
				</div>
				<div id="users" class="subMenu">
						<a href="#18" onclick="navigateToSpecified('user.do','showUserCreationForm')">Add User</a>
						<a href="#19" onclick="navigateToSpecified('user.do','searchUsers')">View User</a>
						<a href="#20" onclick="navigateToSpecified('role.do','addRole')">Add Role</a>
						<a href="#21" onclick="navigateToSpecified('role.do','showRole')">View Role</a>						
				</div>
				<div id="topMenu">
					<a href="#22;">Application</a>	
				</div>
				<div id="application" class="subMenu">
						<a href="#23" onclick="navigateToSpecified('profile.do','1001')">Profile Options</a>
				</div>
				</logic:equal>	
				<div id="topMenu">
					<a href="#24;">Preferences</a>	
				</div>
				<div id="users" class="subMenu">
						<a href="#25" onclick="navigateToSpecified('user.do','showProfile')">My Profile</a>
				</div>				
				
				<!--
				<div id="topMenu">
					<a href="#26;" >Show Hierarchy</a>
				</div>
				<div id="hierarchy"  class="subMenu">
					<a href="distributorsList_for_hierarchy.html"  target="iframePane" >Show Hierarchy</a>
				</div>
				-->
				<div id="menuDivider"><!--Blue Divider--></div>
				</logic:present>
			</div>	
		</div>
		<form name="leftPanelForm" id="leftPanelForm" action="" method="post">
			<input type="hidden" name="acode" value="">
		</form>
		<script>
		<!--
			function navigateToSpecified(action,acode)
			{
//alert('preparing to process');				
prepareToProcess();
				document.leftPanelForm.action = action;
				document.leftPanelForm.acode.value=acode;
//alert('preparing to submit');				
				document.leftPanelForm.submit();
			}
		//-->
		</script>