<%@	tag body-content="empty"
	description="AXInput. see http://dev.axisj.com/samples/AXInput/index.html"
	pageEncoding="UTF-8"
	import="com.axisj.axu4j.utils.*"
%><%@ attribute name="id" required="true"
%><%@ attribute name="name"
%><%@ attribute name="type" description="text(default) | radio | checkbox | number | switch | segment | slider | selector | date | pattern"
%><%@ attribute name="css"
%><%@ attribute name="value"
%><%@ attribute name="placeholder"
%><%@ attribute name="checked"  type="java.lang.Boolean"
%><%@ attribute name="readonly" type="java.lang.Boolean"
%><%@ attribute name="disabled" type="java.lang.Boolean"
%><%@ attribute name="jsonconfig"
%><%
	// type == number
	if (StringUtils.equals(type, "number")) {
		type = "tel";
		css  = StringUtils.append(css, "ez-number");
	
	// type == switch
	} else if (StringUtils.equals(type, "switch")) {
		type = "button";
		css  = StringUtils.append(css, "ez-switch");
	}
%><input id="<%=id%>"<%=StringUtils.appendAttr("name", name)%> type="<%=StringUtils.get(type)%>" class="AXInput<%=StringUtils.append(css)%>"<%=StringUtils.appendAttr("value", value)%><%=StringUtils.appendAttr("placeholder", placeholder)%><%=StringUtils.appendProp("checked", checked)%><%=StringUtils.appendProp("readonly", readonly)%><%=StringUtils.appendProp("disabled", disabled)%><%=StringUtils.appendAttr("data-jsonconfig", jsonconfig)%> />