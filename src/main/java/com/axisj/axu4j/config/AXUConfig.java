package com.axisj.axu4j.config;

import org.simpleframework.xml.Attribute;
import org.simpleframework.xml.Element;
import org.simpleframework.xml.Path;
import org.simpleframework.xml.Root;

@Root(name = "axu4j")
public class AXUConfig {

	@Attribute(required = false)
	private boolean realadable = false;

	@Path("button[1]")
	@Element(name = "body", data = true)
	private String buttonBody;

	@Path("text[1]")
	@Element(name = "body", data = true)
	private String textBody;

	@Path("number[1]")
	@Element(name = "body", data = true)
	private String numberBody;

	@Path("switch[1]")
	@Element(name = "body", data = true)
	private String switchBody;

	@Path("segment[1]")
	@Element(name = "body", data = true)
	private String segmentBody;
	
	@Path("slider[1]")
	@Element(name = "body", data = true)
	private String sliderBody;
	
	@Path("selector[1]")
	@Element(name = "body", data = true)
	private String selectorBody;
	
	@Path("date[1]")
	@Element(name = "body", data = true)
	private String dateBody;
	
	@Path("pattern[1]")
	@Element(name = "body", data = true)
	private String patternBody;
	
	@Path("select[1]")
	@Element(name = "body", data = true)
	private String selectBody;
	
	@Path("tab[1]")
	@Element(name = "body", data = true)
	private String tabBody;
	
	@Path("modal[1]")
	@Element(name = "body", data = true)
	private String modalBody;
	
	@Path("grid[1]")
	@Element(name = "body", data = true)
	private String gridBody;
	
	@Path("tree[1]")
	@Element(name = "body", data = true)
	private String treeBody;
	
	@Path("editor[1]")
	@Element(name = "body", data = true)
	private String editorBody;
	
	@Path("search[1]")
	@Element(name = "body", data = true)
	private String searchBody;
	
	@Path("upload5[1]")
	@Element(name = "body", data = true)
	private String upload5Body;
	

	// =======================================================

	public boolean isRealadable() {
		return realadable;
	}

	public void setRealadable(boolean realadable) {
		this.realadable = realadable;
	}

	public String getButtonBody() {
		return buttonBody;
	}

	public void setButtonBody(String buttonBody) {
		this.buttonBody = buttonBody;
	}

	public String getTextBody() {
		return textBody;
	}

	public void setTextBody(String textBody) {
		this.textBody = textBody;
	}

	public String getNumberBody() {
		return numberBody;
	}

	public void setNumberBody(String numberBody) {
		this.numberBody = numberBody;
	}

	public String getSwitchBody() {
		return switchBody;
	}

	public void setSwitchBody(String switchBody) {
		this.switchBody = switchBody;
	}

	public String getSegmentBody() {
		return segmentBody;
	}

	public void setSegmentBody(String segmentBody) {
		this.segmentBody = segmentBody;
	}

	public String getSliderBody() {
		return sliderBody;
	}

	public void setSliderBody(String sliderBody) {
		this.sliderBody = sliderBody;
	}

	public String getSelectorBody() {
		return selectorBody;
	}

	public void setSelectorBody(String selectorBody) {
		this.selectorBody = selectorBody;
	}

	public String getDateBody() {
		return dateBody;
	}

	public void setDateBody(String dateBody) {
		this.dateBody = dateBody;
	}

	public String getPatternBody() {
		return patternBody;
	}

	public void setPatternBody(String patternBody) {
		this.patternBody = patternBody;
	}

	public String getSelectBody() {
		return selectBody;
	}

	public void setSelectBody(String selectBody) {
		this.selectBody = selectBody;
	}

	public String getTabBody() {
		return tabBody;
	}

	public void setTabBody(String tabBody) {
		this.tabBody = tabBody;
	}

	public String getModalBody() {
		return modalBody;
	}

	public void setModalBody(String modalBody) {
		this.modalBody = modalBody;
	}

	public String getGridBody() {
		return gridBody;
	}

	public void setGridBody(String gridBody) {
		this.gridBody = gridBody;
	}

	public String getTreeBody() {
		return treeBody;
	}

	public void setTreeBody(String treeBody) {
		this.treeBody = treeBody;
	}

	public String getEditorBody() {
		return editorBody;
	}

	public void setEditorBody(String editorBody) {
		this.editorBody = editorBody;
	}

	public String getSearchBody() {
		return searchBody;
	}

	public void setSearchBody(String searchBody) {
		this.searchBody = searchBody;
	}

	public String getUpload5Body() {
		return upload5Body;
	}

	public void setUpload5Body(String upload5Body) {
		this.upload5Body = upload5Body;
	}

}
