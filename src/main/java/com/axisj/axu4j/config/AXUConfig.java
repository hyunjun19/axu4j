package com.axisj.axu4j.config;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Path;
import org.simpleframework.xml.Root;

@Root(name = "axu4j")
public class AXUConfig {

	@Attribute(required = false)
	private boolean realadable = false;
	
	@Path("layout[1]")
	@Element(name="prefix")
	private String layoutPrefix;
	
	@Path("layout[1]")
	@Element(name="suffix")
	private String layoutSuffix;

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
	

	// =======================================================

	public boolean isRealadable() {
		return realadable;
	}

	public void setRealadable(boolean realadable) {
		this.realadable = realadable;
	}

	public String getLayoutPrefix() {
		return layoutPrefix;
	}

	public void setLayoutPrefix(String layoutPrefix) {
		this.layoutPrefix = layoutPrefix;
	}

	public String getLayoutSuffix() {
		return layoutSuffix;
	}

	public void setLayoutSuffix(String layoutSuffix) {
		this.layoutSuffix = layoutSuffix;
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

}
