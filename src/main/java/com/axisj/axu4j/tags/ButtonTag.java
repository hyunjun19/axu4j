package com.axisj.axu4j.tags;

import java.io.StringReader;

import javax.servlet.jsp.JspWriter;

import org.apache.commons.lang.StringUtils;
import org.simpleframework.xml.Attribute;

public class ButtonTag extends AXUTagSupport {
	public ButtonTag() throws Exception {
		super();
	}
	
	@Override
	public void writeHtml(JspWriter out) {
		mustacheHtml = mustacheFactory.compile(new StringReader(this.getBodyHtml()), this.getClass().getCanonicalName());
		mustacheHtml.execute(out, this);
	}
	
	//=======================================================
	
	@Attribute
	private String buttonType;
	private String css;
	private String text;
	private boolean isAnchorType;
	private boolean isInputType;
	private boolean isButtonType;
	
	public String getButtonType() {
		return buttonType;
	}

	public void setButtonType(String buttonType) {
		this.buttonType = buttonType;
		
		this.isAnchorType = StringUtils.equalsIgnoreCase("anchor", buttonType);
		this.isInputType  = StringUtils.equalsIgnoreCase("input",  buttonType);
		this.isButtonType = StringUtils.equalsIgnoreCase("button", buttonType);
	}

	public String getCss() {
		return css;
	}

	public void setCss(String css) {
		this.css = css;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public boolean isAnchorType() {
		return isAnchorType;
	}

	public boolean isInputType() {
		return isInputType;
	}

	public boolean isButtonType() {
		return isButtonType;
	}
	
}
