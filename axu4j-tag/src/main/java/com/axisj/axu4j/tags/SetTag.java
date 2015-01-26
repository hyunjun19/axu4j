package com.axisj.axu4j.tags;

import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.el.ELException;
import javax.servlet.jsp.el.VariableResolver;
import javax.servlet.jsp.tagext.JspFragment;
import java.io.IOException;

/**
 * Created by HJ.Park on 2015-01-22.
 */
public class SetTag extends AXUTagSupport {

    public SetTag() throws Exception {
        super();
    }

    // =======================================================

    private String name;
    private Object value;
    private String scope;

    // =======================================================

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Object getValue() {
        return value;
    }

    public void setValue(Object value) {
        this.value = value;
    }

    public String getScope() {
        return StringUtils.defaultIfBlank(scope, "request");
    }

    public void setScope(String scope) {
        this.scope = scope;
    }

    /**
     * override doTag method
     */
    @Override
    public void doTag() throws JspException, IOException {
        LayoutTag layoutTag = (LayoutTag) findAncestorWithClass(this, LayoutTag.class);
        if (layoutTag == null) {
            throw new IllegalStateException("set tag should be used in a layout tag inside.");
        }

        if (TagUtils.isELValue(getValue())) {
            Object var = TagUtils.getElValue(getJspContext(), TagUtils.getElName(getValue()));
            if (var != null) {
                setValue(var);
            }
        }

        if (StringUtils.equalsIgnoreCase(getScope(), "request")) {
            layoutTag.putRequestAttribute(getName(), getValue());
        } else if (StringUtils.equalsIgnoreCase(getScope(), "session")) {
            layoutTag.putSessionAttribute(getName(), getValue());
        } else if (StringUtils.equalsIgnoreCase(getScope(), "cookie")) {
            layoutTag.putCookie(getName(), getValue());
        } else {
            throw new IllegalArgumentException(String.format("[%s] is undefined scope value", this.getScope()));
        }
    }

    @Override
    public void beforeDoTag(JspContext context, JspFragment fragment) { }

    @Override
    public void afterDoTag(JspContext context, JspFragment fragment) { }
}
