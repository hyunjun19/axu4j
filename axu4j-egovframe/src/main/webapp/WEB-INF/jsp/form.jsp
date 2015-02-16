<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
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

                <h2>반응형 테이블 / 입력도구</h2>
                <ax:form name="table-form" method="get">
                    <ax:fields>
                        <ax:field label="번호">
                            <input type="text" name="" id="ax-inp-number" class="AXInput W100" />
                        </ax:field>
                        <ax:field label="통화단위">
                            <input type="text" name="" id="ax-inp-money" class="AXInput" />
                        </ax:field>
                    </ax:fields>
                    <ax:fields>
                        <ax:field label="Switch">
                            <input type="text" name="" id="ax-inp-switch" class="AXInput W50" />
                        </ax:field>
                        <ax:field label="Segment">
                            <input type="text" name="" id="ax-inp-segment" class="AXInput" />
                        </ax:field>
                    </ax:fields>
                    <ax:fields>
                        <ax:field label="Slider">
                            <input type="text" name="" id="ax-inp-slider" class="AXInput W200" />
                        </ax:field>
                    </ax:fields>
                    <ax:fields>
                        <ax:field label="Selector">
                            <input type="text" name="" id="ax-inp-selector" class="AXInput" />
                        </ax:field>
                        <ax:field label="Select">
                            <select class="AXSelect" id="ax-select">
                                <option value="">-- 선택하세요 --</option>
                                <option value="1">%가나다라마바사</option>
                                <option value="2" selected="selected">abcdefg</option>
                                <option value="3">abcdefg 가나다라마바사</option>
                                <option value="4">abcdefg 가나다라마바사</option>
                                <option value="5">abcdefg 가나다라마바사</option>
                                <option value="6">abcdefg 가나다라마바사</option>
                            </select>
                        </ax:field>
                    </ax:fields>
                    <ax:fields>
                        <ax:field label="Date">
                            <input type="text" name="" id="ax-inp-date" class="AXInput" />
                        </ax:field>
                    </ax:fields>
                </ax:form>
                
                <div class="H10"></div>
                <a href="http://dev.axisj.com/samples/AXInput/index.html">http://axisj:2013/samples/AXInput/index.html</a>
                <div class="H10"></div>
                
                <h2>버튼들</h2>
                
                <button class="AXButton">버튼</button>
                <button class="AXButton Red">버튼</button>
                <button class="AXButton Green">버튼</button>
                <button class="AXButton Blue">버튼</button>
                <button class="AXButton Classic">버튼</button>

                <button class="AXButton"><i class="axi axi-bmg-market"></i> 버튼</button>
                <button class="AXButtonLarge W100"><i class="axi axi-bmg-market"></i> 버튼</button>
                <button class="AXButtonSmall"><i class="axi axi-bmg-market"></i> 버튼</button>

                <div class="H10"></div>
                <a href="http://axisj:2013/samples/AXButton/index.html">http://dev.axisj.com/samples/AXButton/index.html</a>
                <div class="H10"></div>
                
                <h2>조합형</h2>
                <div id="ax-grid-target"></div>

            </ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
	    <script type="text/javascript">
	    var page_menu_id = "m010303";
        var fnObj = {
            pageStart: function(){
                
                // input 
                $("#ax-inp-number").bindNumber();
                $("#ax-inp-money").bindMoney();
                $("#ax-inp-switch").bindSwitch({off:"AM", on:"PM", onChange:function(){
                    toast.push(Object.toJSON({targetID:this.targetID, on:this.on, off:this.off, value:this.value}));
                }});
                $("#ax-inp-segment").bindSegment({
                    options:[
                        {optionValue:0, optionText:"왼쪽", addClass:"type1"},
                        {optionValue:1, optionText:"가운데", addClass:"type2"},
                        {optionValue:2, optionText:"오른쪽", addClass:"type3"}
                    ],
                    onChange:function(){
                        //this.targetID, this.options, this.selectedIndex, this.selectedOption
                        toast.push(Object.toJSON({targetID:this.targetID, options:this.options, selectedIndex:this.selectedIndex, selectedOption:this.selectedOption}));
                    }
                });
                $("#ax-inp-slider").bindSlider({min:0, max:100, snap:10, unit:"%"});
                $("#ax-inp-selector").bindSelector({
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
                $("#ax-select").bindSelect();
                $("#ax-inp-date").bindDate();


                window.myGrid = new AXGrid();
                myGrid.setConfig({
                    targetID : "ax-grid-target",
                    theme : "AXGrid",
                    //viewMode: "grid", // ["grid","icon","mobile"]
                    // 브라우저 사이즈에 따른 changeGridView 설정
                    mediaQuery: {
                        mx:{min:0, max:600}, dx:{min:600}
                    },
                    colGroup : [
                        {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
                        {key:"title", label:"제목", width:"200"},
                        {key:"writer", label:"작성자", width:"100", align:"center"},
                        {key:"date", label:"작성일", width:"100", align:"center"},
                        {key:"desc", label:"비고", width:"*"}
                    ],

                    body : {
                        onclick: function(){
                            toast.push(Object.toJSON({index:this.index, item:this.item}));
                            //alert(this.list);
                            //alert(this.page);
                        }
                    },
                    page:{
                        paging:false,
                        status:{formatter: null}
                    }
                });

                var list = [
                    {no:1, title:"AXGrid 첫번째 줄 입니다.AXGrid 첫번째 줄 입니다.AXGrid 첫번째 줄 입니다.",
                        writer:"장기영", img:"img/1.jpg", desc:"많은 글을 담고 있는 내용 입니다. 자연스럽게 줄이 넘어가고 표현되는 것이 관건 입니다.",
                        category:"액시스제이", date:"2014-04-02"
                    }, // item
                    {no:2, title:"AXGrid 두번째 줄 입니다.", writer:"장기영", img:"img/2.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:3, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/3.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:4, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/4.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:5, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/5.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:6, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/6.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:7, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/7.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:8, title:"AXGrid 첫번째 줄 입니다.", writer:"장기영", img:"img/8.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:9, title:"AXGrid 두번째 줄 입니다.", writer:"장기영", img:"img/9.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:10, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/10.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:11, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/11.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:12, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/12.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:13, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/13.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:14, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/14.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:15, title:"AXGrid 두번째 줄 입니다.", writer:"장기영", img:"img/15.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:16, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/16.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:17, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/17.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:18, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/18.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:19, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/19.jpg", category:"액시스제이", date:"2014-04-02"},
                    {no:20, title:"AXGrid 세번째 줄 입니다.", writer:"장기영", img:"img/20.jpg", category:"액시스제이", date:"2014-04-02"}
                ];
                myGrid.setList(list);

            }            
        }
	    </script>
	</ax:div>
</ax:layout>