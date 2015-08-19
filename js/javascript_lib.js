
var anchorContent = new Array();
var buttonAnchorContent = new Array();
var buttonInnerAnchorContent = new Array();
buttonInnerAnchorContent[0]="Add Assignments";
var expand= new Array();
		expand[0]="ex";
		expand[1]="close";
		expand[2]="close";
		expand[3]="close";
		expand[4]="ex";
		expand[5]="close";
		expand[6]="ex";
		expand[7]="close";
		expand[8]="close";
		expand[9]="close";
		expand[10]="ex";
		expand[11]="close";
var imagePath = "../global/images/";

// ****************************************
// *** cookie functions
// ****************************************

	function Set_Cookie(name,value,path)
	{
		var cookieValue = Get_Cookie(name);
		if (cookieValue != null) {
		if (cookieValue.indexOf(value) == -1) {
		cookieValue += "," + value;
		}
		else {
		return true;
		}	
		}
		else {
		cookieValue = value;
		}
		document.cookie = name + "=" +escape(cookieValue) +
		( (path) ? ";path=" + path : "");
	}
	
	//Removes all values from the cookie after closing all browsers so that the cookie doesn't leftover values.
	function Kill_Cookie(name,value,path) {
	var killCookie = Get_Cookie(name);
	killCookie = value;
			
    	document.cookie = name + "=" +escape(killCookie) +
        ( (path) ? ";path=" + path : "");
	return true;
	
	}
	
	//Gets the cookie that is keeping track of which child windows have been opened 
	function Get_Cookie(name)
	{
		var start = document.cookie.indexOf(name+"=");
		var len = start+name.length+1;
		if ((!start) && (name != document.cookie.substring(0,name.length))) return null;
		if (start == -1) return null;
		var end = document.cookie.indexOf(";",len);
		if (end == -1) end = document.cookie.length;
		return unescape(document.cookie.substring(len,end));
	}

// ****************************************
// *** window opening functions
// ****************************************
	//opens up a new window and names it. Then the parent window is named, and the child window is given focus 
	function openHelpWindow(url, appID, setParentName) {
		Set_Cookie("ceoChildWindow", appID, "/");
		//(screen.width >= 1024) ?  (WIDTH = 800) : (WIDTH = (screen.width / 1.55));
		//(screen.height >= 768) ?  (HEIGHT = 400) : (HEIGHT =(screen.height / 2));
		WIDTH = 525;
		HEIGHT = 450;
		thisWin = window.open(url, '13c', 'width=' + WIDTH + ',height=' + HEIGHT + ',top=100,left=200,toolbar=no,status=yes,menubar=no,scrollbars=yes,resizable=yes');
	}

	function openWindow(url, appID, setParentName, loaderTitleBarName) {
	   //Sets the cookie that remembers the windows being opened 
		Set_Cookie("ceoChildWindow", appID, "/");		
		var screen_width = screen.width;
		var screen_height = screen.height;
		var WIDTH = 0;
		var HEIGHT = 0;
		
		(screen_width >= 1024) ?  (WIDTH = 800) : (WIDTH = (screen_width / 1.28));
		(screen_height >= 768) ?  (HEIGHT = 400) : (HEIGHT =(screen_height / 1.92));

//		thisWin = window.open(url, appID, 'width=' + WIDTH + ',height=' + HEIGHT + ',top=10,left=10,toolbar=no,location=no,status=no,menubar=yes,scrollbars=yes,resizable=yes' + '');
		thisWin = window.open(url, appID, 'width=' + WIDTH + ',height=' + HEIGHT + ',top=10,left=10,toolbar=no,location=yes,status=no,menubar=yes,scrollbars=yes,resizable=yes' + '');
		thisWin.opener.name = setParentName;
	}

	function openTutorial(url, appID, setParentName) {
			//Sets the cookie that remembers the windows being opened 
			Set_Cookie("ceoChildWindow", appID, "/");
			thisWin = window.open(url, appID, "toolbar=no,location=no,menubar=no,status=no,scrollbars=no,height=600,width=800,resizable=no");
	}

	function openPopUp(url, appID, setParentName) {
		//Sets the cookie that remembers the windows being opened 
		Set_Cookie("ceoChildWindow", '13a', "/");
//		thisWin = window.open(url, appID, "toolbar=no,location=no,menubar=no,status=no,scrollbars=yes,height=500,width=590,top=20,left=20,resizable=yes");
		thisWin = window.open(url, appID, "toolbar=no,location=yes,menubar=no,status=no,scrollbars=yes,height=500,width=590,top=20,left=20,resizable=yes");
	}	


	// main content panel max width for 800x600 is 550px
	var isNeedsResize = "no";
	function panelWidthChecker() {
		if ((isNeedsResize) == "yes") {
			// get needed widths - needsResize and dataTable 
			var panelName = document.getElementById("needsResize");
			var panelWidth = panelName.offsetWidth;
			var tableName = document.getElementById("dataTable");
			var tableWidth = tableName.offsetWidth;
			var imageName = document.getElementById("panelWidth");
			// set updateImageWidth to panelWidth + 250 (left panel width plus padding)
			// FF needed more space as it interprets the width of the table inside dataTable differently 
			var FFadd = tableWidth - panelWidth;
			var updateImageWidth = panelWidth + FFadd + 250;
			imageName.width = updateImageWidth;
		}
	}

