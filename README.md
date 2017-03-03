[![axisj-contributed](https://img.shields.io/badge/AXISJ.com-Contributed-green.svg)](https://github.com/axisj)

# AXU4J

[AXU4J](https://github.com/axisj-com/axu4j)

AXU(https://github.com/axisj-com/axu) for java

악수(AXU)는 액시스제이에서 제공하는 '반응형 웹 애플리케이션 템플릿 패키지' 입니다.
AXU4J는 악수를 좀 더 쉽게 사용할 수 있게 해주는 layout/tag engine 입니다.
layout 엔진은 반복되는 레이아웃을 간단하게 정리하고 적용 가능하게 해줍니다.
또한 악수의 그리드시스템과 폼을 tag로 만들어 사용함으로서 좀 더 적고 간결한 소스 작성이 가능하며
기존 순수 HTML 작성보다 재사용과 유지보수에 편리합니다.

xml 컨텐츠 내에서 사용하는 문법은 mustache(http://mustache.github.io) 문법을 적용
하였습니다.

AXU4J를 사용하기 위해서는 JSP 상단에 아래 선언을 추가해야 합니다.
```jsp
<%@ taglib prefix="ax" uri="http://axisj.com/axu4j" %>
```

[※ dynamic attributes 사용가능] 표시가 있는 태그는 아래와 같이 사용할 수 있습니다.
axu4j.xml 설정
```xml
<row>
    <wrap>
<![CDATA[
<div id="{{id}}" class="ax-layer {{css}}" style="{{style}}" data-dynaattr="{{dynaattr}}">
	{{{doBody}}}
</div>
]]>
    </wrap>
</row>
```

#### JSP 사용법
```jsp
<ax:row dynaattr="foo">
    row tag contents
</ax:row>
```

#### output HTML
```html
<div id="row-1" class="ax-layer " style="" data-dynaattr="foo">
	row tag contents
</div>
```

## 사용기술
JSP Custom Tag Library

## spec
1. JSP 2.0
2. Tomcat 5
3. JDK 1.5

## 장점
1. JSP에서 AXU를 간단하게 사용 가능
2. 중복코드의 최소화
3. 간단한 커스터 마이징
 - 단일 설정파일을 통해서 모듈 템플릿 수정 가능(axu4j.xml)
4. layout + tag 엔진
5. XML 설정과 mustache 문법 적용(http://mustache.github.io/)

***

# AXU4J 사용방법

## setup

1. download /dist/axu4j.xml (AXU4J config file)
   copy to /WEB-INF/classes/ folder
2. add dependency
   pom.xml
```xml
<dependency>
	<groupId>com.axisj</groupId>
	<artifactId>axu4j</artifactId>
	<version>1.2.1-RELEASE</version>
</dependency>
```
3. JSP 선언
```jsp
<%@ taglib prefix="ax" uri="http://axisj.com/axu4j"%>
```
4. axu4j.xml
[axu4j.xml](https://raw.githubusercontent.com/axisj-com/axu4j/master/axu4j-tag/src/main/resources/axu4j.xml) 파일을 `/WEB-INF/classes`로 복사합니다.
메이븐을 사용하시는 경우는 `resources` 폴더에 복사하면 됩니다.

## Custom Tag API

***
### `set`
layout 페이지, axu4j.xml, jsp에서 사용할 수 있는 내장객체 변수입니다.

#### attributes
- name : 변수 명
- value: 변수 값
- scope: 변수의 범위. request, session, cookie 세가지 범위를 지원하며 scope를 생략하는 경우 변수의 범위는 request가 됩니다.

#### example
```jsp
<ax:set name="foo" value="req-val" scope="request" /> => {{request.foo}}
<ax:set name="foo" value="ses-val" scope="session" /> => {{session.foo}}
<ax:set name="foo" value="coo-val" scope="cookie"  /> => {{cookie.foo}}
```

***

### `layout`
페이지에 사전에 정의한 레이아웃을 적용하는 tag입니다.
레이아웃 페이지는 HTML 파일로 작성을 하며 mustache 문법을 사용해서 원하는 부위에 내용을 위치할 수 있습니다.
레이아웃 페이지에 {{name}}(HTML escaped), {{{name}}}의 표현식을 사용하면 div tag의 내용이 해당 위치에 삽입됩니다.

#### attributes
- `name` 페이지에 사용할 layout name입니다. axu4j.xml에 설정한 prefix(default: /WEB-INF/layouts/)와 suffix(default: .html)를 제외한 파일명을 그대로 사용하면 됩니다.

#### example
```jsp
<ax:layout name="base">
	...
</ax:layout>
```

***

### `row`
[악수 그리드 시스템](https://www.axisj.com/ko/axu/docs#axu-3)을 사용하기 위한 row tag입니다.

#### attributes
- `id` tag의 id입니다. 기본값은 자동으로 생성됩니다.
- `css` tag에 추가될 class 입니다.
- `style` tag에 추가될 style 입니다.

#### example
```jsp
<ax:row>
	<ax:col size="12">
		...
	</ax:col>
</ax:row>
```

***

### `col`
[악수 그리드 시스템](https://www.axisj.com/ko/axu/docs#axu-3)을 사용하기 위한 col tag입니다.
하나의 row tag 안에 col tag size의 합은 12가 되어야 합니다.

#### attributes
- `id` tag의 id입니다. 기본값은 자동으로 생성됩니다.
- `size` 가로 길이를 의미하며 1 ~ 12 까지 지정할 수 있습니다.
- `css` tag에 추가될 class 입니다.
- `style` tag에 추가될 style 입니다.

#### example
```jsp
<ax:row>
	<ax:col size="4">
		...
	</ax:col>
	<ax:col size="8">
		...
	</ax:col>
</ax:row>
```

***

### `form`
HTML form과 동일하며 form외에 레이아웃과 스타일적 요소를 추가적으로 가지고 있습니다.

#### attributes
- `id` tag의 id입니다. 기본값은 자동으로 생성됩니다.
- `name` HTML form의 name입니다. 기본값은 id값 입니다.
- `method` HTML form의 method입니다. 기본값은 POST값 입니다.
- `action` HTML form의 action입니다.
- `css` tag에 추가될 class 입니다.
- `style` tag에 추가될 style 입니다.

#### example
```jsp
<ax:form name="table-form">
	...
</ax:form>
```

***

### `fields`
form tag 내부에서 row의 역할을 하는 tag 입니다.

#### attributes
- `id`: tag의 id입니다. 기본값은 자동으로 생성됩니다.
- `css`: tag에 추가될 class 입니다.
- `style`: tag에 추가될 style 입니다.

#### example
```jsp
<ax:form name="table-form">
	<ax:fields>
		...
	</ax:fields>
	<ax:fields>
		...
	</ax:fields>
</ax:form>
```

***

### `field`
fields tag 내부에서 컬럼처럼 사용되는 tag입니다.

#### attributes
- `id` tag의 id입니다. 기본값은 자동으로 생성됩니다.
- `label` 입력 항목명 입니다.
- `title` 입력 항목에 대한 설명을 입력합니다. HTML title attribute입니다.
- `css` tag에 추가될 class 입니다.
- `style` tag에 추가될 style 입니다.

#### example
```jsp
<ax:form name="table-form">
	<ax:fields>
		<ax:field label="번호">
			<input type="text" ... />
		</ax:field>
	</ax:fields>
	<ax:fields>
		<ax:field label="이메일">
			<input type="text" ... />
		</ax:field>
	</ax:fields>
</ax:form>
```

***

### `custom`
사용자가 정의한 템플릿을 사용할 수 있습니다.

#### attributes
- customid: axu4j.xml > axu4j > customs > custom.id 값

#### example
axu4j.xml 설정
```xml
<axu4j>
    ...
    <customs>
        <custom id="select">
<![CDATA[
<select name="{{name}}">
{{#emptyName}}
	<option value="">{{emptyName}}</option>
{{/emptyName}}
{{#options}}
	<option value="{{value}}">{{name}}</option>
{{/options}}
</select>
]]>
        </custom>
    </customs>
</axu4j>
```

JSP 사용
```jsp
<%@ page import="java.util.*"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><%
	List options = new ArrayList();
	HashMap<String, String> one = new HashMap<String, String>();
	one.put("name", "A");
	one.put("value", "one");
	HashMap<String, String> two = new HashMap<String, String>();
	two.put("name", "B");
	two.put("value", "two");
	HashMap<String, String> three = new HashMap<String, String>();
	three.put("name", "C");
	three.put("value", "three");

	options.add(one);
	options.add(two);
	options.add(three);

	request.setAttribute("options",     options);
	request.setAttribute("projectName", "axu4j");
%><ax:layout name="base.jsp">
    ...
    <ax:custom customid="select" name="test-select" options="${options}" />
    ...
```

***

## Freemarker에서 사용하는 방법

reference http://freemarker.org/docs/pgui_misc_servlet.html#autoid_56

***

### 설정방법

1. web.xml Freemarker 설정 추가
```xml
<!DOCTYPE web-app PUBLIC
        "-//Sun Microsystems, Inc.//DTD Web Application 2.3//EN"
        "http://java.sun.com/dtd/web-app_2_3.dtd" >

<web-app>
    <display-name>AXU4J Sample Web Application</display-name>
    <servlet>
        <servlet-name>freemarker</servlet-name>
        <servlet-class>freemarker.ext.servlet.FreemarkerServlet</servlet-class>

        <!-- FreemarkerServlet settings: -->
        <init-param>
            <param-name>TemplatePath</param-name>
            <param-value>/</param-value>
        </init-param>
        <init-param>
            <param-name>NoCache</param-name>
            <param-value>true</param-value>
        </init-param>
        <init-param>
            <param-name>ContentType</param-name>
            <param-value>text/html; charset=UTF-8</param-value>
            <!-- Forces UTF-8 output encoding! -->
        </init-param>

        <!-- FreeMarker settings: -->
        <init-param>
            <param-name>incompatible_improvements</param-name>
            <param-value>2.3.21</param-value>
        </init-param>
        <init-param>
            <param-name>template_exception_handler</param-name>
            <!-- Some may prefer "html_debug" for development. -->
            <param-value>rethrow</param-value>
        </init-param>
        <init-param>
            <param-name>template_update_delay</param-name>
            <param-value>0</param-value>
            <!-- 0 is for development only! Use higher value otherwise. -->
        </init-param>
        <init-param>
            <param-name>default_encoding</param-name>
            <param-value>UTF-8</param-value>
            <!-- The encoding of the template files. -->
        </init-param>
        <init-param>
            <param-name>number_format</param-name>
            <param-value>0.##########</param-value>
        </init-param>

        <load-on-startup>1</load-on-startup>
    </servlet>

    <servlet-mapping>
        <servlet-name>freemarker</servlet-name>
        <url-pattern>*.ftl</url-pattern>
    </servlet-mapping>

</web-app>
```
2. /WEB-INF/ 폴더에 [axu4j.tld](https://github.com/axisj-com/axu4j/raw/master/axu4j-tag/src/main/resources/META-INF/axu4j.tld) 파일 복사
3. *.ftl 파일 생성
```xml
<#assign ax=JspTaglibs["/WEB-INF/axu4j.tld"]>
<@ax.layout name="base.html">
    <@ax.div name="title">[Feemarker Sample]</@ax.div>
    <@ax.div name="header">
        <h1>Feemarker Sample</h1>
        <p class="desc">
            이 페이지는 Freemarker에서 AXU4J를 사용하는 예제입니다.
        </p>
    </@ax.div>
    <@ax.div name="contents">
        ...
    </@ax.div>
</@ax.layout>
```

## trouble shooting
1. [JDK 1.5 구동문제](https://github.com/hyunjun19/axu4j/issues/39)
