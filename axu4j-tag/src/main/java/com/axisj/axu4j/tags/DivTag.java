package com.axisj.axu4j.tags;

import javax.servlet.jsp.JspException;
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
        logger.debug("@@@@@@@@@@@@@ parent @@@@@@@@@@@@@");
        logger.debug("{}", getParent());
        logger.debug("@@@@@@@@@@@@@ parent @@@@@@@@@@@@@");

        LayoutTag layoutTag = (LayoutTag) findAncestorWithClass(this, LayoutTag.class);
        if (layoutTag == null) {
            throw new  IllegalStateException("div tag should be used in a layout tag inside.");
        }

        layoutTag.putDiv(name, TagUtils.toString(getJspBody()));
        logger.debug("div#%s put to layout#%s ", name, layoutTag.getName());
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
