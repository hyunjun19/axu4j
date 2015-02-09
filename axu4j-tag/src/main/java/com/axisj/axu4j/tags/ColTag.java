package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.tagext.JspFragment;

public class ColTag extends AXUTagSupport {
	
	public ColTag() throws Exception {
		super();
	}
	
	// =======================================================

	private String id;
	private String size;
	private String css;
	private String style;
    private String wrap;

	// =======================================================
	
	public String getId() {
		return StringUtils.defaultIfEmpty(id, String.format("col-%d", tagIndex));
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getSize() {
		return StringUtils.defaultIfEmpty(size, "12");
	}
	public void setSize(String size) {
		this.size = size;
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
    public String getWrap() {
        return BooleanUtils.toBoolean(StringUtils.defaultIfBlank(wrap, "true")) ? "true" : StringUtils.EMPTY;
    }
    public void setWrap(String wrap) {
        this.wrap = wrap;
    }

    @Override
	public void beforeDoTag(JspContext context, JspFragment fragment) {
		RowTag rowTag = (RowTag) findAncestorWithClass(this, RowTag.class);
		if (rowTag == null) {
			throw new  IllegalStateException("col tag should be used in a row tag inside.");
		}

		this.tagBody = ConfigReader.getConfig().getColWrap();
		this.doBody  = TagUtils.toString(fragment);
	}
	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }
	
}
