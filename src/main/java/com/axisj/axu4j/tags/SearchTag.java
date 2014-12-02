package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class SearchTag extends AXUTagSupport {

	public SearchTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getSearchBody();
	}

}
