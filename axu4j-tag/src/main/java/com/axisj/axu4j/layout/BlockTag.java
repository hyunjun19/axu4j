package com.axisj.axu4j.layout;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.io.IOException;

import static com.axisj.axu4j.layout.BlockTagUtils.*;

/**
 * 레이아웃에서 템플릿이 대체되어 들어갈 블럭을 지정하는 태그
 *
 * Author: KwonNam Son(kwon37xi@gmail.com)
 */
public class BlockTag extends SimpleTagSupport {
	private static Logger logger = LoggerFactory.getLogger(BlockTag.class);
	
    public static final PutType DEFAULT_PUT_TYPE = PutType.APPEND;

    /** Block name **/
    private String name;

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public void doTag() throws JspException, IOException {
    	try {
	        PageContext pageContext = (PageContext)getJspContext();
	
	        PutType putType = getPutType(pageContext);
	
	        String bodyResult = getBodyResult(getJspBody());
	        String putContents = getPutContents(pageContext);
	
	        putType.write(pageContext.getOut(), bodyResult, putContents);
		} catch (JspException e) {
			logger.error(String.format("BlockTag doTag is fail.\nname: %s", name), e);
			throw e;
		} catch (IOException e) {
			logger.error(String.format("BlockTag doTag is fail.\nname: %s", name), e);
			throw e;
		}
    }

    private PutType getPutType(PageContext pageContext) {
        PutType putType = (PutType) pageContext.findAttribute(getBlockTypeAttributeName(name));
        if (putType == null) {
            return DEFAULT_PUT_TYPE;
        }
        return putType;
    }

    private String getPutContents(PageContext pageContext) {
        String putContents = (String) pageContext.findAttribute(getBlockContentsAttributeName(name));
        if (putContents == null) {
            return "";
        }
        return putContents;
    }
}