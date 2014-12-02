package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class PatternTag extends AXUTagSupport {

	public PatternTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getPatternBody();
	}

}
