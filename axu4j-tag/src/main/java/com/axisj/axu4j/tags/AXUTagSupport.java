package com.axisj.axu4j.tags;

import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

public abstract class AXUTagSupport extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
	protected static int tagIndex = 0;

	protected Mustache mustacheHtml;
	protected Logger   logger  = LoggerFactory.getLogger(getClass());
	protected String   tagBody = StringUtils.EMPTY;
	protected String   doBody  = StringUtils.EMPTY;
	protected Map<String, Object> innerInstance = new HashMap<String, Object>();



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
			JspContext  context  = getJspContext();
			JspFragment fragment = getJspBody();
			
			beforeDoTag(context, fragment);

			mustacheHtml = mustacheFactory.compile(new StringReader(tagBody), getClass().getCanonicalName());

			LayoutTag layoutTag = (LayoutTag) findAncestorWithClass(this, LayoutTag.class);
			if (layoutTag == null) {
				mustacheHtml.execute(context.getOut(), this);
			} else {
				// 내장객체 추가
				innerInstance.put("param",   layoutTag.getRequestParameterMap());
				innerInstance.put("request", layoutTag.getRequestAttributeMap());
				innerInstance.put("session", layoutTag.getSessionAttributeMap());
				innerInstance.put("cookie",  layoutTag.getCookieMap());

				Object[] params = new Object[] { this, innerInstance };
				mustacheHtml.execute(getJspContext().getOut(), params);
			}


			afterDoTag(context, fragment);
			
		} catch (Exception e) {
			logger.error(String.format("doTag is fail.\ntagBody: %s\nmustacheHtml: %s", tagBody, (mustacheHtml == null ? "null" : mustacheHtml.toString())), e);
		}

//		if (logger.isDebugEnabled()) {
//			logger.debug(this.toString());
//		}
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
