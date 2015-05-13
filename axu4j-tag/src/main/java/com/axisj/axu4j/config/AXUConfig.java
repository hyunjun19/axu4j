package com.axisj.axu4j.config;

import org.simpleframework.xml.*;

import java.util.Map;

@Root(name = "axu4j")
@Namespace(reference = "http://axisj.com/axu4j")
public class AXUConfig {

    @Path("config[1]")
    @Element(name = "mode", required = false)
    private String mode = "RUN";

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

    @Path("table[1]")
    @Element(name = "wrap", data = true)
    private String tableWrap;

    @Path("tr[1]")
    @Element(name = "wrap", data = true)
    private String trWrap;

    @Path("td[1]")
    @Element(name = "wrap", data = true)
    private String tdWrap;


    // =======================================================


    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
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

    public String getTableWrap() {
        return tableWrap;
    }

    public void setTableWrap(String tableWrap) {
        this.tableWrap = tableWrap;
    }

    public String getTrWrap() {
        return trWrap;
    }

    public void setTrWrap(String trWrap) {
        this.trWrap = trWrap;
    }

    public String getTdWrap() {
        return tdWrap;
    }

    public void setTdWrap(String tdWrap) {
        this.tdWrap = tdWrap;
    }

// =======================================================


    @Override
    public String toString() {
        return "AXUConfig{" +
                "mode='" + mode + '\'' +
                ", layoutPrefix='" + layoutPrefix + '\'' +
                ", layoutEncoding='" + layoutEncoding + '\'' +
                ", rowWrap='" + rowWrap + '\'' +
                ", colWrap='" + colWrap + '\'' +
                ", formWrap='" + formWrap + '\'' +
                ", fieldsWrap='" + fieldsWrap + '\'' +
                ", fieldWrap='" + fieldWrap + '\'' +
                ", customMap=" + customMap +
                ", tableWrap='" + tableWrap + '\'' +
                ", trWrap='" + trWrap + '\'' +
                ", tdWrap='" + tdWrap + '\'' +
                '}';
    }
}
