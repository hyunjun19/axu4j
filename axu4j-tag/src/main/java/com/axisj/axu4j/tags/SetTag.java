package com.axisj.axu4j.tags;

import org.apache.commons.lang.StringUtils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
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
        PageContext         pageContext = (PageContext) getJspContext();
        HttpServletRequest  request     = (HttpServletRequest) pageContext.getRequest();
        HttpServletResponse response    = (HttpServletResponse) pageContext.getResponse();
        HttpSession         session     = request.getSession();


        if (TagUtils.isELValue(getValue())) {
            Object var = TagUtils.getElValue(getJspContext(), TagUtils.getElName(getValue()));
            if (var != null) {
                setValue(var);
            }
        }

        if (StringUtils.equalsIgnoreCase(getScope(), "request")) {
            request.setAttribute(getName(), getValue());
        } else if (StringUtils.equalsIgnoreCase(getScope(), "session")) {
            session.setAttribute(getName(), getValue());
        } else if (StringUtils.equalsIgnoreCase(getScope(), "cookie")) {
            response.addCookie(new Cookie(getName(), TagUtils.getCookieValue(getValue())));
        } else {
            throw new IllegalArgumentException(String.format("[%s] is undefined scope value", this.getScope()));
        }
    }

    @Override
    public void beforeDoTag(JspContext context, JspFragment fragment) { }

    @Override
    public void afterDoTag(JspContext context, JspFragment fragment) { }
}
