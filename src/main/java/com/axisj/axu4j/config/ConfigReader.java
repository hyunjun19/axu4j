package com.axisj.axu4j.config;

import java.io.File;

import org.simpleframework.xml.Serializer;
import org.simpleframework.xml.core.Persister;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.axisj.axu4j.tags.ButtonTag;

/**
 * 
 * @author HJ Park
 */
public class ConfigReader {
	private static final Logger logger = LoggerFactory.getLogger(ConfigReader.class);
	private static final String defaultConfigFilename = "axu4j.xml";
	
	private static AXUConfig config = null;
	
	private ConfigReader() {}
	
	public static AXUConfig getConfig() throws Exception {
		if (config == null) {
			load();
		}
		
		return config;
	}
	
	/**
	 * read config from confingPath
	 * 
	 * @param confingFilename
	 * @throws Exception
	 */
	public static void load(String confingFilename) throws Exception {
		if (config == null) {
			config = new AXUConfig();
			logger.debug("create new AXUConfig instance");
		}
		
		Serializer serializer = new Persister();
//		File configFile = new File(ClassLoader.getSystemClassLoader().getResource(confingFilename).toURI());
		File configFile = new File(config.getClass().getClassLoader().getResource(confingFilename).toURI());
		
		serializer.read(config, configFile);
		
		
		
		logger.debug("load config to {}", configFile.getAbsolutePath());
	}
	
	/**
	 * read config from axu4j.xml
	 * 
	 * @throws Exception
	 */
	public static void load() throws Exception {
		load(defaultConfigFilename);
	}
	
	public static void save(String confingFilename) throws Exception {
		Serializer serializer = new Persister();
		File configFile = new File(ClassLoader.getSystemClassLoader().getResource(confingFilename).toURI());
		serializer.write(config, configFile);
		
		logger.debug("save config to {}", configFile.getAbsolutePath());
	}
	
	public static void save() throws Exception {
		save(defaultConfigFilename);
	}
	
	
	public static void main(String[] args) {
		try {
			logger.debug("AXUConfig test start");
			
			config = new AXUConfig();
			ButtonTag buttonTag = new ButtonTag();
			buttonTag.setButtonType("button");
			buttonTag.setBodyHtml("{{#isAnchor}}<a href=\"#{{id}}\" id=\"{{id}}\" class=\"AXButton {{css}}\">{{text}}</a>{{/isAnchor}}{{#isInput}}<input type=\"button\" id=\"{{id}}\" value=\"{{text}}\" class=\"AXButton {{css}}\" />{{/isInput}}{{#isButton}}<button type=\"button\" id=\"{{id}}\" class=\"AXButton {{css}}\">{{text}}</button>{{/isButton}}");
			
			config.setButtonTag(buttonTag);
			
			ConfigReader.save();
			
			logger.debug("AXUConfig test finish");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
