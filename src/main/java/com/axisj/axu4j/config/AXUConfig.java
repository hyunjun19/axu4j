package com.axisj.axu4j.config;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Root;

@Root(name = "axu4j")
public class AXUConfig {

	@Attribute(required = false)
	private boolean realadable = false;

	@Element(name = "buttonTag")
	private String buttonTagBody;
	
	@Element(name = "inputTag")
	private String inputTagBody;

	// =======================================================

	public boolean isRealadable() {
		return realadable;
	}

	public void setRealadable(boolean realadable) {
		this.realadable = realadable;
	}

	public String getButtonTagBody() {
		return buttonTagBody;
	}

	public void setButtonTagBody(String buttonTagBody) {
		this.buttonTagBody = buttonTagBody;
	}

	public String getInputTagBody() {
		return inputTagBody;
	}

	public void setInputTagBody(String inputTagBody) {
		this.inputTagBody = inputTagBody;
	}

}
