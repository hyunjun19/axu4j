package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class TabTag extends AXUTagSupport {

	public TabTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getTabBody();
	}

}
