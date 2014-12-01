package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class SegmentTag extends AXUTagSupport {

	public SegmentTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSegmentBody();
	}
	
	// =======================================================

	private String id;
	private String name;
	private String css;
	private String style;

	// =======================================================

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return StringUtils.defaultIfBlank(name, id);
	}
	public void setName(String name) {
		this.name = name;
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
