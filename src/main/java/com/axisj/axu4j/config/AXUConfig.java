package com.axisj.axu4j.config;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Path;
import org.simpleframework.xml.Root;

@Root(name = "axu4j")
public class AXUConfig {

	@Attribute(required = false)
	private boolean realadable = false;

	@Path("button[1]")
	@Element(name = "body", data = true)
	private String buttonBody;

	@Path("text[1]")
	@Element(name = "body", data = true)
	private String textBody;

	@Path("number[1]")
	@Element(name = "body", data = true)
	private String numberBody;

	@Path("switch[1]")
	@Element(name = "body", data = true)
	private String switchBody;

	@Path("segment[1]")
	@Element(name = "body", data = true)
	private String segmentBody;

	// =======================================================

	public boolean isRealadable() {
		return realadable;
	}

	public void setRealadable(boolean realadable) {
		this.realadable = realadable;
	}

	public String getButtonBody() {
		return buttonBody;
	}

	public void setButtonBody(String buttonBody) {
		this.buttonBody = buttonBody;
	}

	public String getTextBody() {
		return textBody;
	}

	public void setTextBody(String textBody) {
		this.textBody = textBody;
	}

	public String getNumberBody() {
		return numberBody;
	}

	public void setNumberBody(String numberBody) {
		this.numberBody = numberBody;
	}

	public String getSwitchBody() {
		return switchBody;
	}

	public void setSwitchBody(String switchBody) {
		this.switchBody = switchBody;
	}

	public String getSegmentBody() {
		return segmentBody;
	}

	public void setSegmentBody(String segmentBody) {
		this.segmentBody = segmentBody;
	}

}
