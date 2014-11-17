package com.axisj.axu4j.layout;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.JspFragment;
import java.io.IOException;
import java.io.StringWriter;

/**
 * Author: KwonNam Son(kwon37xi@gmail.com)
 */
public class BlockTagUtils {
    public static String getBodyResult(JspFragment jspBody) throws IOException, JspException {
        if (jspBody == null) {
            return "";
        }

        StringWriter writer = new StringWriter();
        jspBody.invoke(writer);
        return writer.toString();
    }

    public static String getBlockContentsAttributeName(String blockName) {
        return PutTag.PUT_DATA_PREFIX + blockName + ".contents";
    }

    public static String getBlockTypeAttributeName(String blockName) {
        return PutTag.PUT_DATA_PREFIX + blockName + ".type";
    }
}
