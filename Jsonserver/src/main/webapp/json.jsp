<%
	StringBuilder sb = new StringBuilder();
	sb.append("[");
	sb.append("{\"name\" : \"dong\", \"age\" : 30},");
	sb.append("{\"name\" : \"song\", \"age\" : 50}");
	sb.append("]");
	String str = sb.toString();
	out.print(str);	
%>