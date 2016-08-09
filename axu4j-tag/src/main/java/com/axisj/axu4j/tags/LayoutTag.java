package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;
import com.github.mustachejava.DefaultMustacheFactory;
import com.github.mustachejava.Mustache;
import com.github.mustachejava.MustacheFactory;
import org.apache.commons.lang.BooleanUtils;
import org.apache.commons.lang.ObjectUtils;
import org.apache.commons.lang.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;
import java.io.*;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;

/**
 * layout tag
 *
 * Created by HJ.Park on 2015-01-06.
 */
public class LayoutTag extends SimpleTagSupport {
	protected static MustacheFactory mustacheFactory = new DefaultMustacheFactory();
    private static final String HEADER_KEY_PJAX = "X-PJAX"; // see -> https://github.com/defunkt/jquery-pjax
    private static final String HEADER_KEY_AXU4J_DIV = "X-AXU4J-DIV";

	protected Mustache mustacheHtml;
	protected Logger logger = LoggerFactory.getLogger(getClass());

	public LayoutTag() throws Exception {
		super();
	}

    private Hashtable<String, String> divMap = new Hashtable<String, String>();
    private Map<String, Object> globalMap = new HashMap<String, Object>();

	private String name;
	private String key;

	/**
	 * override doTag method
	 */
	@Override
	public void doTag() throws JspException, IOException {
		PageContext pageContext = (PageContext) getJspContext();
        HttpServletRequest request  = (HttpServletRequest) pageContext.getRequest();

		// set global parameter
		globalMap.put("__AXU4J_CONTEXT_PATH__", request.getContextPath());

        // invoke body tags. like div, row, col...
        StringWriter dummy = new StringWriter();
        getJspBody().invoke(dummy);

        boolean isPjax = BooleanUtils.toBoolean(ObjectUtils.toString(request.getHeader(HEADER_KEY_PJAX)));
        if (isPjax) {
            Writer out = pageContext.getOut();
            String[] divs = StringUtils.split(request.getHeader(HEADER_KEY_AXU4J_DIV), ",");

            for(String div : divs) {
                out.write(divMap.get(StringUtils.trim(div)));
            }
            return;
        }

        AXUConfig config = ConfigReader.getConfig();
        String layoutFilename = getLayoutFilename();

        Reader layoutFileReader = null;
        try {
            // JSP
            if (StringUtils.endsWithIgnoreCase(layoutFilename, "jsp")) {

                pageContext.getServletContext().setAttribute("divMap", divMap);
                pageContext.forward(layoutFilename);

            // HTML, else
            } else {
                layoutFileReader = new BufferedReader(new InputStreamReader(
                        new FileInputStream(getLayoutFile(layoutFilename)), config.getLayoutEncoding()));

                globalMap.put("param",   TagUtils.getRequestParameterMap(pageContext));
                globalMap.put("request", TagUtils.getRequestAttributeMap(pageContext));
                globalMap.put("session", TagUtils.getSessionAttributeMap(pageContext));
                globalMap.put("cookie",  TagUtils.getCookieMap(pageContext));

                Object[] params = new Object[] { divMap, globalMap };
                mustacheHtml = mustacheFactory.compile(layoutFileReader, key);
                mustacheHtml.execute(getJspContext().getOut(), params);

            }
        } catch (Exception e) {
            throw new JspException(String.format("LayoutTag is fail.\nname: %s", name), e);
        } finally {
            if (layoutFileReader != null) {
                layoutFileReader.close();
            }
            divMap = null;
        }
    }

    private String getLayoutFilename() throws JspException {
        ServletContext servletContext = ((PageContext) getJspContext()).getServletContext();
        AXUConfig config = ConfigReader.getConfig();
        String prefix = config.getLayoutPrefix();

        if (prefix == null) {
            prefix = "";
        }

        String layoutFilename = prefix + name;
        String realPath = servletContext.getRealPath(layoutFilename);
        File realFile = new File(realPath);
        if (!realFile.exists()) {
            throw new JspException(String.format("LayoutTag JSP File Not Found: %s", layoutFilename));
        } else {
            logger.debug("layout extends {}", layoutFilename);
        }

        return layoutFilename;
    }

	private File getLayoutFile(String layoutFilename) throws JspException {
		ServletContext servletContext = ((PageContext) getJspContext()).getServletContext();

		String realPath = servletContext.getRealPath(layoutFilename);
		File realFile = new File(realPath);
		if (!realFile.exists()) {
			throw new JspException(String.format("LayoutTag File Not Found: %s", layoutFilename));
		} else {
			logger.debug("layout {}", layoutFilename);
		}

		return realFile;
	}

    public String getDiv(String key) {
        return divMap.get(key);
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
