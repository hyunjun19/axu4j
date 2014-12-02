package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class SelectorTag extends AXUTagSupport {

	public SelectorTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSelectorBody();
	}

}
