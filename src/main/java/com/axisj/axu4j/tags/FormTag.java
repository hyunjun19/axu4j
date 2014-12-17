package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class FormTag extends AXUTagSupport {

	public FormTag() throws Exception {
		super();
		this.tagBody  = ConfigReader.getConfig().getFormWrap();
		this.isDoBody = true;
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
		return method;
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
	
}
