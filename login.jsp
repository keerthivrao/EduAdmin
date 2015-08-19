<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html dir="ltr">
<head>
<title>Login Screen</title>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<style>
.tableb {
	font-family:Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #E4E8E8 ;
	padding-top: 6px;
	padding-right: 10px;
	padding-bottom: 6px;
	padding-left: 10px;
	border-left: 1px solid #E4E8E8;
	border-top: 1px solid #E4E8E8;
	line-height: 16px;
}

.tablec {
	font-family:Arial, Helvetica, sans-serif;
	font-size: 12px;
	background-color: #d8e0e4;
	padding-top: 3px;
	padding-right: 10px;
	padding-bottom: 3px;
	padding-left: 10px;
	border-left: 1px solid #E4E8E8;
	border-top: 1px solid #E4E8E8;
}
#topBanner{
	/*width:1024px;*/
	height:50px;
	line-height:50px;
	/*background-color:#009999;*/
	background-color:#0065A8;
	font-family:Verdana, Arial, Helvetica, sans-serif;
	color:#FFFFFF;
	font-size:200%;
	font-weight:bold;
	border-right:solid 1px #666666;
	text-align:center;
}
.divBorder
{
	font-family:Arial, Helvetica, sans-serif;
	font-size: 12px;
	border:1px solid #A5B2BD;
	padding-top:10px;
	padding-bottom:5px;
}
</style>
</head>
<body>

<TABLE height="100%">
<TR>
	<TD width="100%" colspan=3 height="10%"><div id="topBanner"><div style="margin-left:10px">Credit USA</div></div></TD>
</TR>
<TR>
	<TD width="100%" colspan=3></TD>
</TR>
<TR>
	<TD width="33%">&nbsp;</TD>
	<TD width="33%" valign="bottom">
	<form action="user.do" method="post">
	<input type="hidden" name="acode" id="acode" value="loginUser">

	<table>
	<tr>
			<td class='tablec' colspan='3' nowrap><img src='images/icon-info.gif' align='absmiddle'>&nbsp;Enter your username and password to login</td>
		</tr>
		<tr>
			<td class='tablec' rowspan='3' align="center" valign="middle"><img src="images/icon-loginpic.gif" hspace='6'></td>
			<td class='tableb'>Username</td>
			<td class='tableb' width='99%'><input type='text' name='username' class='textinput' value='' size='25'>
			</td>
		</tr>
		<tr>
			<td class='tableb'>Password</td>
			<td class='tableb'><input type='password' name='password' class='textinput' value='' size='25'>
			</td>
		</tr>
		<tr>
			<td class='tableb'>&nbsp;</td>
			<td class='tableb'>&nbsp;
			</td>
		</tr>
		<tr>
			<td class='tablec' colspan='3' align='center' valign='middle' height='40'>
				<input name='submit' type="submit" value="&nbsp;&nbsp;Login&nbsp;&nbsp;" class='button'>
			</td>
		</tr>
</table>
</form>
</TD>
	<TD width="33%">&nbsp;</TD>
</TR>
<TR>
	<TD>&nbsp;</TD>
	<TD>&nbsp;</TD>
	<TD valign="bottom">
	<div class="divBorder">
		Credit USA invites interested candidates to join as distributors.
		If you are interested in joining the winning team, please leave your contact details 
		with Credit USA. 
		Members of Credit USA will contact you for further processing.
		Interested?
		Fill this <a href="javascript:void(0);" onclick="openContactForm()"> Contact Form</a>
		
	</div>
	
	</TD>
</TR>
</TABLE>

</body>
</html>
<script>
var contactFormWindow;
var errorMessage = "";
var displayErrorMessage = false;
	
function openContactForm()
{
	if(contactFormWindow)
		contactFormWindow.close();
	contactFormWindow =  window.open("jsp/contactForm.jsp","","width=400,height=350,resizable=no,location=no");
}
</script>
<logic:messagesPresent message="true">
		<font color="red"> 
		<html:messages id="error" message="true">
			<script>
				<!--
				errorMessage += '<%=error%>'+"\n";
				displayErrorMessage = true;
				//-->
			</script>
			</html:messages> </font>
</logic:messagesPresent>
<script>
<!--
	if(displayErrorMessage == true)
		alert(errorMessage);
//-->		
</script>
