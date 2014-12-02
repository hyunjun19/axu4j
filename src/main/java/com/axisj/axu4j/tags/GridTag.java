package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class GridTag extends AXUTagSupport {

	public GridTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getGridBody();
	}

}
