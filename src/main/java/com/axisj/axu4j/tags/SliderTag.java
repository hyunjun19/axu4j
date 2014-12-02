package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class SliderTag extends AXUTagSupport {

	public SliderTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSliderBody();
	}
	
}
