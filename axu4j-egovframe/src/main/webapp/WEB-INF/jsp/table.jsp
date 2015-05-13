<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><ax:layout name="base.jsp">
    <ax:set name="title" value="테이블" />
    <ax:set name="page_desc" value="기본 테이블 샘플 코드" />
	<ax:div name="header">
		<h1>${title}</h1>
		<p class="desc">${page_desc}</p>
	</ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="12" wrap="false">
				<ax:table css="AXFormTable">
					<ax:tr>
						<ax:td>td1</ax:td>
						<ax:td>td2</ax:td>
						<ax:td>td3</ax:td>
					</ax:tr>
                    <ax:tr>
                        <ax:td>td4</ax:td>
                        <ax:td>td5</ax:td>
                        <ax:td>td6</ax:td>
                    </ax:tr>
				</ax:table>
			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
	    <script type="text/javascript">
	    var page_menu_id = "m010302";
	    var fnObj = {
	        pageStart: function(){
	        }
	    };
	    </script>
	</ax:div>
</ax:layout>