package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class TreeTag extends AXUTagSupport {

	public TreeTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getTreeBody();
	}

}
