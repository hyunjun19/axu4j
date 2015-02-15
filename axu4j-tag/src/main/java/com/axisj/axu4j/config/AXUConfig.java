package com.axisj.axu4j.config;

import org.simpleframework.xml.*;

import java.util.Map;

@Root(name = "axu4j")
@Namespace(reference = "http://axisj.com/axu4j")
public class AXUConfig {

    @Path("config[1]")
    @Element(name = "reloadtime", required = false, type = Long.class)
    private long reloadTime = 60000;

    @Path("layout[1]")
    @Element(name = "prefix")
    private String layoutPrefix;

    @Path("layout[1]")
    @Element(name = "encoding")
    private String layoutEncoding;

    @Path("row[1]")
    @Element(name = "wrap", data = true)
    private String rowWrap;

    @Path("col[1]")
    @Element(name = "wrap", data = true)
    private String colWrap;

    @Path("form[1]")
    @Element(name = "wrap", data = true)
    private String formWrap;

    @Path("fields[1]")
    @Element(name = "wrap", data = true)
    private String fieldsWrap;

    @Path("field[1]")
    @Element(name = "wrap", data = true)
    private String fieldWrap;

    @Path("customs[1]")
    @ElementMap(entry="custom", key="id", attribute = true, inline = true, data = true)
    private Map<String, String> customMap;


    // =======================================================


    public long getReloadTime() {
        return reloadTime;
    }

    public void setReloadTime(long reloadTime) {
        this.reloadTime = reloadTime;
    }

    public String getLayoutPrefix() {
        return layoutPrefix;
    }

    public void setLayoutPrefix(String layoutPrefix) {
        this.layoutPrefix = layoutPrefix;
    }

    public String getLayoutEncoding() {
        return layoutEncoding;
    }

    public void setLayoutEncoding(String layoutEncoding) {
        this.layoutEncoding = layoutEncoding;
    }

    public String getRowWrap() {
        return rowWrap;
    }

    public void setRowWrap(String rowWrap) {
        this.rowWrap = rowWrap;
    }

    public String getColWrap() {
        return colWrap;
    }

    public void setColWrap(String colWrap) {
        this.colWrap = colWrap;
    }

    public String getFormWrap() {
        return formWrap;
    }

    public void setFormWrap(String formWrap) {
        this.formWrap = formWrap;
    }

    public String getFieldWrap() {
        return fieldWrap;
    }

    public void setFieldWrap(String fieldWrap) {
        this.fieldWrap = fieldWrap;
    }

    public String getFieldsWrap() {
        return fieldsWrap;
    }

    public void setFieldsWrap(String fieldsWrap) {
        this.fieldsWrap = fieldsWrap;
    }

    public Map<String, String> getCustomMap() {
        return customMap;
    }

    public void setCustomMap(Map<String, String> customMap) {
        this.customMap = customMap;
    }

    // =======================================================


    @Override
    public String toString() {
        return "AXUConfig{" +
                "reloadTime=" + reloadTime +
                ", layoutPrefix='" + layoutPrefix + '\'' +
                ", layoutEncoding='" + layoutEncoding + '\'' +
                ", rowWrap='" + rowWrap + '\'' +
                ", colWrap='" + colWrap + '\'' +
                ", formWrap='" + formWrap + '\'' +
                ", fieldsWrap='" + fieldsWrap + '\'' +
                ", fieldWrap='" + fieldWrap + '\'' +
                ", customMap=" + customMap +
                '}';
    }
}
