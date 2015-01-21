<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:layout name="base">
	<ax:div name="styles">
		<style type="text/css">
			.AXGridTable td { white-space: normal; }
			.AXGridTable a { text-decoration: underline; }
			.point { color: #FC3838; }
		</style>
	</ax:div>
	<ax:div name="header">
		<h1>Hello AXU4j</h1>
		<p class="desc">AXU4J를 소개합니다.</p>
	</ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="12">
				<div class="ax-box-wrap">
					<h2>
						AXU4J는 AXU(https://github.com/axisj-com/axu)를 Java에서 보다 쉽게 사용하기 위해서 만든 템플릿/태그 엔진입니다.
					</h2>
					<table cellpadding="0" cellspacing="0" class="AXGridTable">
						<colgroup>
							<col width="100px" />
							<col width="30%" />
							<col width="30%" />
							<col width="40%" />
						</colgroup>
						<thead>
							<tr>
								<td><div class="tdRel">tag</div></td>
								<td><div class="tdRel">attributes</div></td>
								<td><div class="tdRel">desc</div></td>
								<td><div class="tdRel">example</div></td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>내장객체</td>
								<td>
									param  : {{param}}<br/>
									request: {{request}}<br/>
									session: {{session}}<br/>
									cookie : {{cookie}}
								</td>
								<td>
									layout에서 사용 가능한 내장 객체<br/>
									param   : 요청 매개변수의 기본 값을 이름으로 저장하는 Map<br/>
									request : 요청 범위 애트리뷰트 이름과 값과 관련된 Map<br/>
									session : 세션 범위 애트리뷰트 이름과 값과 관련된 Map<br/>
									cookie  : 요청에 수반되는 쿠키들을 이름으로 저장하는 Map
									<br/><br/>
									<h3 class="point">※ layout으로 사용되는 HTML파일에서만 사용이 가능합니다.</h3>
								</td>
								<td>
<pre>{{params.name}}
{{request.name}}
{{session.name}}
{{cookie.name}}</pre>
								</td>
							</tr>
							<tr>
								<td>layout</td>
								<td>
									# name: 페이지에 사용할 layout name입니다. axu4j.xml에 설정한 prefix(default: /WEB-INF/layouts/)와 suffix(default: .html)를 제외한 파일명을 그대로 사용하면 됩니다.
								</td>
								<td>
									페이지에 사전에 정의한 레이아웃을 적용하는 tag입니다.<br/>
									레이아웃 페이지는 HTML 파일로 작성을 하며 mustache 문법을 사용해서 원하는 부위에 내용을 위치할 수 있습니다.<br/>
									레이아웃 페이지에 {{name}}(HTML escaped), {{{name}}}의 표현식을 사용하면 div tag의 내용이 해당 위치에 삽입됩니다.
								</td>
								<td>
<pre>&lt;ax:layout name="base"&gt;
	...
&lt;/ax:layout&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>row</td>
								<td>
									# id: tag의 id입니다. 기본값은 자동으로 생성됩니다.<br/>
									# css: tag에 추가될 class 입니다.<br/>
									# style: tag에 추가될 style 입니다.
								</td>
								<td><a href="https://www.axisj.com/ko/axu/docs#axu-3" target="_blank">악수 그리드 시스템</a>을 사용하기 위한 row tag입니다.</td>
								<td>
<pre>&lt;ax:row&gt;
	&lt;ax:col size="12"&gt;
		...
	&lt;/ax:col&gt;
&lt;/ax:row&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>col</td>
								<td>
									# id: tag의 id입니다. 기본값은 자동으로 생성됩니다.<br/>
									# size: 가로 길이를 의미하며 1 ~ 12 까지 지정할 수 있습니다.<br/>
									# css: tag에 추가될 class 입니다.<br/>
									# style: tag에 추가될 style 입니다.
								</td>
								<td>
									<a href="https://www.axisj.com/ko/axu/docs#axu-3" target="_blank">악수 그리드 시스템</a>을 사용하기 위한 col tag입니다.<br/>
									 하나의 row tag 안에 col tag size의 합은 12가 되어야 합니다.
								</td>
								<td>
<pre>&lt;ax:row&gt;
	&lt;ax:col size="4"&gt;
		...
	&lt;/ax:col&gt;
	&lt;ax:col size="8"&gt;
		...
	&lt;/ax:col&gt;
&lt;/ax:row&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>form</td>
								<td>
									# id: tag의 id입니다. 기본값은 자동으로 생성됩니다.<br/>
									# name: HTML form의 name입니다. 기본값은 id값 입니다.<br/>
									# method: HTML form의 method입니다. 기본값은 POST값 입니다.<br/>
									# action: HTML form의 action입니다.<br/>
									# css: tag에 추가될 class 입니다.<br/>
									# style: tag에 추가될 style 입니다.
								</td>
								<td>HTML form과 동일하며 form외에 레이아웃과 스타일적 요소를 추가적으로 가지고 있습니다.</td>
								<td>
<pre>&lt;ax:form name="table-form"&gt;
	...
&lt;/ax:form&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>fields</td>
								<td>
									# id: tag의 id입니다. 기본값은 자동으로 생성됩니다.<br/>
									# css: tag에 추가될 class 입니다.<br/>
									# style: tag에 추가될 style 입니다.
								</td>
								<td>form tag 내부에서 row의 역할을 하는 tag 입니다.</td>
								<td>
<pre>&lt;ax:form name="table-form"&gt;
	&lt;ax:fields&gt;
		...
	&lt;/ax:fields&gt;
	&lt;ax:fields&gt;
		...
	&lt;/ax:fields&gt;
&lt;/ax:form&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>field</td>
								<td>
									# id: tag의 id입니다. 기본값은 자동으로 생성됩니다.<br/>
									# label: 입력 항목명 입니다.<br/>
									# title: 입력 항목에 대한 설명을 입력합니다. HTML title attribute입니다.<br/>
									# css: tag에 추가될 class 입니다.<br/>
									# style: tag에 추가될 style 입니다.
								</td>
								<td>fields tag 내부에서 컬럼처럼 사용되는 tag입니다.</td>
								<td>
<pre>&lt;ax:form name="table-form"&gt;
	&lt;ax:fields&gt;
		&lt;ax:field label="번호"&gt;
			&lt;input type="text" ... /&gt;
		&lt;/ax:field&gt;
	&lt;/ax:fields&gt;
	&lt;ax:fields&gt;
		&lt;ax:field label="이메일"&gt;
			&lt;input type="text" ... /&gt;
		&lt;/ax:field&gt;
	&lt;/ax:fields&gt;
&lt;/ax:form&gt;</pre>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
		<script type="text/javascript">
		</script>
	</ax:div>
</ax:layout>