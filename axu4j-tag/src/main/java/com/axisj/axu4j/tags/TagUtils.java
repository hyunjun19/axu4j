package com.axisj.axu4j.tags;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.tagext.JspFragment;
import java.io.StringWriter;

/**
 * Created by HJ.Park on 2015-01-06.
 */
public class TagUtils {
    public static Logger logger = LoggerFactory.getLogger(TagUtils.class);

    public static String toString(JspFragment jspFrag) {
        if (jspFrag == null) { return null; }

        StringWriter writer = new StringWriter();
        try {
            jspFrag.invoke(writer);
        } catch (Exception e) {
            logger.error("getJspContents is fail.", e);
        }

        return writer.toString();
    }
}
