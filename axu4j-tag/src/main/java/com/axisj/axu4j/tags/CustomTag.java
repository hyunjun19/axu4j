package com.axisj.axu4j.tags;

import com.axisj.axu4j.config.ConfigReader;

import javax.servlet.jsp.JspContext;
import javax.servlet.jsp.tagext.JspFragment;
import java.util.Map;

/**
 * Created by HJ.Park on 2015-01-30.
 */
public class CustomTag extends AXUTagSupport {


    public CustomTag() throws Exception {
        super();
    }

    // =======================================================

    private String customid;

    // =======================================================

    public String getCustomid() {
        return customid;
    }

    public void setCustomid(String customid) {
        this.customid = customid;
    }

    // =======================================================


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

    }

    @Override
    public void afterDoTag(JspContext context, JspFragment fragment) { }

}
