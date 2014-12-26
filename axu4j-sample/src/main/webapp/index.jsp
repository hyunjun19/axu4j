<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:extends name="base">
	<ax:put block="styles">
		<style type="text/css">
			.AXGridTable td { white-space: normal; }
		</style>
	</ax:put>
	<ax:put block="header">
		<h1>Hello AXU4j</h1>
		<p class="desc">AXU4J를 소개합니다.</p>
	</ax:put>
	<ax:put block="contents">
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
								<td>
									<div class="tdRel">Tag</div>
								</td>
								<td>
									<div class="tdRel">attributes</div>
								</td>
								<td>
									<div class="tdRel">desc</div>
								</td>
								<td>
									<div class="tdRel">example</div>
								</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>block</td>
								<td>name</td>
								<td>기본 레이아웃이 되는 페이지에서 특정 내용이 삽입 될 구역을 지정합니다.</td>
								<td><pre>&lt;ax:block name="header" /&gt;</pre></td>
							</tr>
							<tr>
								<td>extends</td>
								<td>name</td>
								<td>지정된(name) 레이아웃 파일을 적용합니다.</td>
								<td>
<pre>&lt;ax:extends name="base"&gt;
	// TODO 내용을 작성합니다.
	...
&lt;/ax:extends&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>put</td>
								<td>block, type</td>
								<td>extends에서 지정된 레이아웃의 block 구역에 내용을 삽입합니다.</td>
								<td>
<pre>&lt;ax:extends name="base"&gt;
	&lt;ax:put block="header" type="REPLACE"&gt;
		// TODO 내용을 작성합니다.
		...
	&lt;/ax:put&gt;
&lt;/ax:extends&gt;</pre>
								</td>
							</tr>
							<tr>
								<td>row</td>
								<td>id, css, style</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>col</td>
								<td>id, size, css, style</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>form</td>
								<td>id, name, method, action, css, style</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>fields</td>
								<td>id, css, style</td>
								<td></td>
								<td></td>
							</tr>
							<tr>
								<td>field</td>
								<td>id, label, title, css, style</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
					</table>
				</div>
			</ax:col>
		</ax:row>
	</ax:put>
	<ax:put block="scripts">
		<script type="text/javascript">
		</script>
	</ax:put>
</ax:extends>