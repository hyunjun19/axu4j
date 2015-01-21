package com.axisj.axu4j.tags;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import java.io.IOException;

/**
 * div tag
 *
 * Created by HJ.Park on 2015-01-06.
 */
public class DivTag extends AXUTagSupport {

    public DivTag() throws Exception {
        super();
    }

    private String name;

    /**
     * override doTag method
     */
    @Override
    public void doTag() throws JspException, IOException {
        LayoutTag layoutTag = (LayoutTag) findAncestorWithClass(this, LayoutTag.class);
        if (layoutTag == null) {
            throw new  IllegalStateException("div tag should be used in a layout tag inside.");
        }

        layoutTag.putDiv(name, TagUtils.toString(getJspBody()));
        logger.debug("div#{} put to layout#{}", name, layoutTag.getName());
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	@Override
	public void beforeDoTag(JspContext context, JspFragment fragment) { }

	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }
}
