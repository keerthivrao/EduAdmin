<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
 <HEAD>
  <TITLE> Contact Form </TITLE>
  <META NAME="Generator" CONTENT="EditPlus">
  <META NAME="Author" CONTENT="">
  <META NAME="Keywords" CONTENT="">
  <META NAME="Description" CONTENT="">
  <link href="<%=request.getContextPath()%>/stylesheet/creditusa.css" type="text/css" rel="stylesheet" />
 </HEAD>

 <BODY>
 <form name="contactform" action="contactRequest.do">
  <div style="padding-left:15px">
	<div class="formSubhead">Contact Form</div><BR/>
  <table width="100%" cellpadding="0" cellspacing="0" border="0" class="table">
<thead>
<tr>
<td width="30%">
</td>
<td width="70%"> 
</td>
</tr>
</thead>
<tr class="labelTxt"><td nowrap="nowrap">Topic</td><td>
<select name="exTopic" class="formSelect" style="background:#FAFFBD">
<option>Please select</option>
<option>General inquiries</option>
<option>Join As Distributor</option>
<option>Other</option>
</select> <br>
</td></tr>
<tr class="labelTxt"><td nowrap="nowrap">Your Name</td><td><input name="exName" size="30" maxlength="64" value="" class="unspecifiedWidthMandatoryTxt" type="text"> </td></tr>
<tr class="labelTxt"><td nowrap="nowrap">E-mail Address</td><td><input name="exEmail" class="unspecifiedWidthMandatoryTxt" size="30" maxlength="64" value="" type="text"> </td></tr>
<tr class="labelTxt"><td nowrap="nowrap">Company</td><td><input name="exCompany" size="30" class="unspecifiedWidthTxt" maxlength="50" value="" type="text"> </td></tr>
<tr class="labelTxt"><td nowrap="nowrap">Phone</td><td><input name="exPhone" size="30" class="unspecifiedWidthTxt" maxlength="50" value="" type="text"> </td></tr>
<tr class="labelTxt"><td valign="top">Message</td><td><textarea name="exMessage" class="formMandatoryTxtArea" rows="8" cols="45"></textarea> <br></td></tr>
<tr class="labelTxt"><td>&nbsp;</td><td style="padding-top:5px;" align="center"><input class="largeButton" value="Send Message" type="button" onclick="alert('Your request will be processed, \n a member from Credit USA will contact you soon!');self.close();"></td></tr>

  </TABLE>
  <input type="hidden" name="acode" value="99999"/>
  </div>
  </form>
 </BODY>
</HTML>
