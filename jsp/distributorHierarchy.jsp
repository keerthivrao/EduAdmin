<%@ taglib uri="/WEB-INF/tld/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/tld/struts-html.tld" prefix="html" %>
<%@ taglib uri="/WEB-INF/tld/struts-logic.tld" prefix="logic" %>
<%@ taglib uri="/WEB-INF/tld/struts-tiles.tld" prefix="tiles" %>
<%@ page import="java.util.*"%>
<%@ page import="com.creditusa.model.Node"%>
<%@ page import="com.creditusa.model.DistributorDTO"%>
<html>
	<body>
	<div class="formSubhead">Distributors Hierarchy </div><BR/>
	<div>
	<table width="100%">
	<tr>
	<td width="75%">
	<div style="text-align:left;">
	
	<%!
	private boolean initial = true;
	private void displayDistributorTree(JspWriter out,com.creditusa.model.Node distributorNode) 
	{
        
        try{
        java.util.List reportingMembersTree = distributorNode.getReportingDistributors();
        System.out.println(reportingMembersTree);
        int reportingMembersCount = 0;
        String reportingMemberId = null;   
        displayDistributor(out,distributorNode);
        
        if(reportingMembersTree != null)
        {
        	reportingMembersCount = reportingMembersTree.size();
        	DistributorDTO distributorDTO = distributorNode.getDistributorDTO();
        	initiateChildDistributorsDisplay(out,distributorDTO.getDistributorid(),distributorDTO.getDistributorid());
        	for(int index =0;index<reportingMembersCount;index++)
        	{
        		Node currentDistributorNode = (Node) reportingMembersTree.get(index);
        		if(currentDistributorNode != null)
        		{
        			displayDistributorTree(out,currentDistributorNode);
        		}
        	}
        	closeChildDistributorsDisplay(out);
        }
        }
        catch(Exception e)
        {
        System.out.println(e);
        }
	} 
	private void displayDistributor(JspWriter out,Node distributorNode) throws Exception
	{
		DistributorDTO distributorDTO = distributorNode.getDistributorDTO();
		if(distributorDTO != null)
		{
			String distributorName = distributorDTO.getFirstname();
			String distributorId = distributorDTO.getDistributorid();
			String realizedCommissions = distributorDTO.getRealizedcommisions();
			if(realizedCommissions == null || "".equals(realizedCommissions))
			{
				realizedCommissions = "0";
			}
			out.println("<DIV style='padding-top:4px;'>");
			if(initial)
			{
				out.println("<img src='images/icon_collapse.gif' name='sample2img' width='9' height='9' border='0' align='absmiddle' onclick='showHide("+"\""+distributorId+"\""+")' id='"+distributorId+"img'/>");
			}
			else
			{
				out.println("<img src='images/icon_expand.gif' name='sample2img' width='9' height='9' border='0' align='absmiddle' onclick='showHide("+"\""+distributorId+"\""+")' id='"+distributorId+"img'/>");
			}
			out.println("<a href='javascript:void(0)' onclick='showHide("+"\""+distributorId+"\""+")'>"+distributorName+"</a> ( $"+realizedCommissions+" )</DIV>");
		}

	}
	private void initiateChildDistributorsDisplay(JspWriter out,String distributorId,String parent) throws Exception
	{

		if(initial)
		{
			out.println("<div class='menuImg' id='"+parent+"' style='padding-left:15px;valign:top;position:relative'>");
			initial = false;
		}
		else
		{
			out.println("<div class='menuImg' id='"+parent+"' style='padding-left:15px;display:none;valign:top;position:relative'>");
		}
	}	
	private void closeChildDistributorsDisplay(JspWriter out) throws Exception
	{
		out.println("</div>");
	}
	
	%>
	

						<logic:present name="distributorTree">
							
							<%
							initial = true;
							displayDistributorTree(out,(com.creditusa.model.Node)request.getAttribute("distributorTree"));%>							
							
						</logic:present>
					</div>	
					</td>
					<td valign="top" width="25%">
					<div>
					<%
					initial = true;
					
					displayDistributorTreeDetails(out,(com.creditusa.model.Node)request.getAttribute("distributorTree"));%>
					<%!
						private String preSelectedDistributor="";
						private void displayDistributorTreeDetails(JspWriter out,com.creditusa.model.Node distributorNode) 
	{
        
        try{
        java.util.List reportingMembersTree = distributorNode.getReportingDistributors();
        int reportingMembersCount = 0;
        String reportingMemberId = null; 
        DistributorDTO distributorDTO = distributorNode.getDistributorDTO();
        displayDistributorDetails(out,distributorDTO);  
	    if(reportingMembersTree != null)
        {
        	reportingMembersCount = reportingMembersTree.size();
        	
        	for(int index =0;index<reportingMembersCount;index++)
        	{
        		Node currentDistributorNode = (Node) reportingMembersTree.get(index);
        		if(currentDistributorNode != null)
        		{
        			displayDistributorTreeDetails(out,currentDistributorNode);
        		}
        	}
        }
        }
        catch(Exception e)
        {
        System.out.println(e);
        }
	}
						
						private void displayDistributorDetails(JspWriter out,DistributorDTO distributorDTO) throws Exception
	{
			if(initial)
			{
				preSelectedDistributor = distributorDTO.getDistributorid();
				out.println("<div id='"+distributorDTO.getDistributorid()+"_details' style='padding-left:15px;'>");
			}
			else
			{
				out.println("<div id='"+distributorDTO.getDistributorid()+"_details' style='padding-left:15px;display:none;'>");
			}
			initial = false;
			out.println("<DIV><span class='labelHeader'>Name : </span><span class=''>"+distributorDTO.getFirstname()+" "+distributorDTO.getMiddlename()+""+distributorDTO.getLastname()+"</span></DIV>");
			out.println("<DIV><span class='labelHeader'>Status : </span><span class=''>"+distributorDTO.getApprovalstatus()+"</span></DIV>");
			out.println("<DIV><span class='labelHeader'>Loginid : </span><span class=''>"+distributorDTO.getLoginid()+"</span></DIV>");
			if("C".equals(distributorDTO.getType()))
				out.println("<DIV><span class='labelHeader'>Type : </span><span class=''>Company</div>");
			else if("I".equals(distributorDTO.getType()))
				out.println("<DIV><span class='labelHeader'>Type : </span><span class=''>Individual</div>");
			out.println("<DIV><span class='labelHeader'>SSN : </span><span class=''>"+distributorDTO.getSsn()+"</span></DIV>");
			out.println("</div>");
	}
	%>
					</div>									
					</td>
					</tr>
					</table>
	</div>
