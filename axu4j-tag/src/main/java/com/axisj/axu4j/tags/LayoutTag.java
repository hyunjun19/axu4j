package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.*;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

/**
 * layout tag
 *
 * Created by HJ.Park on 2015-01-06.
 */
public class LayoutTag extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();

	protected Mustache mustacheHtml;
	protected Logger logger  = LoggerFactory.getLogger(getClass());

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

	private HttpServletRequest  request;
	private HttpServletResponse response;
	private HttpSession         session;

	/**
	 * override doTag method
	 */
	@Override
	public void doTag() throws JspException, IOException {
		PageContext pageContext = (PageContext) getJspContext();
		request  = (HttpServletRequest) pageContext.getRequest();
		response = (HttpServletResponse) pageContext.getResponse();
		session  = request.getSession();

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


		// invoke body tags. like div, row, col...
		StringWriter dummy = new StringWriter();
		getJspBody().invoke(dummy);


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

	public void putRequestAttribute(String name, Object value) {
		if (request == null) {
			throw new RuntimeException("request is not set.");
		}

		request.setAttribute(name, value);
	}

	public void putSessionAttribute(String name, Object value) {
		if (session == null) {
			throw new RuntimeException("session is not set.");
		}

		session.setAttribute(name, value);
	}

	public void putCookie(String name, Object value) {
		if (response == null) {
			throw new RuntimeException("response is not set.");
		}

		String val = TagUtils.getCookieValue(value);
		cookieMap.put(name, val);
		response.addCookie(new Cookie(name, val));
	}

	public Map<String, Object> getRequestParameterMap() {
		return requestParameterMap;
	}

	public Map<String, Object> getRequestAttributeMap() {
		return requestAttributeMap;
	}

	public Map<String, Object> getSessionAttributeMap() {
		return sessionAttributeMap;
	}

	public Map<String, Object> getCookieMap() {
		return cookieMap;
	}

}
