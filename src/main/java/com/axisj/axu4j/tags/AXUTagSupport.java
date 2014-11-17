package com.axisj.axu4j.tags;

import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.simpleframework.xml.Element;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.axisj.axu4j.config.ConfigReader;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;

public abstract class AXUTagSupport extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
	protected static Mustache mustacheHtml;
	protected Logger logger = LoggerFactory.getLogger(getClass());
	
	protected AXUTagSupport() throws Exception {
		super();
		
		ConfigReader.load();
	}
	
	/**********************************
	 * properties region begin        *
	 **********************************/
	protected String id;
	@Element(data=true)
	protected String bodyHtml;
	/**********************************
	 * properties region end          *
	 **********************************/
	
	//=======================================================
	
	/**********************************
	 * abstract method region begin   *
	 **********************************/
	/**
	 * make and write HTML
	 * @param out
	 */
	public abstract void writeHtml(JspWriter out);
	/**********************************
	 * abstract method region end   *
	 **********************************/
	
	//=======================================================
	
	/**********************************
	 * override method region begin   *
	 **********************************/
	/**
	 * override doTag method
	 */
	@Override
	public void doTag() throws JspException, IOException {
		
		writeHtml(getJspContext().getOut());
		
		if (logger.isDebugEnabled()) { logger.debug(this.toString()); }
	}
	
	/**
	 * override toString method
	 */
	@Override
	public String toString() {
		return mustacheHtml.execute(new StringWriter(), this).toString();
	}
	/**********************************
	 * override method region end     *
	 **********************************/
	
	//=======================================================
	
	/**********************************
	 * getter & setter region begin   *
	 **********************************/
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getBodyHtml() {
		return bodyHtml;
	}

	public void setBodyHtml(String bodyHtml) {
		this.bodyHtml = bodyHtml;
	}
	/**********************************
	 * getter & setter region end     *
	 **********************************/
}
