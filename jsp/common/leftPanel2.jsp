<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>

<div style="margin-left:10px">
		  <div id="sideMenu">
				<div id="menuDivider"><!--Blue Divider--></div>
				<div id="menuTitle"><!-- Menu Title --></div>
				<div id="topMenu">
					<a href="javascript:void(0);" >Distributor</a>
				</div>
				<div id="distributorRegistration" class="subMenu">
				<logic:present name="accessrole">
				<logic:equal name="accessrole" property="addDistributor" value="on">
						<a href="javascript:void(0)" onclick="navigateToSpecified('distributor.do','1002')">Add Distributor</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="viewDistributor" value="on">
						<a href="javascript:void(0)" onclick="navigateToSpecified('distributor.do','1003')">View Distributors</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="approveDistributor" value="on">
				
						<a href="javascript:void(0)" onclick="navigateToSpecified('distributor.do','1004')">Approve Distributor</a>
				</logic:equal>	
				</logic:present>	
				
						<a href="javascript:void(0)" onclick="navigateToSpecified('distributor.do','1005')">Show Hierarchy</a>
				
				</div>

				<div id="topMenu">
					<a href="javascript:void(0);">Customer</a>	
				</div>
				<div id="customers" class="subMenu">
					<logic:present name="accessrole">
					<logic:equal name="accessrole" property="enrollCustomer" value="on">	
						<a href="javascript:void(0)" onclick="navigateToSpecified('customer.do','1002')">Enroll Customer</a>
					</logic:equal>	
					<logic:equal name="accessrole" property="approveCustomer" value="on">	
						<a href="javascript:void(0)" onclick="navigateToSpecified('customer.do','1003')">Approve Customer</a>				
					</logic:equal>	
					<logic:equal name="accessrole" property="customerStatus" value="on">	
						<a href="javascript:void(0)" onclick="navigateToSpecified('customer.do','1004')">Customer Status</a>
					</logic:equal>	
					</logic:present>
				</div>
				<div id="topMenu">
					<a href="javascript:void(0);">Payments</a>	
				</div>
				<div id="payments" class="subMenu">
					<logic:present name="accessrole">
					<logic:equal name="accessrole" property="addPayment" value="on">	
						<a href="javascript:void(0)" onclick="navigateToSpecified('payment.do','1002')">Add Payment</a>
					</logic:equal>	
					<logic:equal name="accessrole" property="paymentReceivedfrmCU" value="on">		
						<a href="javascript:void(0)" onclick="navigateToSpecified('payment.do','1003')">Payments Received</a>
					</logic:equal>	
					<logic:equal name="accessrole" property="paymentsmade" value="on">		
						<a href="javascript:void(0)" onclick="navigateToSpecified('payment.do','1004')">Payments Made</a>
					</logic:equal>	
					</logic:present>
				</div>
				<div id="topMenu">
					<a href="javascript:void(0);">User Management</a>	
				</div>
				<div id="users" class="subMenu">
				<logic:present name="accessrole">
				<logic:equal name="accessrole" property="editusers" value="on">		
						<a href="javascript:void(0)" onclick="navigateToSpecified('user.do','showUserCreationForm')">Add User</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="viewusers" value="on">				
						<a href="javascript:void(0)" onclick="navigateToSpecified('user.do','searchUsers')">View User</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="addRole" value="on">				
						<a href="javascript:void(0)" onclick="navigateToSpecified('role.do','addRole')">Add Role</a>
				</logic:equal>		
				<logic:equal name="accessrole" property="viewRole" value="on">				
						<a href="javascript:void(0)" onclick="navigateToSpecified('role.do','showRole')">View Role</a>
				</logic:equal>	
				</logic:present>	
				</div>
				<div id="topMenu">
					<a href="javascript:void(0);">Preferences</a>	
				</div>
				<div id="users" class="subMenu">
						<a href="javascript:void(0)" onclick="navigateToSpecified('user.do','showmyprofile')">My Profile</a>
				</div>

				<!--
				<div id="topMenu">
					<a href="javascript:void(0);" >Show Hierarchy</a>
				</div>
				<div id="hierarchy"  class="subMenu">
					<a href="distributorsList_for_hierarchy.html"  target="iframePane" >Show Hierarchy</a>
				</div>
				-->
				<div id="menuDivider"><!--Blue Divider--></div>
			</div>	
		</div>
		<form name="leftPanelForm" id="leftPanelForm" action="" method="post">
			<input type="hidden" name="acode" value="">
		</form>
		<script>
		<!--
			function navigateToSpecified(action,acode)
			{
				prepareToProcess();
				document.leftPanelForm.action = action;
				document.leftPanelForm.acode.value=acode;
				document.leftPanelForm.submit();
			}
		//-->
		</script>