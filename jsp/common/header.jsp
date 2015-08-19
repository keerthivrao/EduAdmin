<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<div id="topBanner"><div style="margin-left:10px">Credit USA</div></div>
<div id="messageBar"><div style="margin-left:10px">
Welcome
<logic:present name="user" scope="session">

 <bean:write name="user" property="firstname" /> <bean:write name="user" property="lastname" /> - [<bean:write name="user" property="role" />]
 </logic:present>

<div style="text-align:right;display:inline;"><a href="login.jsp?action=logout" >Logout </a></div>
</div>
</div>