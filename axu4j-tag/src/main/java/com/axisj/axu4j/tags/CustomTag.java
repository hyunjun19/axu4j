package com.axisj.axu4j.tags;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.JspFragment;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by HJ.Park on 2015-01-30.
 */
public class CustomTag extends AXUTagSupport implements DynamicAttributes {

    private Map<String, Object> dynamicAttrMap = new LinkedHashMap<String, Object>();

    public CustomTag() throws Exception {
        super();
    }

    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
        if (TagUtils.isELValue(value)) {
            value = TagUtils.getElValue(getJspContext(), TagUtils.getElName(value));
        }

        dynamicAttrMap.put(localName, value);
    }

    @Override
    public void beforeDoTag(JspContext context, JspFragment fragment) { }

    @Override
    public void afterDoTag(JspContext context, JspFragment fragment) { }

}