// ****************************************
// *** show/hide element(s) functions
// ****************************************
	// Intrapage Alert - close alert
	function closeAlert(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows) {
		// set variables
			// used in "replace all but active" loop 
			numActiveRow = stripCharsFromString(pvAlertName);
			NumRows = pvNumRows-1;

        // replace image tags with anchor tags in all rows 
		for(i=1;i<=NumRows;i++) {
				var w = 'LinkDiv'+i;
				document.getElementById(w).innerHTML = anchorContent[i];
		}

		document.getElementById(pvAlertName).style.display = "none";
		document.getElementById(pvFrameName).style.display = "none";
	}
	

	//pvLinkDiv is the object/picture of the measurement from pvId.
	function showLayer(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows, pvId, imgfile) {
		var imageId=document.getElementById(pvLinkDiv);
		//change made here because of relocate layer with multi calendars
		var divId=document.getElementById(pvId);
		if(pvAlertName.substring(0,10)=='ChooseDate')
		if(navigator.appName!="Microsoft Internet Explorer") {
		if(imageId.offsetParent.id!=null)
			if(imageId.offsetParent.id==pvId)
			{
				divId=document.getElementById(pvId);
			}
			else{
				if(imageId.offsetParent.id.substring(0,5)=='bodyw')
				{
					divId=document.getElementById(imageId.offsetParent.id);
					pvId=divId.id;
				}
				}
		}else{
		if(imageId.offsetParent.offsetParent.id!=null)
			if(imageId.offsetParent.offsetParent.id==pvId)
				divId=document.getElementById(pvId);
			else
				if(imageId.offsetParent.offsetParent.id.substring(0,5)=='bodyw')
				{
					divId=document.getElementById(imageId.offsetParent.offsetParent.id);
					pvId=divId.id;
				}
		}
		var widthdiv=0;
		for (var lx=0,ly=0;imageId.id!=pvId;lx+=imageId.offsetLeft,ly+=imageId.offsetTop,imageId=imageId.offsetParent);
			imageId=document.getElementById(pvLinkDiv);
		for (var mx=0,my=0;imageId!=null;mx+=imageId.offsetLeft,my+=imageId.offsetTop,imageId=imageId.offsetParent);
			// used in "replace all but active" loop 
			numActiveRow = stripCharsFromString(pvAlertName);
			NumRows = pvNumRows-1;
			// used to set styles
			AlertName = document.getElementById(pvAlertName);
			FrameName = document.getElementById(pvFrameName);
			iconheight=ly; 
			if(divId.offsetWidth>0)
				widthdiv=divId.offsetWidth;
			else
			widthdiv=divId.clientWidth;
			xLeft=widthdiv-lx-10;
			if(navigator.appName!="Microsoft Internet Explorer") {
				var browserheight=window.innerHeight;
				var scrto=document.body.scrollTop;
				var scrta=document.documentElement.scrollTop;
				if(scrto>scrta)
				var scrtop=scrto;
				else
				var scrtop=scrta;
			} else {
				var browserheight=document.documentElement.clientHeight;
				var scrtop=document.documentElement.scrollTop;
			}
		
		FrameName.style.top = ly+'px';
		AlertName.style.top = ly+'px';
		// replace anchor tags with image only in all rows 
		for(i=1;i<=NumRows;i++) {
			var w = 'LinkDiv'+i;
			anchorContent[i] = document.getElementById(w).innerHTML;
			document.getElementById(w).innerHTML = '<img src='+imgfile +' />';
		}
		
		
		// set styles
		FrameName.style.position = 'absolute';
		FrameName.style.left=lx+10+'px';
		FrameName.style.display = 'block';
		FrameName.style.zIndex = 70;
		AlertName.style.left=lx+10+'px';
		AlertName.style.display = 'block';
		AlertName.style.zIndex = 75;
		if(scrtop==0) {
			if((my+AlertName.offsetHeight)>browserheight){
				fixbodywid(divId.id);
				FrameName.style.top = iconheight-AlertName.offsetHeight+'px';
				AlertName.style.top = iconheight-AlertName.offsetHeight+'px';
			} else {
				
				fixbodywid(divId.id);
				FrameName.style.top = iconheight+15+'px';
				AlertName.style.top = iconheight+15+'px';
			}
		} else {
			if((my-scrtop+AlertName.offsetHeight)>browserheight){
				fixbodywid(divId.id);
				FrameName.style.top = iconheight-AlertName.offsetHeight+'px';
				AlertName.style.top = iconheight-AlertName.offsetHeight+'px';
			} else {
				fixbodywid(divId.id);
				FrameName.style.top = iconheight+15+'px';
				AlertName.style.top = iconheight+15+'px';
			}
		}
		
		if(lx+10+AlertName.offsetWidth>widthdiv){
			FrameName.style.left=lx+5-AlertName.offsetWidth+'px';
			AlertName.style.left=lx+5-AlertName.offsetWidth+'px';
		}
		FrameName.height = AlertName.offsetHeight;
		FrameName.width = AlertName.offsetWidth;
		FrameName.style.height = AlertName.offsetHeight;
		FrameName.style.width = AlertName.offsetWidth;
		
	}
	//fix the display of multi calendars in one page, fix works in IE and Firefox
	function fixbodywid(dId)
	{
		divArray = document.getElementsByTagName('div');
		for(i=0;i<divArray.length;i++)
		{
			if(divArray[i].className.substring(0,5)=='bodyw')
			{	
				if(divArray[i].className.substring(0,dId.length)==dId)
				divArray[i].style.zIndex=30;
				else
				divArray[i].style.zIndex=0;
			}
			if(divArray[i].id.substring(0,5)=='bodyw')
			{
				if(divArray[i].id==dId)
				divArray[i].style.zIndex=30;
				else
				divArray[i].style.zIndex=0;
			}
			
		}
	}
	// Intrapage Alert - open based on link; relatively positioned 
	function relocateLayer(pvAlertNameno,pvFrameNameno,pvLinkDivno,pvNumRows,pvId) {
		NumRows = pvNumRows-1;
		if(NumRows==-1){
			pvAlertName=pvAlertNameno;
			pvFrameName=pvFrameNameno;
			pvLinkDiv=pvLinkDivno;
			FrameName = document.getElementById(pvFrameName);

			if(FrameName!=null)
			if(FrameName.style.display=='block') {
				closeAlert(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows);
				showLayer(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows,pvId, imgfile);
			}
		} else
			for(j=1;j<=NumRows;j++){
				// used in "replace all but active" loop 
				pvAlertName=pvAlertNameno+j;
				pvFrameName=pvFrameNameno+j;
				pvLinkDiv=pvLinkDivno+j;
				numActiveRow = stripCharsFromString(pvAlertName);
				// used to set styles
				FrameName = document.getElementById(pvFrameName);
				if(FrameName!=null)
				if(FrameName.style.display=='block') {
					closeAlert(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows);
					showLayer(pvAlertName,pvFrameName,pvLinkDiv,pvNumRows,pvId, imgfile);
				}
		}
	}
	
	// Intrapage Alert - open based on link; horizontally and vertically centered 
	function openAlert(pvAlertName,pvFrameName) {
		doc=document;
		AlertName = doc.getElementById(pvAlertName);
		FrameName = doc.getElementById(pvFrameName);
		xMax=0;
		yMax=0;
		xLeft=0;
		yTop=0;

		if(doc.getElementById) {
			if(doc.documentElement&&doc.documentElement.clientHeight) {
				xMax=doc.documentElement.clientWidth;
				yMax=doc.documentElement.clientHeight;
			} else {
				xMax=(doc.all)?doc.body.clientWidth:window.innerWidth;
				yMax=(doc.all)?doc.body.clientHeight:window.innerHeight;
			}
		} else if(doc.layers) {
			xMax=window.innerWidth;
			yMax=window.innerHeight;
		}
		
		xLeft = ((xMax-290) / 2);
		yTop =((yMax-150) / 2);

		FrameName.style.position = 'absolute';
		FrameName.style.left = xLeft+'px';
		FrameName.style.top = yTop+'px';
		FrameName.style.zIndex = '50';
		FrameName.style.display = 'block';
		
		AlertName.style.left = xLeft+'px';
		AlertName.style.top = yTop+'px';
		AlertName.style.zIndex = '75';
		AlertName.style.display = 'block';

		FrameName.style.height = AlertName.offsetHeight;
		FrameName.style.width = AlertName.offsetWidth;
	}

	function showWebAccessRequired()
	{
		var element = document.getElementById('divPMIAgg');
		
		if(element.style.display == "none")
		{
			element.style.display="block";
		}
		else
		{
			element.style.display="none";
		}
		
	}

	function showWebAccess()
	{
		var element = document.getElementById('divPMIAgg');
		
			if(element.style.display == "none")
			{
				element.style.display="block";
			}
		
		
	}

	
	// used to show/hide divs by clicking on radio button; only one div active at a time 
	function displayDivs(divName,divParent) {
		var divArray = new Array();
		row = document.getElementById(divParent);
		row = row.getElementsByTagName('div');
	
		// add each DIV ID to the array 
		for(i=0; i<row.length; i++) {
			divArray[i] = row[i].id;
		}
	
		// remove empty value elements from the array, leaving only valid DIV IDs
		for(n=0; n<divArray.length; n++) {
			if(divArray[n]==''||divArray[n].substring(0,5)=='bodyw') {
				divArray.splice(n,1);
				n--;
			}
		}
	
		if (document.getElementById(divName).style.display=="") {
			document.getElementById(divName).style.display = "none";
			return
		}
	
		for (i=0;i<divArray.length;i++) {
			var divSub = document.getElementById(divArray[i]);
			divSub.style.display = "none";
		}
		document.getElementById(divName).style.display = "";
	}
	
	// used to show/hide divs by clicking checkbox; multiple divs can be active 
	function expandCheckboxDivs(divName,divParent) {
	// display handling
		var divArray = new Array();
		row = document.getElementById(divParent);
		row = row.getElementsByTagName('div');
	
		// add each DIV ID to the array
		for(i=0; i<row.length; i++) {
			divArray[i] = row[i].id;
		}
	
		// remove empty value elements from the array, leaving only valid DIV IDs
		for(n=0; n<divArray.length; n++) {
			if(divArray[n]=='') {
				divArray.splice(n,1);
				n--;
			}
		}
	
		if (document.getElementById(divName).style.display=="") {
			document.getElementById(divName).style.display = "none";
			return
		}
	
		document.getElementById(divName).style.display = "";
	}
	
	// used to show/hide divs by clicking on arrow image; multiple divs can be active 
	function expandDivs(divName,divImage,divParent) {
	// image handling
		collapse = 'false';
		expando = document.images[divImage].src;
		expandoArray = expando.split('arrow_collapse.gif');
		if(expandoArray.length > 1) {
			collapse = 'true';
			document.images[divImage].src = expandoArray[0]+'arrow_expand.gif';
		}
		if(collapse == 'false') {
			expandoArray = expando.split('arrow_expand.gif');
			document.images[divImage].src = expandoArray[0]+'arrow_collapse.gif';
		}
	// display handling
		var divArray = new Array();
		row = document.getElementById(divParent);
		row = row.getElementsByTagName('div');
	
		// add each DIV ID to the array
		for(i=0; i<row.length; i++) {
			divArray[i] = row[i].id;
		}
	
		// remove empty value elements from the array, leaving only valid DIV IDs
		for(n=0; n<divArray.length; n++) {
			if(divArray[n]=='') {
				divArray.splice(n,1);
				n--;
			}
		}
	
		if (document.getElementById(divName).style.display=="") {
			document.getElementById(divName).style.display = "none";
			return
		}
	
		document.getElementById(divName).style.display = "";
	}
	
		
		// specific function - used in /templates/06-forms_3b/ 
	function expandLSRRows(){
		var expandLSRDiv = new Array();
		var expandLSRImg = new Array();
		
		var openClose = document.getElementById("LSRColumnExpand").innerHTML;
		if(openClose == "Expand All Sections"){
			document.getElementById("LSRColumnExpand").innerHTML = "Collapse All Sections";
		}else{
			document.getElementById("LSRColumnExpand").innerHTML = "Expand All Sections";
			document.getElementById("ItemOne").style.display = "";
			document.images['img_ItemOne'].src = imagePath + "arrow_collapse.gif"
	
		}
			expandLSRDiv[0] = "ItemOne"; 
			expandLSRDiv[1] = "ItemTwo";    
		
			
			expandLSRImg[0] = "img_ItemOne";
			expandLSRImg[1] = "img_ItemTwo";

		
		
		for(var i=0;i<expandLSRDiv.length;i++){
			expDiv = document.getElementById("LSRColumnExpand").innerHTML;
			if(expDiv == "Collapse All Sections"){
				document.getElementById(expandLSRDiv[i]).style.display = "";
				document.getElementById("ItemOne").style.display = "";

				document.images.img_collapseExpand.src = imagePath + "icons/collapse.gif";
				//openClose = "open";
			} else {
				document.getElementById(expandLSRDiv[i]).style.display = "none";
				document.images.img_collapseExpand.src = imagePath + "icons/expand.gif";
			}
		}
		foo = document.getElementById("LSRColumnExpand").innerHTML;
		if(foo == "Collapse All Sections"){
			for(var i=0;i<expandLSRImg.length;i++){
				document.images[expandLSRImg[i]].src = imagePath + "arrow_collapse.gif";
				document.images['img_ItemOne'].src = imagePath + "arrow_collapse.gif"

			}
		} else {
			for(var i=0;i<expandLSRImg.length;i++){
				document.images[expandLSRImg[i]].src = imagePath + "arrow_expand.gif";
			}
		}
	}

		
	// specific function - used in /templates/06-forms_3b/ 
	function expandLSRChange(divId){
		var matchrule=true;
		expColLink = document.getElementById("LSRColumnExpand").innerHTML;
			if(expand[divId] == "ex")
				expand[divId] = "close";
			else
				expand[divId] = "ex";
			for(var i=0;i<6;i++){
				if(expand[i+6]!=expand[i]){
					matchrule=false;
					i=6;
				}
			}
				if(matchrule==true)
					document.getElementById("LSRColumnExpand").innerHTML = "Expand All Sections";
				else
					document.getElementById("LSRColumnExpand").innerHTML = "Collapse All Sections";
	}
	
	
	
	
	
	function expandAllRows(){
		var expandThisDiv = new Array();
		var expandThisImg = new Array();
		
		var openClose = document.getElementById("myColumnExpand").innerHTML;
		if(openClose == "Expand All Sections"){
			document.getElementById("myColumnExpand").innerHTML = "Collapse All Sections";
		}else{
			document.getElementById("myColumnExpand").innerHTML = "Expand All Sections";
			document.getElementById("ItemOne").style.display = "";
			document.images['img_ItemOne'].src = imagePath + "arrow_collapse.gif"
	
		}
			expandThisDiv[0] = "ItemOne"; 
			expandThisDiv[1] = "ItemTwo";    
			expandThisDiv[2] = "ItemThree";   
			
			expandThisImg[0] = "img_ItemOne";
			expandThisImg[1] = "img_ItemTwo";
			expandThisImg[2] = "img_ItemThree";
		
		
		for(var i=0;i<expandThisDiv.length;i++){
			expDiv = document.getElementById("myColumnExpand").innerHTML;
			if(expDiv == "Collapse All Sections"){
				document.getElementById(expandThisDiv[i]).style.display = "";
				document.getElementById("ItemOne").style.display = "";

				document.images.img_collapseExpand.src = imagePath + "icons/collapse.gif";
				//openClose = "open";
			} else {
				document.getElementById(expandThisDiv[i]).style.display = "none";
				document.images.img_collapseExpand.src = imagePath + "icons/expand.gif";
			}
		}
		foo = document.getElementById("myColumnExpand").innerHTML;
		if(foo == "Collapse All Sections"){
			for(var i=0;i<expandThisImg.length;i++){
				document.images[expandThisImg[i]].src = imagePath + "arrow_collapse.gif";
				document.images['img_ItemOne'].src = imagePath + "arrow_collapse.gif"

			}
		} else {
			for(var i=0;i<expandThisImg.length;i++){
				document.images[expandThisImg[i]].src = imagePath + "arrow_expand.gif";
			}
		}
	}
	
	
	

	

	function expandThisChange(divId){
		var matchrule=true;
		expColLink = document.getElementById("myColumnExpand").innerHTML;
			if(expand[divId] == "ex")
				expand[divId] = "close";
			else
				expand[divId] = "ex";
			for(var i=0;i<6;i++){
				if(expand[i+6]!=expand[i]){
					matchrule=false;
					i=6;
				}
			}
				if(matchrule==true)
					document.getElementById("myColumnExpand").innerHTML = "Expand All Sections";
				else
					document.getElementById("myColumnExpand").innerHTML = "Collapse All Sections";
	}

		

		
		
			function expandCollapseAllB(){
		var expandoDiv = new Array();
		var expandoImg = new Array();
		
		var openClose = document.getElementById("a_colExp").innerHTML;
		if(openClose == "Expand All Sections"){
			document.getElementById("a_colExp").innerHTML = "Collapse All Sections";
		}else{
			document.getElementById("a_colExp").innerHTML = "Expand All Sections";
			document.getElementById("UserInfo").style.display = "";
			document.images['img_UserInfo'].src = imagePath + "arrow_collapse.gif"
	
		}
		
		
			expandoDiv[0] = "UserInfo";
			expandoDiv[1] = "CardInfo";
			expandoDiv[2] = "MCCStrategy";
			expandoDiv[3] = "bookInfo";
			expandoDiv[4] = "Attachments";
			
			expandoImg[0] = "img_UserInfo";
			expandoImg[1] = "img_CardInfo";
			expandoImg[2] = "img_MCCStrategy";
			expandoImg[3] = "img_bookInfo";
			expandoImg[4] = "img_Attachments";
		
		
		
				for(var i=0;i<expandoDiv.length;i++){
			expDiv = document.getElementById("a_colExp").innerHTML;
			if(expDiv == "Collapse All Sections"){
				document.getElementById(expandoDiv[i]).style.display = "";
				document.getElementById("UserInfo").style.display = "";

				document.images.img_collapseExpand.src = imagePath + "icons/collapse.gif";
				//openClose = "open";
			} else {
				document.getElementById(expandoDiv[i]).style.display = "none";
				document.images.img_collapseExpand.src = imagePath + "icons/expand.gif";
			}
		}
		foo = document.getElementById("a_colExp").innerHTML;
		if(foo == "Collapse All Sections"){
			for(var i=0;i<expandoImg.length;i++){
				document.images[expandoImg[i]].src = imagePath + "arrow_collapse.gif";
				document.images['img_UserInfo'].src = imagePath + "arrow_collapse.gif"

			}
		} else {
			for(var i=0;i<expandoImg.length;i++){
				document.images[expandoImg[i]].src = imagePath + "arrow_expand.gif";
			}
		}
	}
	
	
	
	

	function expandChange(divId){
		var matchrule=true;
		expColLink = document.getElementById("a_colExp").innerHTML;
			if(expand[divId] == "ex")
				expand[divId] = "close";
			else
				expand[divId] = "ex";
			for(var i=0;i<6;i++){
				if(expand[i+6]!=expand[i]){
					matchrule=false;
					i=6;
				}
			}
				if(matchrule==true)
					document.getElementById("a_colExp").innerHTML = "Expand All Sections";
				else
					document.getElementById("a_colExp").innerHTML = "Collapse All Sections";
	}
	
	

	
	
	


