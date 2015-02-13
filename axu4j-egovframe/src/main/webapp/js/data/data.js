var topMenu_data = [
	{_id:"m01", label:"시작", url:"/", cn:[
		{_id:"m0101", label:'AXU4J 홈', url:"main.do"},
		{_id:"m0102", label:'AXU4J 도움말', url:"help.do"},
		{_id:"m0103", label:'AXU4J Samples', url:"list.do", cn:[
			{_id:"m010301", label:'게시판', url:"list.do"},
			{_id:"m010302", label:'그리드 샘플', url:"main.do"},
			{_id:"m010302", label:'폼 샘플', url:"main.do"},
			{_id:"m010302", label:'Split 샘플', url:"main.do"}
		]}
	]},
	{_id:"m02", label:"정보마당", url:"#ax"},
	{_id:"m03", label:"고객지원", url:"#ax"},
	{_id:"m04", label:"알림마당", url:"#ax"},
	{_id:"m05", label:"사이트관리(관리자)", url:"#ax"}
];

var sideMenu_data = [
	{label:'<i class="axi axi-home"></i> AXU4J 홈', url:"main.do", target:"_self"},
	{label:'<i class="axi axi-help"></i> AXU4J 도움말', url:"help.do", target:"_self"},
	{label:'<i class="axi axi-asterisk"></i> 관리자설정', url:"#ax", target:"_self"},
	{label:'<i class="axi axi-columns"></i> 레이아웃', url:"#ax", target:"_self"},
	{label:'<i class="axi axi-pagelines"></i> 페이지', url:"#ax", target:"_self"},
	{label:'<i class="axi axi-sitemap"></i> 사이트맵', url:"#ax", target:"_self"},
	{label:'<i class="axi axi-archive"></i> 모듈', url:"#ax", target:"_self"},
	{label:'<i class="axi axi-bar-chart-o"></i> 접속통계', url:"#ax", target:"_self"}
];