</body>
</html>
		   <script>
		   var previouslySelected = '<%=preSelectedDistributor%>';
		   function showHide(objId)
			{
				var ele = document.getElementById(objId);
				if(ele != null)
				{
					if(ele.style.display != 'none')
						ele.style.display = 'none';
					else
						ele.style.display = 'block';
				}
				var img = document.getElementById(objId + 'img');
				if((img != null) && (img.src != null))
				{
					if(img.src.indexOf('expand') > -1)
						img.src = img.src.replace('expand','collapse');
					else
						img.src = img.src.replace('collapse','expand');
				}
				
				if(previouslySelected && previouslySelected != objId)
				{
					
					ele = document.getElementById(previouslySelected+"_details");
					if(ele != null)
					{
						ele.style.display = 'none';
					}
				}				
				ele = document.getElementById(objId+"_details");
				
				if(ele != null && previouslySelected != objId)
				{
					if(ele.style.display != 'none')
						ele.style.display = 'none';
					else
						ele.style.display = 'block';
				}	
				previouslySelected = objId;				
			}
			function showHideDetails(objId)
			{
				if(previouslySelected && previouslySelected != objId)
				{
					
					ele = document.getElementById(previouslySelected+"_details");
					if(ele != null)
					{
						ele.style.display = 'none';
					}
				}				
				ele = document.getElementById(objId+"_details");
				
				if(ele != null && previouslySelected != objId)
				{
					if(ele.style.display != 'none')
						ele.style.display = 'none';
					else
						ele.style.display = 'block';
				}	
				previouslySelected = objId;
			}
			</script>