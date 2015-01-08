<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:layout name="basem">
	<ax:div name="title">new layout engine test</ax:div>
	<ax:div name="styles">
		<style type="text/css">
			.AXGridTable td { white-space: normal; }
			.AXGridTable a { text-decoration: underline; }
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
				</div>
			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
		<script type="text/javascript">
		</script>
	</ax:div>
</ax:layout>