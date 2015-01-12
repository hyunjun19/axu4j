package com.axisj.axu4j.tags;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.tagext.JspFragment;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class FormTag extends AXUTagSupport {

	public FormTag() throws Exception {
		super();
	}

	// =======================================================

	private String id;
	private String name;
	private String action;
	private String method;
	private String css;
	private String style;

	// =======================================================
	
	public String getId() {
		return StringUtils.defaultIfEmpty(id, String.format("form-%d", tagIndex));
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return StringUtils.defaultIfEmpty(name, getId());
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAction() {
		return action;
	}
	public void setAction(String action) {
		this.action = action;
	}
	public String getMethod() {
		return StringUtils.defaultIfEmpty(method, "POST");
	}
	public void setMethod(String method) {
		this.method = method;
	}
	public String getCss() {
		return css;
	}
	public void setCss(String css) {
		this.css = css;
	}
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
	@Override
	public void beforeDoTag(JspContext context, JspFragment fragment) {
		this.tagBody = ConfigReader.getConfig().getFormWrap();
		this.doBody  = TagUtils.toString(fragment);
	}
	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }
	
}
