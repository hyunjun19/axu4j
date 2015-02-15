<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:layout name="base.jsp">
    <ax:set name="title" value="폼 샘플" />
    <ax:set name="page_desc" value="폼 샘플 코드" />
    <ax:div name="header">
        <h1>${title}</h1>
        <p class="desc">${page_desc}</p>
    </ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="12" wrap="true">

                <h2>AXISJ Input</h2>
                
                
                
			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
	    <script type="text/javascript">
	    var page_menu_id = "m010303";

	    </script>
	</ax:div>
</ax:layout>