package com.axisj.axu4j.config;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Root;

import com.axisj.axu4j.tags.ButtonTag;

@Root(name="axu4j")
public class AXUConfig {
	
	@Attribute
	private boolean realadable;
	
	@Element
	private ButtonTag buttonTag;

	//=======================================================
	
	public ButtonTag getButtonTag() {
		return buttonTag;
	}

	public boolean isRealadable() {
		return realadable;
	}

	public void setRealadable(boolean realadable) {
		this.realadable = realadable;
	}

	public void setButtonTag(ButtonTag buttonTag) {
		this.buttonTag = buttonTag;
	}
	
}
