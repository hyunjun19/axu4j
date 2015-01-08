package com.axisj.axu4j.tags;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader;
import java.io.StringWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;

/**
 * layout tag
 *
 * Created by HJ.Park on 2015-01-06.
 */
public class LayoutTag extends AXUTagSupport {

    public LayoutTag() throws Exception {
	super();
    }

    private Map<String, String> divMap = new HashMap<String, String>();

    private String name;
    private String key;

    /**
     * override doTag method
     */
    @Override
    public void doTag() throws JspException, IOException {
	StringWriter dummy = new StringWriter();
	getJspBody().invoke(dummy); // invoke body tags. like div, row, col...
	
	PageContext pageContext = (PageContext) getJspContext();
	HttpServletRequest request = (HttpServletRequest) pageContext.getRequest();
	String contextPath = request.getContextPath();
	putDiv("__AXU4J_CONTEXT_PATH__", contextPath);

	Reader layoutFileReader = null;
	try {
	    AXUConfig config = ConfigReader.getConfig();
	    layoutFileReader = new BufferedReader(new InputStreamReader(new FileInputStream(this.getLayoutFile()), config.getLayoutEncoding()));

	    mustacheHtml = mustacheFactory.compile(layoutFileReader, key);
	    mustacheHtml.execute(getJspContext().getOut(), divMap);

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
	    logger.debug("layout extends {}", layoutFilename);
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

}
