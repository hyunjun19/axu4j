package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class Upload5Tag extends AXUTagSupport {

	public Upload5Tag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getUpload5Body();
	}

}
