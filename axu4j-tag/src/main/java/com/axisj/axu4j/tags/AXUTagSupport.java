package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;

public abstract class AXUTagSupport extends SimpleTagSupport implements DynamicAttributes {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
	protected static int tagIndex = 0;

	protected Mustache mustacheHtml;
	protected Logger   logger  = LoggerFactory.getLogger(getClass());
	protected String   tagBody = StringUtils.EMPTY;
	protected String   doBody  = StringUtils.EMPTY;
	protected Map<String, Object> innerInstance  = new LinkedHashMap<String, Object>();
    protected Map<String, Object> dynamicAttrMap = new LinkedHashMap<String, Object>();

    // mustache cache
    private static final Map<String, Mustache> mustacheCacheMap = new HashMap<String, Mustache>();



	public AXUTagSupport() throws Exception {
		super();
		tagIndex++;
	}

	// =======================================================

	public String getDoBody() {
		return doBody;
	}

	public void setDoBody(String doBody) {
		this.doBody = doBody;
	}

    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
        if (TagUtils.isELValue(value)) {
            value = TagUtils.getElValue(getJspContext(), TagUtils.getElName(value));
        }

        dynamicAttrMap.put(localName, value);
    }
	
	// =======================================================

	/**********************************
	 * override method region begin *
	 **********************************/
	/**
	 * override doTag method
	 */
	@Override
	public void doTag() throws JspException, IOException {
		try {
			JspContext  context     = getJspContext();
			JspFragment fragment    = getJspBody();
            PageContext pageContext = (PageContext) context;
			
            // invoke before event
			beforeDoTag(context, fragment);

            // 내장객체 추가
            innerInstance.put("param",   TagUtils.getRequestParameterMap(pageContext));
            innerInstance.put("request", TagUtils.getRequestAttributeMap(pageContext));
            innerInstance.put("session", TagUtils.getSessionAttributeMap(pageContext));
            innerInstance.put("cookie",  TagUtils.getCookieMap(pageContext));
            innerInstance.putAll(dynamicAttrMap);

            Object[]  params      = new Object[] { this, innerInstance };
            String    mustacheKey = getClass().getCanonicalName();
            AXUConfig config      = ConfigReader.getConfig();

            if (this instanceof CustomTag) {
                CustomTag customTag = (CustomTag) this;
                mustacheKey = mustacheKey + "#" + customTag.getCustomid();
            }

            mustacheHtml = mustacheCacheMap.get(mustacheKey);
            if (mustacheHtml == null) {
                mustacheHtml = mustacheFactory.compile(new StringReader(tagBody), mustacheKey);

                if (!StringUtils.equalsIgnoreCase("DEV", config.getMode())) {
                    mustacheCacheMap.put(mustacheKey, mustacheHtml);
                }
            }
            mustacheHtml.execute(context.getOut(), params);

            // invoke after event
			afterDoTag(context, fragment);
			
		} catch (Exception e) {
			logger.error(String.format("doTag is fail.\ntagBody: %s\nmustacheHtml: %s", tagBody, (mustacheHtml == null ? "null" : mustacheHtml.toString())), e);
		}

	}

	/**
	 * override toString method
	 */
	@Override
	public String toString() {
		if (mustacheHtml == null) { return StringUtils.EMPTY; }
		
		return mustacheHtml.execute(new StringWriter(), this).toString();
	}
	/**********************************
	 * override method region end *
	 **********************************/
	
	/**
	 * You can custom action before doTag
	 * 
	 * @param context JspContext
	 * @param fragment JspFragment
	 */
	public abstract void beforeDoTag(JspContext context, JspFragment fragment) throws IOException;
	
	/**
	 * You can custom action after doTag
	 * 
	 * @param context JspContext
	 * @param fragment JspFragment
	 */
	public abstract void afterDoTag(JspContext context, JspFragment fragment);
}
