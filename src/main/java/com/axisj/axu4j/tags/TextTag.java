package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class TextTag extends AXUTagSupport {

	public TextTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getTextBody();
	}

	// =======================================================

	private String id;
	private String name;
	private String value;
	private String css;
	private String placeholder;
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

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getPlaceholder() {
		return placeholder;
	}

	public void setPlaceholder(String placeholder) {
		this.placeholder = placeholder;
	}

	public String getStyle() {
		return style;
	}

	public void setStyle(String style) {
		this.style = style;
	}

}
