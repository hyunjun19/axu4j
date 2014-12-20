package com.axisj.axu4j.layout;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;

/**
 * 상속할 레이아웃을 지정하는 태그
 * <p/>
 * @author KwonNam Son(kwon37xi@gmail.com)
 * @version axu4j-0.0.1: add JspException and debug message
 */
public class ExtendsTag extends SimpleTagSupport {
	Logger logger = LoggerFactory.getLogger(ExtendsTag.class);
	
    /**
     * Parent Template name(relative path) *
     */
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void doTag() throws JspException, IOException {
        StringWriter ignoredWriter = new StringWriter();
        getJspBody().invoke(ignoredWriter); // ignore body text

        PageContext pageContext = (PageContext) getJspContext();

        try {
            pageContext.forward(getRefinedName());
        } catch (ServletException e) {
            throw new RuntimeException(e.getMessage(), e);
		} catch (JspException e) {
			logger.error(String.format("ExtendsTag doTag is fail.\nname: %s", name), e);
			throw e;
		} catch (IOException e) {
			logger.error(String.format("ExtendsTag doTag is fail.\nname: %s", name), e);
			throw e;
        }
    }

    protected String getRefinedName() throws JspException {
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
        
        String refinedName = prefix + name + suffix;
        String realPath = servletContext.getRealPath(refinedName);
        File realFile = new File(realPath);
        if (!realFile.exists()) {
        	throw new JspException(String.format("ExtendsTag JSP File Not Found: %s", refinedName));
        } else {
        	logger.debug("layout extens {}", refinedName);
        }

        return refinedName;
    }
}