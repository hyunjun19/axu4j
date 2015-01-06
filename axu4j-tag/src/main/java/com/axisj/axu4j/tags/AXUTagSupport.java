package com.axisj.axu4j.tags;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.axisj.axu4j.layout.BlockTagUtils;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public abstract class AXUTagSupport extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
	protected static int tagIndex = 0;

	protected Mustache mustacheHtml;
	protected Logger   logger   = LoggerFactory.getLogger(getClass());
	protected String   tagBody  = StringUtils.EMPTY;
	protected String   doBody   = StringUtils.EMPTY;
	protected boolean  isDoBody = false;
	

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
			if (isDoBody) {
				doBody = BlockTagUtils.getBodyResult(getJspBody());
			}
			
			mustacheHtml = mustacheFactory.compile(new StringReader(tagBody), getClass().getCanonicalName());
			mustacheHtml.execute(getJspContext().getOut(), this);
		} catch (Exception e) {
			logger.error(String.format("doTag is fail.\ntagBody: %s\nmustacheHtml: %s", tagBody, (mustacheHtml == null ? "null" : mustacheHtml.toString())), e);
		}

		if (logger.isDebugEnabled()) {
			logger.debug(this.toString());
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
}
