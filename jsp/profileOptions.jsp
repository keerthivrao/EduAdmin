<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
	
	<body>
	<script>
		var profileMap = new Map();
	</script>
	<div>
	<div class="formSubhead">Profile Options</div><BR/>
	
	<form name="profileForm" action="profile.do" method="post">
	<input type="hidden" name="acode" value="1002"/>

	<div style="border:1px solid #A5B2BD;width:85%;padding-top:5px;padding-bottom:5px;">
		<!--
		<div class="boldItalic" style="padding-bottom:3px;">Define Profile</div>
		<div>
		<table>
			<tr>
				<td>
					Profile Name : <input type="text" name="profileName" id="profileName" width="40" value="">
				</td>				
			</tr>
			<tr>
				<td>
					Profile Value : <input type="text" name="profileValue" id="profileValue" width="100" value="">
				</td>				
			</tr>			
			<tr>
				<td colspan=2>
					<input type="button" name="createProfile" value="Create Profile" onclick="createProfileOption()">
				</td>							
			</tr>			
		</table>
		</div>
		-->
		<div class="boldItalic" style="padding-bottom:3px;">Update Profile</div>
		<div>
		<table>
			<tr>
				<td>
					Profile Name : <select class="formSelect" name="modifiedProfileName" id="modifiedProfileName" onchange="setProfileValue(this.value)">
										<logic:iterate id="profile" name="profiles" scope="request" type="com.creditusa.model.ProfileDTO">
											<option value='<bean:write name="profile" property="profilename"/>'><bean:write name="profile" property="profilename"/></option>
											<script>
												profileMap.put('<bean:write name="profile" property="profilename"/>','<bean:write name="profile" property="profilevalue"/>');
											</script>
										</logic:iterate>
									</select>
				</td>				
			</tr>
			<tr>
				<td>
					Profile Value : <input type="text" class="unspecifiedWidthTxt" name="modifiedProfileValue" id="modifiedProfileValue" size="75" value="">
				</td>				
			</tr>			
			<tr>
				<td>
					<input type="button" name="updateProfile" value="Update Profile" onclick="updateProfileOption()" class="largeButton">
				</td>							
			</tr>			
		</table>
		</div>
	</div>
	</form>	
</div>
</body>
<script>
function createProfileOption()
{
	var profName = document.getElementById('profileName');
	var profValue = document.getElementById('profileValue');
	if(profName && profValue)
	{
		profName = profName.value;
		profValue = profValue.value;
		if(profName != "")
		{
			alert("Profile name should not be left blank");
		}
		else
		{
			document.profileForm.submit();
		}
	}	
}	
function setProfileValue(selectedProfile)
{
	var selectedProfileValue = profileMap.get(selectedProfile);
	document.profileForm.modifiedProfileValue.value=selectedProfileValue;
}
function updateProfileOption()
{
	document.profileForm.submit();		
}
var selectedProfile = document.profileForm.modifiedProfileName;
if(selectedProfile)
{
	selectedProfile = selectedProfile.value;
	setProfileValue(selectedProfile);
}

</script>