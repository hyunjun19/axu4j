package com.axisj.axu4j.config;

import org.simpleframework.xml.Element;
import org.simpleframework.xml.Root;

import com.axisj.axu4j.tags.ButtonTag;

@Root(name="axu4j")
public class AXUConfig {
	@Element
	private ButtonTag buttonTag;

	
	
	public ButtonTag getButtonTag() {
		return buttonTag;
	}

	public void setButtonTag(ButtonTag buttonTag) {
		this.buttonTag = buttonTag;
	}
	
}
