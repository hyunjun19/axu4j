package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;
import org.apache.commons.lang.StringUtils;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.tagext.JspFragment;

public class RowTag extends AXUTagSupport {

	public RowTag() throws Exception {
		super();
	}
	
	// =======================================================

	private String id;
	private String css;
	private String style;

	// =======================================================
	
	public String getId() {
		return StringUtils.defaultIfEmpty(id, String.format("row-%d", tagIndex));
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
		DivTag divTag = (DivTag) findAncestorWithClass(this, DivTag.class);
		if (divTag == null) {
			throw new  IllegalStateException("row tag should be used in a div tag inside.");
		}

		this.tagBody = ConfigReader.getConfig().getRowWrap();
		this.doBody  = TagUtils.toString(fragment);
	}
	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }
	
}
