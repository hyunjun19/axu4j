package com.axisj.axu4j.utils;

public class StringUtils {
	/**
	 * empty string
	 */
	public static final String EMPTY = "";
	
	/**
	 * <pre>
	 * StringUtils.get(null,  "default"); => "default"
	 * StringUtils.get("",    "default"); => "default"
	 * StringUtils.get("test","default"); => "test"
	 * </pre>
	 * 
	 * @param value
	 * @param defaultValue
	 * @return
	 */
	public static String get(String value, String defaultValue) {
		if (value == null || equals(value.trim(), EMPTY)) {
			return defaultValue;
		}
		
		return value;
	}

	/**
	 * <pre>
	 * StringUtils.get(null);   => ""
	 * StringUtils.get("");     => ""
	 * StringUtils.get("test"); => "test"
	 * </pre>
	 * 
	 * @param value
	 * @return
	 */
	public static String get(String value) {
		return get(value, EMPTY);
	}
	
	/**
	 * <pre>
	 * StringUtis.append(null);   => ""
	 * StringUtis.append("");     => ""
	 * StringUtis.append("test"); => " test"
	 * </pre>
	 * 
	 * @param value
	 * @return
	 */
	public static String append(String value) {
		if (value == null || equals(value.trim(), EMPTY)) {
			return EMPTY;
		}
		
		return String.format(" %s", value);		
	}
	
	/**
	 * 
	 * 
	 * @param values
	 * @return
	 */
	public static String append(String... values) {
		if (values == null || values.length == 0) {
			return EMPTY;
		}
		
		StringBuilder sb = new StringBuilder();
		for (String value : values) {
			sb.append(append(value));
		}
		
		return sb.toString();
	}
	
	/**
	 * <pre>
	 * StringUtis.append("title", null);   => ""
	 * StringUtis.append("title", "");     => ""
	 * StringUtis.append("title", "test"); => "title=\"test\""
	 * </pre>
	 * 
	 * @param attribute
	 * @param value
	 * @return
	 */
	public static String getAttr(String attribute, String value) {
		if (value == null || equals(value.trim(), EMPTY)) {
			return EMPTY;
		}
		
		return String.format("%s=\"%s\"", attribute, value);
	}
	
	/**
	 * <pre>
	 * StringUtis.append("title", null);   => ""
	 * StringUtis.append("title", "");     => ""
	 * StringUtis.append("title", "test"); => " title=\"test\""
	 * </pre>
	 * 
	 * @param attribute
	 * @param value
	 * @return
	 */
	public static String appendAttr(String attribute, String value) {
		return append(getAttr(attribute, value));
	}
	
	/**
	 * <pre>
	 * StringUtis.getProp("checked", null);  => ""
	 * StringUtis.getProp("checked", false); => ""
	 * StringUtis.getProp("checked", true);  => "checked=\"checked\""
	 * </pre>
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public static String getProp(String property, Boolean value) {
		if (value == null || value == false) {
			return EMPTY;
		}
		
		return String.format("%s=\"%s\"", property, property);
	}
	
	/**
	 * <pre>
	 * StringUtis.getProp("checked", null);  => ""
	 * StringUtis.getProp("checked", false); => ""
	 * StringUtis.getProp("checked", true);  => " checked=\"checked\""
	 * </pre>
	 * 
	 * @param property
	 * @param value
	 * @return
	 */
	public static String appendProp(String property, Boolean value) {
		return append(getProp(property, value));
	}
	
    /**
     * <p>Compares two Strings, returning <code>true</code> if they are equal.</p>
     *
     * <p><code>null</code>s are handled without exceptions. Two <code>null</code>
     * references are considered to be equal. The comparison is case sensitive.</p>
     *
     * <pre>
     * StringUtils.equals(null, null)   = true
     * StringUtils.equals(null, "abc")  = false
     * StringUtils.equals("abc", null)  = false
     * StringUtils.equals("abc", "abc") = true
     * StringUtils.equals("abc", "ABC") = false
     * </pre>
     *
     * @see java.lang.String#equals(Object)
     * @param src  the first String, may be null
     * @param dst  the second String, may be null
     * @return <code>true</code> if the Strings are equal, case sensitive, or
     *  both <code>null</code>
     */
	public static boolean equals(String src, String dst) {
		return src == null ? dst == null : src.equals(dst);
	}
	
	/**
	 * <pre>
	 * StringUtils.switchIfEquls("b", "a:1", "b:2", "c:3") => "2"
	 * </pre>
	 * 
	 * @see com.axisj.axu4j.utils.StringUtils#equals(src, dst)
	 * @param src
	 * @param dsts "a:1", "b:2", "c:3"
	 * @return
	 */
	public static String switchIfEquls(String src, String... dsts) {
		if (dsts == null || dsts.length == 0) { return src; }
		
		for (String pair : dsts) {
			String[] dst = pair.split(":");
			if (equals(src, dst[0])) {
				return dst[1];
			}
		}
		
		return src;
	}
	
	/**
	 * StringUtils.appendIfEquals("b", "number:", "a:1", "b:2", "c:3") => "number: 2"
	 *
	 * @param compare
	 * @param src
	 * @param dsts
	 * @return
	 */
	public static String appendIfEquals(String compare, String src, String... dsts) {
		if (dsts == null || dsts.length == 0) { return src; }
		
		StringBuilder sb = new StringBuilder(get(src));
		boolean isFirst = true;
		for (String pair : dsts) {
			String[] dst = pair.split(":");
			if (equals(compare, dst[0])) {
				if (isFirst) {
					sb.append("");
				}
				sb.append(dst[1]);
			}
		}
		
		return sb.toString();
	}
}
