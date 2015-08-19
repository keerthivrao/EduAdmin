<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<script language="javascript" type="text/javascript" src="js/javascript_lib.js"></script>
<script language="javascript" type="text/javascript" src="js/validator.js"></script>
<script type="text/javascript" src="js/stringbuilder.js"></script>
<script type="text/javascript" src="js/zip-state.js"></script>
<link href="<%=request.getContextPath()%>/stylesheet/creditusa.css" type="text/css" rel="stylesheet" />
<link type="text/css" rel="stylesheet" href="calendar/calendar.css" media="screen"></LINK>
<SCRIPT type="text/javascript" src="calendar/calendar.js"></script>
<SCRIPT type="text/javascript" src="js/validator.js"></script>
<SCRIPT type="text/javascript" src="js/Map.js"></script>
<title><tiles:getAsString name="title"/></title>
<style>


</style>
</head>

<body>
	
	<TABLE width="100%">
	<TR>
		<TD colspan=2>
		<div id="loadingDiv"  style="width:300px;height:200px;
background:#F0F0F0;filter:alpha(opacity=40);valign:middle;
-moz-opacity:.40;opacity:.40;position:absolute;z-index:100;text-align:center;display:none; margin:0 auto;color:#FF0000;text-align:center;" >
	<div style="font-weight:bold;font-size:17px;line-height:4"><img src="images/loading-wait.gif"/>Request Under process Please wait ....</div>	
	</div>
		</TD>
	</TR>
	<TR>
		<TD colspan=2 valign="top">
			<div id="headerDiv">
		<tiles:insert attribute="header"/>
	</div>

		</TD>

	</TR>
		<TR>
			<TD valign="top" id="leftPanel" class="leftPanel">
			<div  style="width:100%">
		<tiles:insert attribute="leftPanel"/>		
	</div>
			</TD>
			<TD   valign="top"  id="contentContainer" class="contentContainer">
			<div style="width:100%">		
		<tiles:insert attribute="body"/>		
	</div>
			</TD>
		</TR>

<TR>
	<TD colspan=2  class="footer">
	<div id="footer">
		<tiles:insert attribute="footer"/>		
	</div>
	</TD>

</TR>

	</TABLE>
		
	
	
	
</body>
<script>
<!--
	var errorMessage = "";
	var displayErrorMessage = false;
	function setDocWidth(){
		var clientHigh = document.documentElement.clientHeight;
		var headerDivHeight = document.getElementById("headerDiv").offsetHeight;
		var footerDivHeight = document.getElementById("footer").offsetHeight;
			var pageHeight = clientHigh-headerDivHeight-footerDivHeight+"px";
			document.getElementById("leftPanel").style.height=pageHeight;
			document.getElementById("contentContainer").style.height=pageHeight;
	}
	window.onresize = myResize;
	function myResize() {
	if (document.all)
		{setDocWidth();
		//alert(document.body.clientWidth);
		}else{
		setDocWidth();
		//alert(window.innerWidth);
		}
	}	
	
	function prepareToProcess()
	{
		var loadingDiv = document.getElementById("loadingDiv");
		var clientHig = document.documentElement.clientHeight;
		var clientWidth = document.documentElement.clientWidth;
		loadingDiv.style.display = "block";
		loadingDiv.style.height = clientHig+"px";
		loadingDiv.lineHeight = clientHig;
		loadingDiv.style.width = clientWidth+"px";		
	}
	setDocWidth();
	//-->
</script>
</html>


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