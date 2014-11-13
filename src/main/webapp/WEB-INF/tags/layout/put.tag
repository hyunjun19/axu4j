<%@	tag body-content="scriptless"
	pageEncoding="UTF-8"
	import="java.io.StringWriter,
			com.axisj.axu4j.utils.*,
			javax.servlet.jsp.tagext.*"
%><%@ attribute name="block" required="true"  rtexprvalue="true" description="block name to put"
%><%@ attribute name="type"  required="false" rtexprvalue="true" description="APPEND(default) | PREPEND | REPLACE"
%><%
	type = StringUtils.get(type, "APPEND");

	String bodyResult = StringUtils.EMPTY;
	StringWriter writer = new StringWriter();
	if (getJspBody() != null) {
		getJspBody().invoke(writer);
		bodyResult = writer.toString();
	}
	
	// pass to block.tag
	jspContext.setAttribute(String.format("__AXU_BLOCK_%s_CONTENTS__", block.toUpperCase()), bodyResult, PageContext.REQUEST_SCOPE);
	jspContext.setAttribute(String.format("__AXU_BLOCK_%s_TYPE__",     block.toUpperCase()), type,       PageContext.REQUEST_SCOPE);
%>