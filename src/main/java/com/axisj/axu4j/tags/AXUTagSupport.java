package com.axisj.axu4j.tags;

import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public abstract class AXUTagSupport extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
	protected Mustache mustacheHtml;
	protected String tagBody;
	protected Logger logger = LoggerFactory.getLogger(getClass());

	protected AXUTagSupport() throws Exception {
		super();
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

		mustacheHtml = mustacheFactory.compile(new StringReader(tagBody), getClass().getCanonicalName());
		mustacheHtml.execute(getJspContext().getOut(), this);

		if (logger.isDebugEnabled()) {
			logger.debug(this.toString());
		}
	}

	/**
	 * override toString method
	 */
	@Override
	public String toString() {
		return mustacheHtml.execute(new StringWriter(), this).toString();
	}
	/**********************************
	 * override method region end *
	 **********************************/
}
