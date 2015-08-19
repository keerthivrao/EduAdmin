
<html>
	<head> 
		<title>Credit USA customer Registration</title>
		<link href="../stylesheet/creditusa_inner.css" type="text/css" rel="stylesheet" />
	</head> 
	<body>
	<div class="formSubhead">List of Distributors </div><BR/>
	
	<div style="border:1px solid #A5B2BD;padding-top:10px;padding-bottom:5px;">
		<div class="boldItalic">Search Distributors</div>
		<div style="padding-left:5px">
			First Name : <input type="text" class="formTxt" value="">
		</div>	
		<div style="padding-left:5px">
			Last Name : <input type="text" class="formTxt" value="">
		</div>
		<div style="padding-left:30px">
			   Parent : <input type="text" class="formTxt" value="">
		</div>
		<div style="padding-left:50px">
			<Input type="button" value="Search" class="smallButton">
		</div>	
	</div>
	
	<form name="customerRegistration" action="distributorDetails.html" method="post">
	<table width="80%" cellpadding="0" cellspacing="0">
	<tr>
		<td>
			<TABLE class="tableBorder">
				<TR>
					<TH class="tableHeader">
						Distributor Name
					</TH>
					<TH class="tableHeader">
						Approved Status
					</TH>
					<TH  class="tableHeader">
						Parent 
					</TH>
					<TH  class="tableHeader">
						Joining Date
					</TH>
					<TH  class="tableHeaderLast">
						View/Edit Details
					</TH>

				</TR>				
				<TR>
					<TD class="tableData">
						Mike
					</TD>
					<TD class="tableData">
						Approved
					</TD>
					<TD  class="tableData">
						John1234
					</TD>
					<TD class="tableData">
						23/12/2006
					</TD>
					<TD class="tableDataLast">
						<input type="button" value="View Hierarchy" class="smallButton"  onclick="submitForm()">
					</TD>
				</TR>
				<TR>
					<TD class="tableData">
						Mike1
					</TD>
					<TD class="tableData">
						Approved
					</TD>
					<TD  class="tableData">
						John1
					</TD>
					<TD class="tableData">
						22/12/2006
					</TD>
					<TD class="tableDataLast">
						<input type="button" class="smallButton" value="View Hierarchy" onclick="submitForm()">
					</TD>
				</TR>
				<TR>
					<TD class="tableData">
						Mike2
					</TD>
					<TD class="tableData">
						Approved
					</TD>					
					<TD  class="tableData">
						John2
					</TD>
					<TD class="tableData">
						21/12/2006
					</TD>
					<TD class="tableDataLast">
						<input type="button" value="View Hierarchy" class="smallButton"  onclick="submitForm()">
					</TD>
				</TR>
				<TR>
					<TD class="tableData">
						Mike3
					</TD>
					<TD class="tableData">
						Approved
					</TD>					
					<TD  class="tableData">
						John3
					</TD>
					<TD class="tableData">
						20/12/2006
					</TD>
					<TD class="tableDataLast">
						<input type="button" value="View Hierarchy" class="smallButton"  onclick="submitForm()">
					</TD>
				</TR>
				<TR>
					<TD class="tableData">
						Mike4
					</TD>
					<TD class="tableData">
						Approved
					</TD>					
					<TD  class="tableData">
						John4
					</TD>
					<TD class="tableData">
						20/12/2006
					</TD>
					<TD class="tableDataLast">
						<input type="button" value="View Hierarchy" class="smallButton"  onclick="submitForm()">
					</TD>
				</TR>
				</TABLE>
		</td>
	</tr>
</table>
</form>
</body>
</html>
<script>
	var hierarchyWindow;
	function submitForm()
	{
		if(hierarchyWindow)
			hierarchyWindow.close();
		hierarchyWindow = window.open("distributorHierarchy.html","","width=400,height=350,resizable=no,location=no");
	}
</script>