// ****************************************
// *** misc functions
// ****************************************
	function openReportWindow() {
		var reportFileName = "";
		var reportFileLocation = "";
	
		for (var i = 0; i < document.form1.opt1.length; i++) {
			var element = document.form1.opt1[i];
			if (element.checked) {
				reportFileName = element.value;  //this assigns the radio button value (report name abbreviation).
				var reportNum = i + 1;
			}
		}
	
		if (!reportNum == true) {
			//make sure a report is selected 
			alert("Please choose a report");
		}
		else {
			//insert call to validation routine here 
	
			switch (reportFileName) {
				case "DepStat":
					reportFileLocation = "../report_depositstatus/";
					break;
				case "EODBal":
					reportFileLocation = "../report_eodbalance/";
					break;
				case "PMI":
					reportFileLocation = "../report_pmi/";
					break;
				case "PMIAgg":
					reportFileLocation = "../report_pmiagg/";
					break;
				case "GLAdj":
					reportFileLocation = "../report_gladj/";
					break;
			}
			//use standard function to open appropriate report
			openWindow(reportFileLocation,'13b','','');
		}
	}

	// select all or clear all drop-list items of passed element/action 
	function selectAllOptions(pvSelectName,pvAction) {
		lvSelectName = document.getElementById(pvSelectName)
		if (pvAction == "select") {
			lvAction = true;
		} else {
			lvAction = false;
		}

		// determine state of lvAction; if not "select", select all; if "clear", clear all
		if (lvAction == true) {
			with (lvSelectName) {
				for (var i=0; i < options.length; i++) {
					options[i].selected = true;
				}
			}
		} else {
			with (lvSelectName) {
				for (var i=0; i < options.length; i++) {
					options[i].selected = false;
				}
			}
		}
	}

	// select all checkboxes on passed form value 
	function selectAll(pvFormName) {
		lvFormName = document.getElementById(pvFormName);
		with (lvFormName) {
			for (var i=0; i < elements.length; i++) {
				if (elements[i].type == 'checkbox') {
					elements[i].checked = true;
				}
			}
		}
	}

	// clear all checkboxes on passed form value 
	function clearAll(pvFormName) {
		lvFormName = document.getElementById(pvFormName);
		with (lvFormName) {
			for (var i=0; i < elements.length; i++) {
				if (elements[i].type == 'checkbox') {
					elements[i].checked = false;
				}
			}
		}
	}

	// strip out numeric characters from string 
	function stripNumsFromString(pvString) {
		s = pvString;
		filteredValues = "1234567890";     // Characters stripped out
		var i;
		var returnString = "";
		for (i = 0; i < s.length; i++) {  // Search through string and append to unfiltered values to returnString.
			var c = s.charAt(i);
			if (filteredValues.indexOf(c) == -1) returnString += c;
		}
		return returnString;
	}

	// strip out characters from string 
	function stripCharsFromString(pvString) {
		s = pvString;
		filteredValues = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz";     // Characters stripped out
		var i;
		var returnString = "";
		for (i = 0; i < s.length; i++) {  // Search through string and append to unfiltered values to returnString.
			var c = s.charAt(i);
			if (filteredValues.indexOf(c) == -1) returnString += c;
		}
		return returnString;
	}


	// dhtml calendar - resize calling frame 
	function checksize(pvSetting, pvFrameName, pvimgid, numrows, pvdivid, imgfile) {
		todaysDate = new Date();
		todaysYear = todaysDate.getYear();

		if (todaysYear < 1900) {
			todaysYear = todaysYear + 1900;
		}

		todaysMonth = todaysDate.getMonth() + 1;
		lastMonth = todaysDate.getMonth();
		followingMonth = todaysDate.getMonth() + 2;
		todaysDay = todaysDate.getDate();
		document.cookie = "previousMonth="+lastMonth+";";
		document.cookie = "currentMonth="+todaysMonth+";";
		document.cookie = "nextMonth="+followingMonth+";";
		document.cookie = "currentYear="+todaysYear+";";
		
		showLayer( pvSetting, pvFrameName, pvimgid, numrows, pvdivid, imgfile);
	}


	// specific function - used in /templates/06-formsb_04/ (and similar)
	// copy values of form fields to one or many locations; heavily dependent on CSS classes on form fields 
	function copyText(pvCopySource,pvCopyLocation,pvElementType) {
		var txtSourceObject,txtSource,txtLocation;
		// get the class of the input fields to be copied to 
		txtLocation = new RegExp(pvCopyLocation);
	
		// grab all textboxes/textareas classed with passed location and update them 
		if ((pvElementType == "input") || (pvElementType == "textarea")) {
			// get text to copy 
			txtSourceObject = document.getElementById(pvCopySource);
			txtSource = txtSourceObject.value;
			var txtBoxes,i;
			txtBoxes = document.getElementsByTagName(pvElementType);
			//for (i in txtBoxes) {
			for(i=0;i<txtBoxes.length;i++){
				if(txtLocation.test(txtBoxes[i].className)) {
					txtBoxes[i].value = txtSource;
				}
			}
		} else if (pvElementType == "select") {
			// get selected item to copy 
			txtSourceObject = document.getElementById(pvCopySource);
			txtSource = txtSourceObject.selectedIndex;
			var optBoxes,i;
			optBoxes = document.getElementsByTagName(pvElementType);
			//for (i in optBoxes) {
			for(i=0;i<optBoxes.length;i++){
				if(txtLocation.test(optBoxes[i].className)) {
					optBoxes[i].selectedIndex = txtSource;
				}
			}
		}
	}


	function ApplyToAll() {
		// dump form values into array and loop through, setting values to pass to copyText function
		var arr=new Array();
		pvCopyLocation='';
		pvElementType='';
		
		for(i=1; i<9;i++)
			arr[i-1]=document.form1.elements[i].name;

		
		for(i=0; i<8; i++) {
			str=arr[i].substring(0, arr[i].length-1);
		
			expandoArray = str.split('txt');
			if(expandoArray.length > 1) {
				pvCopyLocation='CopyDown'+expandoArray[1];
				pvElementType='input';
			}
			expandoArray = str.split('txa');
			if(expandoArray.length > 1) {
				pvCopyLocation='CopyDown'+expandoArray[1];
				pvElementType='textarea';
			}
			expandoArray = str.split('sel');
			if(expandoArray.length > 1) {
				pvCopyLocation='CopyDown'+expandoArray[1];
				pvElementType='select';
			}
		// build above into string to be passed to the copyText function
			//copyText(pvCopySource,pvCopyLocation,pvElementType)
			copyText(arr[i],pvCopyLocation,pvElementType);
		}
	}

	
	function radiostylechange(id,radiovalue,anchorIdLeft,anchorIdRight){
		if(radiovalue == "no"){
			document.getElementById(id).getElementsByTagName('h2')[0].className = "No";
			document.getElementById(id).getElementsByTagName('table')[0].style.color = "#666";
			document.getElementById(id).getElementsByTagName('select')[0].style.color = "#666";
			document.getElementById(id).getElementsByTagName('select')[1].style.color = "#666";
			document.getElementById(id).getElementsByTagName('img')[0].src = imagePath + "icons/icon_arrow_grey_right.gif";
			document.getElementById(id).getElementsByTagName('img')[1].src = imagePath + "icons/icon_arrow_grey_left.gif";
			document.getElementById(id).getElementsByTagName('select')[0].disabled=true;
			document.getElementById(id).getElementsByTagName('select')[1].disabled=true;
			var h3object = document.getElementById(id).getElementsByTagName('h3')[0];
			if(h3object){
				h3object.style.color = "#666";
			}
			var pobject = document.getElementById(id).getElementsByTagName('p')[0];
			if(pobject){
				pobject.style.color = "#666";
			}
			
			document.getElementById(anchorIdRight).innerHTML="<img src="+document.getElementById(id).getElementsByTagName('img')[0].src+">";
			document.getElementById(anchorIdLeft).innerHTML="<img src="+document.getElementById(id).getElementsByTagName('img')[1].src+">";
			var aobject = document.getElementById(id).getElementsByTagName('a')[2];
			if(aobject){
				aobject.className = "dkgreyButton";
			}
			
		} else {
			document.getElementById(id).getElementsByTagName('h2')[0].className = "Yes";
			document.getElementById(id).getElementsByTagName('table')[0].style.color = "#000";
			document.getElementById(id).getElementsByTagName('select')[0].style.color = "#000";
			document.getElementById(id).getElementsByTagName('select')[1].style.color = "#000";
			document.getElementById(id).getElementsByTagName('img')[0].src = imagePath + "icons/icon_arrow_green_right.gif";
			document.getElementById(id).getElementsByTagName('img')[1].src = imagePath + "icons/icon_arrow_green_left.gif";

			document.getElementById(id).getElementsByTagName('select')[0].disabled=false;
			document.getElementById(id).getElementsByTagName('select')[1].disabled=false;			
			
			var h3object = document.getElementById(id).getElementsByTagName('h3')[0];
			if(h3object){
				h3object.style.color = "#000";
			}
			var pobject = document.getElementById(id).getElementsByTagName('p')[0];
			if(pobject){
				pobject.style.color = "#000";
			}
			
			var aobject = document.getElementById(id).getElementsByTagName('a')[2];
			if(aobject){
				aobject.className = "blueButton";
			}
			document.getElementById(anchorIdRight).innerHTML="<a href=\"javascript:void(0)\" onclick=\"moveDualList(document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[0].id+"'), document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[1].id+"'), false)\" onkeypress=\"moveDualList(document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[0].id+"'), document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[1].id+"'), false)\"><img src="+document.getElementById(id).getElementsByTagName('img')[0].src+" width=\"25\" height=\"22\" border=\"0\" alt=\"Move Right\" /></a>";
			document.getElementById(anchorIdLeft).innerHTML="<a href=\"javascript:void(0)\" onclick=\"moveDualList(document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[1].id+"'), document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[0].id+"'), false)\" onkeypress=\"moveDualList(document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[1].id+"'), document.getElementById('"+document.getElementById(id).getElementsByTagName('select')[0].id+"'), false)\"><img src="+document.getElementById(id).getElementsByTagName('img')[1].src+" width=\"25\" height=\"22\" border=\"0\" alt=\"Move Left\" /></a>";
		}
	}
	
	
	
	function disableRadioAnchor(id,anchorId){
		buttonInnerAnchorContent[0] = document.getElementById(anchorId).innerHTML;
		document.getElementById(id).innerHTML = "<a name=\"\"><span class=\"dkgreyButton\" id="+anchorId+">" + buttonInnerAnchorContent[0] + "</span></a>";
	}
	

	function enableRadioAnchor(id,anchorId){
		document.getElementById(anchorId).innerHTML = buttonInnerAnchorContent[0];
		document.getElementById(id).innerHTML = "<a href=\"#\" class=\"blueButton\" id="+anchorId+">" + buttonInnerAnchorContent[0] + "</a>";
	}
	
		
