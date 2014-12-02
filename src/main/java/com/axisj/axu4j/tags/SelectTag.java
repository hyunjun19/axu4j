package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class SelectTag extends AXUTagSupport {

	public SelectTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSelectBody();
	}

}
