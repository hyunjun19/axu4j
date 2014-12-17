<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:extends name="modal">
	<ax:put block="header" type="REPLACE">
		<h1>컨텐츠 제목</h1>
	</ax:put>
	<ax:put block="contents">
		<ax:form name="table-form" method="get">
			<ax:fields>
				<ax:field label="번호">
					<input type="text" name="user_key" title="" placeholder="" value="" class="AXInput" style="width:50px;" readonly="readonly" />
				</ax:field>
			</ax:fields>
			<ax:fields>
				<ax:field label="이메일">
					<input type="text" name="email_id" title="" placeholder="" value="" class="AXInput av-email av-required" />
				</ax:field>
			</ax:fields>
			<ax:fields>
				<ax:field label="비밀번호">
					<input type="password" name="passwd" title="" placeholder="" value="" class="AXInput av-required" style="width:150px;" />
				</ax:field>
			</ax:fields>
			<ax:fields>
				<ax:field label="레벨">
					<select name="user_lvl" class="AXSelect" id="user_lvl">
                        <option value="1">최고관리자</option>
                        <option value="2">관리자</option>
                    </select>
				</ax:field>
				<ax:field label="만든 날짜">
					<input type="text" name="reg_dt" id="reg_dt" title="" placeholder="" value="" class="AXInput" style="width:120px;" />
				</ax:field>
			</ax:fields>
			<ax:fields>
				<ax:field label="Number">
					<input type="number" class="AXInput" id="AXInput-number" />
				</ax:field>
				<ax:field label="Segment">
					<input type="text" class="AXInput" id="AXInput-segment" />
				</ax:field>
			</ax:fields>
			<ax:fields>
				<ax:field label="Slider">
					<input type="text" class="AXInput" id="AXInput-slider" value="200~700" style="width:250px;" />
				</ax:field>
				<ax:field label="Selector">
					<input type="text" class="AXInput" id="AXInput-selector" />
				</ax:field>
			</ax:fields>
		</ax:form>
	</ax:put>
	<ax:put block="buttons">
		<button type="button" class="AXButton" onclick="parent.myModal.close();">확인</button>
		<button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
	</ax:put>
	<ax:put block="scripts">
		<script type="text/javascript">
		var fnObj = {
			pageStart: function(){
	            $("#reg_dt").bindDate();
	            $("#AXInput-number").bindNumber();
	            $("#AXInput-segment").bindSegment({
	                options:[
	                    {optionValue:0, optionText:"왼쪽"},
	                    {optionValue:1, optionText:"가운데"},
	                    {optionValue:2, optionText:"오른쪽"}
	                ],
	                onChange:function(){
	                    //this.targetID, this.options, this.selectedIndex, this.selectedOption
	                    toast.push(Object.toJSON({targetID:this.targetID, options:this.options, selectedIndex:this.selectedIndex, selectedOption:this.selectedOption}));
	                }
	            });
	            $("#AXInput-slider").bindTwinSlider({min:0, max:1000, separator:"~", unit:"E", snap:100});
	            $("#AXInput-selector").bindSelector({
	                direction:"bottom",
	                appendable:true,
	                options:[
	                    {optionValue:1, optionText:"Seoul"},
	                    {optionValue:2, optionText:"대구"},
	                    {optionValue:3, optionText:"대전"},
	                    {optionValue:4, optionText:"창원"},
	                    {optionValue:5, optionText:"마산"},
	                    {optionValue:6, optionText:"구례"},
	                    {optionValue:7, optionText:"제주도"},
	                    {optionValue:8, optionText:"전주"},
	                    {optionValue:4, optionText:"창원"},
	                    {optionValue:5, optionText:"마산"},
	                    {optionValue:6, optionText:"구례"},
	                    {optionValue:7, optionText:"제주도"},
	                    {optionValue:8, optionText:"전주"},
	                    {optionValue:9, optionText:"Gwangju"}
	                ]
	            });
	            $(".AXSelect").bindSelect();
			},
	        pageResize: function(){
	            parent.myModal.resize();
	        }
		};
	    axdom(window).ready(fnObj.pageStart);
	    axdom(window).resize(fnObj.pageResize);
		</script>
	</ax:put>
</ax:extends>