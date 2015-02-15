<%@ page import="java.util.*"
%><%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><%

%><ax:layout name="base.jsp">
    <ax:set name="title" value="메인페이지" scope="" />
	<ax:div name="header">
		<h1>Hello AXU4j</h1>
		<p class="desc">메인페이지</p>
	</ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="12">

			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
		<script type="text/javascript">
            var page_menu_id = "m0101";
		</script>
	</ax:div>
</ax:layout>