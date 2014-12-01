package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class SwitchTag extends AXUTagSupport {

	public SwitchTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSwitchBody();
	}
	
	// =======================================================

	private String label;
	private String id;
	private String name;
	private String value;
	private String style;

	// =======================================================
	
	public String getLabel() {
		return label;
	}
	public void setLabel(String label) {
		this.label = label;
	}
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
	public String getStyle() {
		return style;
	}
	public void setStyle(String style) {
		this.style = style;
	}
}
