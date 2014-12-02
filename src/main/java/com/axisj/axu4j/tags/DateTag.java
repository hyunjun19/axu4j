package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class DateTag extends AXUTagSupport {

	public DateTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getDateBody();
	}

}
