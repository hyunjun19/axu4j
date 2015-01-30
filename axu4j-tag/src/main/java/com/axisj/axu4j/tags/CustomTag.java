package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.DynamicAttributes;
import javax.servlet.jsp.tagext.JspFragment;
import java.util.LinkedHashMap;
import java.util.Map;

/**
 * Created by HJ.Park on 2015-01-30.
 */
public class CustomTag extends AXUTagSupport implements DynamicAttributes {


    public CustomTag() throws Exception {
        super();
    }

    // =======================================================

    private String customid;

    /**
     * Tag Attribute 아님
     */
    private Map<String, Object> dynamicAttrMap = new LinkedHashMap<String, Object>();

    // =======================================================

    public String getCustomid() {
        return customid;
    }

    public void setCustomid(String customid) {
        this.customid = customid;
    }

    // =======================================================

    public void setDynamicAttribute(String uri, String localName, Object value) throws JspException {
        if (TagUtils.isELValue(value)) {
            value = TagUtils.getElValue(getJspContext(), TagUtils.getElName(value));
        }

        dynamicAttrMap.put(localName, value);
    }

    @Override
    public void beforeDoTag(JspContext context, JspFragment fragment) {
        Map<String, String> customMap = ConfigReader.getConfig().getCustomMap();

        if (customMap == null) {
            throw new RuntimeException("사용가능한 custom tag 설정이 없습니다.\naxu4j.xml 설정파일에서 <customs> 내용을 확인하세요.");
        }

        tagBody = customMap.get(getCustomid());
        doBody  = TagUtils.toString(fragment);

        if (tagBody == null) {
            throw new RuntimeException(String.format("사용가능한 custom tag 설정이 없습니다.\naxu4j.xml 설정파일에서 <custom id=\"%s\"> 내용을 확인하세요.", getCustomid()));
        }

        innerInstance.putAll(dynamicAttrMap);
    }

    @Override
    public void afterDoTag(JspContext context, JspFragment fragment) { }

}
