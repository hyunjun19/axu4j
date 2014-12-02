package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class ModalTag extends AXUTagSupport {

	public ModalTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getModalBody();
	}

}
