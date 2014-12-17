package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class FieldsTag extends AXUTagSupport {

	public FieldsTag() throws Exception {
		super();
		this.tagBody  = ConfigReader.getConfig().getFieldsWrap();
		this.isDoBody = true;
	}

	// =======================================================

	private String id;
	private String css;
	private String style;

	// =======================================================

	public String getId() {
		return StringUtils.defaultIfEmpty(id, String.format("fields-%d", tagIndex));
	}
	public void setId(String id) {
		this.id = id;
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
