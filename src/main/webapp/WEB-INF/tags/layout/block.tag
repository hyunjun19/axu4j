<%@	tag body-content="scriptless"
	pageEncoding="UTF-8"
	import="java.io.StringWriter,
			com.axisj.axu4j.utils.*,
			javax.servlet.jsp.tagext.*"
%><%@ attribute name="name" required="true" rtexprvalue="true" description="block name"
%><%
	String bodyResult = StringUtils.EMPTY;
	StringWriter writer = new StringWriter();
	if (getJspBody() != null) {
		getJspBody().invoke(writer);
		bodyResult = writer.toString();
	}
	
	String putType     = (String)jspContext.findAttribute(String.format("__AXU_BLOCK_%s_TYPE__",     name.toUpperCase()));
	String putContents = (String)jspContext.findAttribute(String.format("__AXU_BLOCK_%s_CONTENTS__", name.toUpperCase()));
	
	if (StringUtils.equals(putType, "APPEND")) {
		out.write(bodyResult);
		out.write(putContents);
	} else if (StringUtils.equals(putType, "PREPEND")) {
		out.write(putContents);
		out.write(bodyResult);
	} else if (StringUtils.equals(putType, "REPLACE")) {
		out.write(putContents);		
	} else {
		throw new RuntimeException(String.format("put tag's [type=\"%s\"] is undefined", putType));
	}
%>