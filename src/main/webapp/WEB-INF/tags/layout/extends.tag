<%@	tag body-content="scriptless"
	pageEncoding="UTF-8"
	import="java.io.StringWriter"
%><%@ attribute name="name" required="true" rtexprvalue="true" description="/WEB-INF/layouts/{name}.jsp"
%><%
	ServletContext servletContext = ((PageContext) getJspContext()).getServletContext();
	String prefix = servletContext.getInitParameter("__AXU4J_LAYOUT_PRFIX__");
	String suffix = servletContext.getInitParameter("__AXU4J_LAYOUT_SUFFIX__");
	
	StringWriter ignoredWriter = new StringWriter();
	getJspBody().invoke(ignoredWriter); // ignore body text
	
	PageContext pageContext = (PageContext) getJspContext();
	try {
		pageContext.forward(prefix + name + suffix);
	} catch (ServletException e) {
		throw new RuntimeException(e.getMessage(), e);
	}
%>