package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.JspFragment;
import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * layout tag
 *
 * Created by HJ.Park on 2015-01-06.
 */
public class LayoutTag extends AXUTagSupport {

	public LayoutTag() throws Exception {
		super();
	}

	private Map<String, String> divMap    = new HashMap<String, String>();
	private Map<String, Object> globalMap = new HashMap<String, Object>();
	private Map<String, Object> requestParameterMap = new HashMap<String, Object>();
	private Map<String, Object> requestAttributeMap = new HashMap<String, Object>();
	private Map<String, Object> sessionAttributeMap = new HashMap<String, Object>();
	private Map<String, Object> cookieMap = new HashMap<String, Object>();

	private String name;
	private String key;

	/**
	 * override doTag method
	 */
	@Override
	public void doTag() throws JspException, IOException {
		StringWriter dummy = new StringWriter();
		getJspBody().invoke(dummy); // invoke body tags. like div, row, col...

		PageContext        pageContext = (PageContext) getJspContext();
		HttpServletRequest request     = (HttpServletRequest) pageContext.getRequest();
		
		// set global parameter
		globalMap.put("__AXU4J_CONTEXT_PATH__", request.getContextPath());

		// param
		String attrName;
		Enumeration reqParams = request.getParameterNames();
		while(reqParams.hasMoreElements()) {
			attrName = (String)reqParams.nextElement();
			String[] values = request.getParameterValues(attrName);
			if (values.length == 1) {
				requestParameterMap.put(attrName, values[0]);
			} else {
				requestParameterMap.put(attrName, values);
			}
		}
		globalMap.put("param", requestParameterMap);

		// request
		Enumeration reqAttrs = request.getAttributeNames();
		while(reqAttrs.hasMoreElements()) {
			attrName = (String)reqAttrs.nextElement();
			requestAttributeMap.put(attrName, request.getAttribute(attrName));
		}
		globalMap.put("request", requestAttributeMap);

		// session
		HttpSession session  =  request.getSession();
		Enumeration sesAttrs = request.getSession().getAttributeNames();
		while (sesAttrs.hasMoreElements()) {
			attrName = (String)sesAttrs.nextElement();
			sessionAttributeMap.put(attrName, session.getAttribute(attrName));
		}
		globalMap.put("session", sessionAttributeMap);

		// cookie
		Cookie[] cookies = request.getCookies();
		for (int ci = 0; ci < cookies.length; ci++) {
			cookieMap.put(cookies[ci].getName(), cookies[ci].getValue());
		}
		globalMap.put("cookie", cookieMap);

		Reader layoutFileReader = null;
		try {
			AXUConfig config = ConfigReader.getConfig();
			layoutFileReader = new BufferedReader(new InputStreamReader(new FileInputStream(this.getLayoutFile()), config.getLayoutEncoding()));

			mustacheHtml = mustacheFactory.compile(layoutFileReader, key);
			
			Object[] params = new Object[] { divMap, globalMap };
			mustacheHtml.execute(getJspContext().getOut(), params);

		} catch (Exception e) {
			logger.error(String.format("LayoutTag is fail.\nname: %s\ndivMap: %s", name, divMap), e);
		} finally {
			if (layoutFileReader != null) {
				layoutFileReader.close();
			}
		}

		if (logger.isDebugEnabled()) {
			logger.debug(this.toString());
		}
	}

	private File getLayoutFile() throws JspException {
		ServletContext servletContext = ((PageContext) getJspContext()).getServletContext();
		AXUConfig config = ConfigReader.getConfig();
		String prefix = config.getLayoutPrefix();
		String suffix = config.getLayoutSuffix();

		if (prefix == null) {
			prefix = "";
		}

		if (suffix == null) {
			suffix = "";
		}

		String layoutFilename = prefix + name + suffix;
		String realPath = servletContext.getRealPath(layoutFilename);
		File realFile = new File(realPath);
		if (!realFile.exists()) {
			throw new JspException(String.format("LayoutTag File Not Found: %s", layoutFilename));
		} else {
			logger.debug("layout {}", layoutFilename);
		}

		return realFile;
	}

	public void putDiv(String key, String value) {
		divMap.put(key, value);
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
		this.key = LayoutTag.class.getCanonicalName() + "." + name;
	}

	public void putRequestAttributeMap(String name, Object value) {
		this.requestAttributeMap.put(name, value);
	}

	public void putSessionAttributeMap(String name, Object value) {
		this.sessionAttributeMap.put(name, value);
	}

	public void putCookieMap(String name, Object value) {
		this.cookieMap.put(name, value);
	}

	@Override
	public void beforeDoTag(JspContext context, JspFragment fragment) { }

	@Override
	public void afterDoTag(JspContext context, JspFragment fragment) { }

}