function openEditWindow(url, appID)
{
	var screen_width = screen.width;
	var screen_height = screen.height;
	var WIDTH = 0;
	var HEIGHT = 0;

	(screen_width >= 1024) ?  (WIDTH = 525) : (WIDTH = (screen_width / 2.1));
	(screen_height >= 768) ?  (HEIGHT = 275) : (HEIGHT =(screen_height / 2));

	thisWin = window.open(url, appID, 'width=' + WIDTH + ',height=' + HEIGHT + ',top=150,left=420,toolbar=no,status=yes,menubar=no,scrollbars=no,resizable=no' + '');

}
	


function ScrollableTable (tableEl, tableHeight, tableWidth) {

	this.initIEengine = function () {

		this.containerEl.style.overflowY = 'auto';
		if (this.tableEl.parentElement.clientHeight - this.tableEl.offsetHeight < 0) {
			this.tableEl.style.width = this.newWidth - this.scrollWidth +'px';
		} else {
			this.containerEl.style.overflowY = 'hidden';
			this.tableEl.style.width = this.newWidth +'px';
		}

		if (this.thead) {
			var trs = this.thead.getElementsByTagName('tr');
			for (x=0; x<trs.length; x++) {
				trs[x].style.position ='relative';
				trs[x].style.setExpression("top",  "this.parentElement.parentElement.parentElement.scrollTop + 'px'");
			}
		}

		if (this.tfoot) {
			var trs = this.tfoot.getElementsByTagName('tr');
			for (x=0; x<trs.length; x++) {
				trs[x].style.position ='relative';
				trs[x].style.setExpression("bottom",  "(this.parentElement.parentElement.offsetHeight - this.parentElement.parentElement.parentElement.clientHeight - this.parentElement.parentElement.parentElement.scrollTop) + 'px'");
			}
		}

		eval("window.attachEvent('onresize', function () { document.getElementById('" + this.tableEl.id + "').style.visibility = 'hidden'; document.getElementById('" + this.tableEl.id + "').style.visibility = 'visible'; } )");
	};


	this.initFFengine = function () {
		this.containerEl.style.overflow = 'hidden';
		this.tableEl.style.width = this.newWidth + 'px';

		var headHeight = (this.thead) ? this.thead.clientHeight : 0;
		var footHeight = (this.tfoot) ? this.tfoot.clientHeight : 0;
		var bodyHeight = this.tbody.clientHeight;
		var trs = this.tbody.getElementsByTagName('tr');
		if (bodyHeight >= (this.newHeight - (headHeight + footHeight))) {
			this.tbody.style.overflow = '-moz-scrollbars-vertical';
			for (x=0; x<trs.length; x++) {
				var tds = trs[x].getElementsByTagName('td');
				tds[tds.length-1].style.paddingRight += this.scrollWidth + 'px';
			}
		} else {
			this.tbody.style.overflow = '-moz-scrollbars-none';
		}

		var cellSpacing = (this.tableEl.offsetHeight - (this.tbody.clientHeight + headHeight + footHeight)) / 4;
		this.tbody.style.height = (this.newHeight - (headHeight + cellSpacing * 2) - (footHeight + cellSpacing * 2)) + 'px';

	};

	this.tableEl = tableEl;
	this.scrollWidth = 17;

	this.originalHeight = this.tableEl.clientHeight;
	this.originalWidth = this.tableEl.clientWidth;

	this.newHeight = parseInt(tableHeight);
	this.newWidth = tableWidth ? parseInt(tableWidth) : this.originalWidth;

	this.tableEl.style.height = 'auto';
	this.tableEl.removeAttribute('height');

	this.containerEl = this.tableEl.parentNode.insertBefore(document.createElement('div'), this.tableEl);
	this.containerEl.appendChild(this.tableEl);
	this.containerEl.style.height = this.newHeight + 'px';
	this.containerEl.style.width = this.newWidth + 'px';


	var thead = this.tableEl.getElementsByTagName('thead');
	this.thead = (thead[0]) ? thead[0] : null;

	var tfoot = this.tableEl.getElementsByTagName('tfoot');
	this.tfoot = (tfoot[0]) ? tfoot[0] : null;

	var tbody = this.tableEl.getElementsByTagName('tbody');
	this.tbody = (tbody[0]) ? tbody[0] : null;

	if (!this.tbody) return;

	if (document.all && document.getElementById && !window.opera) this.initIEengine();
	if (!document.all && document.getElementById && !window.opera) this.initFFengine();


}