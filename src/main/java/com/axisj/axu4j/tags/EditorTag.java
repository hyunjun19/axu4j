package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

public class EditorTag extends AXUTagSupport {

	public EditorTag() throws Exception {
		super();
		this.tagBody = ConfigReader.getConfig().getEditorBody();
	}

}
