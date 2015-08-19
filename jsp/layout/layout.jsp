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
<script>
<!--
function limitText(limitField, limitNum,nextFocus) 
  {
	limitField = document.getElementById(limitField);
	nextFocus =  document.getElementById(nextFocus);
	if(limitField && limitField.value)
	{
		if (limitField.value.length > limitNum) 
		{
			limitField.value = limitField.value.substring(0, limitNum);
			if(nextFocus)
			{
				nextFocus.focus();
			}
		} 
	}
  }	
	function limitDigits(limitField, limitNum,nextFocus) 
	{
		limitField = document.getElementById(limitField);
		nextFocus =  document.getElementById(nextFocus);
		if(limitField && limitField.value)
		{
			if (limitField.value.length > limitNum) 
			{
				limitField.value = limitField.value.substring(0, limitNum);
				if(nextFocus)
				{
					nextFocus.focus();
				}
			} 
		}
	}	
	function splitPhoneNumber(phoneNumber,primaryPhoneId)
	{
		if(primaryPhoneId && phoneNumber)
		{
			var phonenumberdigits = phoneNumber.split('');
			var target1 = "";//primaryPhoneId+"~1";
			var target2 = "";//primaryPhoneId+"~2";
			var target3 = "";//primaryPhoneId+"~3";
			var target;
			{
				for(var index =0;index < phonenumberdigits.length;index++)
				{
					if(index < 3)	
					{
						target1 +=phonenumberdigits[index];
					}
					else if(index < 6)
					{
						target2 +=phonenumberdigits[index];
					}
					else
					{
						target3 +=phonenumberdigits[index];
					}
				}
				
				target = document.getElementById(primaryPhoneId+"~1");
				if(target)
					target.value = target1;
				target = document.getElementById(primaryPhoneId+"~2");
				if(target)
					target.value = target2;
				target = document.getElementById(primaryPhoneId+"~3");
				if(target)
					target.value = target3;
			}
		}
	}
	function splitSSN(ssn,ssnId)
	{
		if(ssnId && ssn)
		{
			var ssndigits = ssn.split('');
			var target1 = "";//ssnId+"~1";
			var target2 = "";//ssnId+"~2";
			var target3 = "";//ssnId+"~3";
			var target;
			{
				for(var index =0;index < ssndigits.length;index++)
				{
					if(index < 3)	
					{
						target1 +=ssndigits[index];
					}
					else if(index < 5)
					{
						target2 +=ssndigits[index];
					}
					else if(index < 9)
					{
						target3 +=ssndigits[index];
					}
				}
				
				target = document.getElementById(ssnId+"~1");
				if(target)
					target.value = target1;
				target = document.getElementById(ssnId+"~2");
				if(target)
					target.value = target2;
				target = document.getElementById(ssnId+"~3");
				if(target)
					target.value = target3;
			}
		}
	}
	function concatenateSSN(ssnId)
	{
		if(ssnId)
		{
			var target1 = document.getElementById(ssnId+"~1");
			var target2 = document.getElementById(ssnId+"~2");
			var target3 = document.getElementById(ssnId+"~3");
			var target = document.getElementById(ssnId);
			{
				target1 = target1.value;
				target2 = target2.value;
				target3 = target3.value;
				if(!target1)
					target1 = "";
				if(target2)
					target1 += target2;
				if(target3)
					target1 += target3;
				target.value = target1;
			}
		}
	}
	function concatenatePhoneNumber(primaryPhoneId)
	{
		if(primaryPhoneId)
		{
			var target1 = document.getElementById(primaryPhoneId+"~1");
			var target2 = document.getElementById(primaryPhoneId+"~2");
			var target3 = document.getElementById(primaryPhoneId+"~3");
			var target = document.getElementById(primaryPhoneId);
			{
				target1 = target1.value;
				target2 = target2.value;
				target3 = target3.value;
				if(!target1)
					target1 = "";
				if(target2)
					target1 += target2;
				if(target3)
					target1 += target3;
				target.value = target1;
			}
		}
	}
	function changeFieldsStatus(fieldNames,status)
	{
		var element;
		if(fieldNames)
		{
			if(status == false)
			{
				setMandatoryFields(fieldNames);
			}
			else
			{
				clearMandatoryFields(fieldNames);
			}
			for(var index =0 ; index < fieldNames.length;index++)
			{
				element = document.getElementById(fieldNames[index]);				
				element.disabled = status;
			}
		}
	}
	function clearValues(fieldsToClear)
	{
		var element = "";
		if(fieldsToClear)
		{
			for(var index =0; index < fieldsToClear.length;index++)
			{
				element = document.getElementById(fieldsToClear[index]);
				element.value = "";
			}
		}
	}
	function validateDateFormat(element)
	{
		if(element)
		{
			element.value = trim(element.value);
			if(element.value.length > 0)
			{
				var isValidDate = isDate(element.value,'mm/dd/yyyy');
				if(!isValidDate)
				{
					element.value="";
					var message = "Enter valid date \nDate format should be mm/dd/yyyy \nExample: for todays date enter "+formatDate(new Date(),'MM/dd/yyyy');
					alert(message);
				}
			}
		}
	}
	function displayProperties(element)
	{
		var properties = "";
		if(element)
		{
			for(var property in element)
			{
				properties += "\n"+property+" : "+element[property];
			}
		}
		return properties;			
	}	
	function setMandatoryFields(fieldNames)
	{
		if(fieldNames)
		{
			for(var index =0 ; index < fieldNames.length;index++)
			{
				element = document.getElementById(fieldNames[index]);
				if(element)
					element.style.backgroundColor="#FAFFBD";
			}
		}		
	}
	function copyValues(sourceFields,targetFields)
	{
		if(sourceFields && targetFields && sourceFields.length == targetFields.length)
		{
			var sourceelement ;
			var targetelement;
			for(var index =0 ; index < sourceFields.length;index++)
			{
				sourceelement = document.getElementById(sourceFields[index]);
				targetelement = document.getElementById(targetFields[index]);
				if(sourceelement && targetelement)
					targetelement.value=sourceelement.value;
			}
		}		
	}
	function clearMandatoryFields(fieldNames)
	{
		if(fieldNames)
		{
			for(var index =0 ; index < fieldNames.length;index++)
			{
				element = document.getElementById(fieldNames[index]);
				if(element)
					element.style.backgroundColor="#FFFFFF";
			}
		}		
	}
	//-->
	</script>
</head>

<body>
<div id="loadingDiv"  style="width:300px;height:200px;
background:#F0F0F0;filter:alpha(opacity=40);valign:middle;
-moz-opacity:.40;opacity:.40;position:absolute;z-index:100;text-align:center;display:none; margin:0 auto;color:#FF0000;text-align:center;" >
	<div style="font-weight:bold;font-size:17px;line-height:4"><img src="images/loading-wait.gif"/>Request Under process Please wait ....</div>	
	</div>	
	<div id="headerDiv">
		<tiles:insert attribute="header"/>
	</div>
	<div style="width:100%">
	<div id="leftPanel">
		<tiles:insert attribute="leftPanel"/>		
	</div>
	<div id="contentContainer">		
		<tiles:insert attribute="body"/>		
	</div>
	</div>
	<div id="footer" style="display:none">
		<tiles:insert attribute="footer"/>		
	</div>
<iframe width=174 height=189 name="gToday:normal:agenda.js" id="gToday:normal:agenda.js" src="calScripts/ipopeng.htm" scrolling="no" frameborder="0" style="visibility:visible; z-index:999; position:absolute; top:-500px; left:-500px;">
</iframe>
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