package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.AXUConfig;
import com.axisj.axu4j.config.ConfigReader;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
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

    private Map<String, String> divMap = new HashMap<String, String>();

    private String name;
    private String key;

    /**
     * override doTag method
     */
    @Override
    public void doTag() throws JspException, IOException {
        StringWriter ignoredWriter = new StringWriter();
        getJspBody().invoke(ignoredWriter); // ignore body text

        PageContext pageContext = (PageContext) getJspContext();

        try {
            pageContext.forward(getLayoutFilename());

            tagBody = TagUtils.toString(getJspBody());

            mustacheHtml = mustacheFactory.compile(new StringReader(tagBody), key);
            mustacheHtml.execute(getJspContext().getOut(), divMap);
        } catch (Exception e) {
            logger.error(String.format("LayoutTag is fail.\nname: %s\ndivMap: %s", name, divMap), e);
        }

        if (logger.isDebugEnabled()) {
            logger.debug(this.toString());
        }
    }

    private String getLayoutFilename() throws JspException {
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
            throw new JspException(String.format("LayoutTag JSP File Not Found: %s", layoutFilename));
        } else {
            logger.debug("layout extends {}", layoutFilename);
        }

        return layoutFilename;
    }

    public void putDiv(String key, String value){
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
