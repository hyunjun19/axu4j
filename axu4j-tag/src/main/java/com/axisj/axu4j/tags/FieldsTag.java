package com.axisj.axu4j.tags;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.tagext.JspFragment;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class FieldsTag extends AXUTagSupport {

	public FieldsTag() throws Exception {
		super();
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
	@Override
	public void beforeDoTag(JspContext context, JspFragment fragment) {
		this.tagBody = ConfigReader.getConfig().getFieldsWrap();
		this.doBody  = TagUtils.toString(fragment);
	}
	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }
	
}
