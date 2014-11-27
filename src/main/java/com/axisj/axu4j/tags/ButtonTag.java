package com.axisj.axu4j.tags;

import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.StringUtils;

import com.axisj.axu4j.config.ConfigReader;

public class ButtonTag extends AXUTagSupport {

	public ButtonTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getButtonBody();
	}
	
	// =======================================================

	private String id;
	private String buttonType = "button";
	private String text;
	private String css;
	private String style;
	private boolean isButton = true;
	private boolean isAnchor = false;
	private boolean isInput = false;

	// =======================================================
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getButtonType() {
		return buttonType;
	}

	public void setButtonType(String buttonType) {
		String[] buttonTypes = { "button", "input", "anchor" };

		if (!ArrayUtils.contains(buttonTypes, buttonType)) {
			throw new IllegalArgumentException(String.format("button tag buttonType only use button | input | anchor.[%s] is not available", buttonType));
		}

		this.buttonType = StringUtils.defaultIfBlank(buttonType, "button");

		this.isButton = StringUtils.equalsIgnoreCase("button", this.buttonType);
		this.isAnchor = StringUtils.equalsIgnoreCase("anchor", this.buttonType);
		this.isInput = StringUtils.equalsIgnoreCase("input", this.buttonType);
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
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

	public boolean isAnchor() {
		return isAnchor;
	}

	public boolean isInput() {
		return isInput;
	}

	public boolean isButton() {
		return isButton;
	}
}
