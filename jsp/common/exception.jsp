<script>
var errorMessage = "";
</script>
<logic:present name="exception">
	<logic:iterate>
		 <script>
		 	/*
		 		append all the exceptions
		 	*/
		 </script>
 	</logic:iterate>
	<script>
		alert(errorMessage);
	</script> 
</logic:present> 

       