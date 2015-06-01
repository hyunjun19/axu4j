<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><ax:layout name="base-split.jsp">
    <ax:set name="title" value="Split 샘플" />
    <ax:set name="page_desc" value="Split 샘플 코드" />

	<ax:div name="contents">

        <div class="AXSplit" id="cx-spliter" style="height:500px;">
            <div class="AXSplit-cols" data-width="300">
                <div class="cx-panel">
                    <!-- panel {-->
                    <div class="p-title">
                        <div class="tit">제목</div>
                        <div class="btns">
                            <button type="button" class="AXButton Classic" data-btn="model-search"><i class="axi axi-search3"></i> 찾기</button>
                            <button type="button" class="AXButton Classic"><i class="axi axi-add-circle"></i> 추가</button>
                        </div>
                    </div>

                    <div class="H10"></div> <!-- 10 띄우기 -->

                    <div class="p-title">
                        <div class="tabs" id="tab-target"></div>
                        <div class="btns">
                            <button type="button" class="AXButton"><i class="axi axi-search3"></i> 찾기</button>
                            <button type="button" class="AXButton"><i class="axi axi-add-circle"></i> 추가</button>
                        </div>
                    </div>

                    <div class="H20"></div> <!-- 20 띄우기 -->

                    <div class="p-title">
                        <div class="tabs small" id="tab-target-1"></div>
                        <div class="btns">
                            <button type="button" class="AXButtonSmall"><i class="axi axi-search3"></i> 찾기</button>
                            <button type="button" class="AXButtonSmall"><i class="axi axi-add-circle"></i> 추가</button>
                        </div>
                    </div>

                    <div class="p-content" style="padding: 5px;" id="scroll-ct-0-0">
                        <div class="" id="grid-target-grid"></div>
                    </div>

                    <!-- panel }-->
                </div>
            </div>

            <a href="#col-resize" class="AXSplit-col-handle"></a>

            <div class="AXSplit-cols" data-width="300">
                <div class="cx-panel">
                    <!-- panel {-->
                    <!--
                    <div class="p-title">
                      <div class="tit"></div>
                    </div>
                    -->
                    <div class="p-content" id="scroll-ct-1-0">
                        <div class="" id="grid-target-list"></div>
                    </div>

                    <!-- panel }-->
                </div>
            </div>

            <a href="#col-resize" class="AXSplit-col-handle"></a>

            <div class="AXSplit-cols">
                <div class="cx-panel">
                    <!-- panel {-->

                    <div class="p-title">
                        <div class="tit">프로젝트</div>
                        <div class="btns">
                            <button type="button" class="AXButton Classic"><i class="axi axi-search3"></i> 찾기</button>
                            <button type="button" class="AXButton Classic"><i class="axi axi-add-circle"></i> 추가</button>
                        </div>
                    </div>

                    <div class="p-content">
                        <table class="padding10">
                            <colgroup>
                                <col width="100" />
                                <col />
                                <col width="100" />
                                <col />
                            </colgroup>
                            <tbody id="temp-form-body">
                            <tr>
                                <th>Title</th>
                                <td>AXISJ - AXU4J 템플릿</td>
                                <th>작성</th>
                                <td>장기영(공개) 2014-07-02</td>
                            </tr>
                            <tr>
                                <th>설명</th>
                                <td colspan="3">스프링 프레임워크를 이용하며, 컨트롤러, 서비스, 데이터 레이어3 계층구조로 구성됨</td>
                            </tr>
                            <tr>
                                <th>아키텍처 옵션</th>
                                <td colspan="3">Spring, MVC모델</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="p-line"></div><!-- 한줄 긋기 -->

                    <div class="p-title">
                        <div class="tabs" id="tab-target-2"></div>
                        <div class="btns">
                            <button type="button" class="AXButton"><i class="axi axi-plus2"></i> 코드생성</button>
                            <!--<button type="button" class="AXButton"><i class="axi axi-ion-code-download"></i> 다운받기</button>-->
                        </div>
                    </div>
                    <div class="H10" style="height: 3px;"></div>
                    <div class="p-line"></div><!-- 한줄 긋기 -->
                    <div class="" id="codeEditor"></div>
                    <div class="p-line"></div><!-- 한줄 긋기 -->
                    <!-- panel }-->
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>

        
	</ax:div>
	<ax:div name="scripts">
	    <script type="text/javascript">
	    var page_menu_id = "m010304";
        var fnObj = {
            // 창의 크기가 변경 되었을 때 재 조정 되어야 하는 아이템 목록 adjust값을 창 높이에서 제하고 해당 아이템의 높이를 변경합니다. 또한. 사이즈 조정후에 h를 after에 넘겨줄 수 있습니다.
            resized_targets: [
                {
                    dom   : $("#scroll-ct-1-0"),
                    adjust: 123
                },
                {
                    dom   : $("#codeEditor"),
                    adjust: function () {
                        return 123 + 40 + $("#temp-form-body").height();
                    },
                    after : function (h) {
                        fnObj.code.setSize(h);
                    }
                },
                {
                    dom: $("#grid-target-grid"),
                    adjust: 280,
                    after : function (h) {
                        fnObj.grid_grid.target.resetHeight();
                    }
                }
            ],
            // 페이지 시작
            pageStart: function(){

                this.tab_0.bind(); // 탭
                this.tab_1.bind(); // 탭
                this.tab_2.bind(); // 코드미러 위 탭
                this.code.init(); // 코드미러
                this.grid_grid.bind(); // 그리드 타입
                this.grid_list.bind(); // 리스트 타입
                this.modal.init();

                this.bindEvent(); // 각종 이벤트 바인딩
                this.pageResize(); // 페이지 각종 아이템 높이 조절

            },
            // 페이지 크기 리사이즈
            pageResize: function(){
                //trace("페이지 리사이즈 이벤트"); // 이곳에서 창 리사이즈를 캐치 하여 처리 합니다.
                
                var ch = axf.clientHeight();
                $.each(this.resized_targets, function(){
                    var adj = 0, h;
                    if(Object.isFunction(this.adjust)){
                        adj = this.adjust();
                    }
                    else{
                        adj = this.adjust;
                    }
                    h = ch - adj;
                    this.dom.css({height:h});
                    if(Object.isFunction(this.after)) {
                        this.after(h);
                    }
                });
            },
            bindEvent: function(){
                $('[data-btn="model-search"]').bind("click", function(){
                    fnObj.modal.open("model-search");
                });
            },

            modal: {
                target: new AXModal(),
                init: function(){
                    window.myModal = this.target;
                    this.target.setConfig({
                        windowID:"myModalContainer",
                        mediaQuery: {
                            mx:{min:0, max:767}, dx:{min:767}
                        },
                        displayLoading:true
                    });
                },
                open: function(type, item){
                    myModal.open({
                        url:"modal.do",
                        pars:"a=1&b=2&c=3".queryToObject(),
                        top:50, width:800,
                        closeByEscKey:true
                    });
                }
            },
            tab_0: {
                bind: function(){
                    $("#tab-target").bindTab({
                        theme : "AXTabs",
                        value:"M",
                        overflow:"visible", /* "visible" */
                        options:[
                            {optionValue:"M", optionText:"코드A"},
                            {optionValue:"T", optionText:"코드B"}
                        ],
                        onchange: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onchange: "+Object.toJSON(value));
                        },
                        onclose: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onclose: "+Object.toJSON(value));
                        }
                    });
                }
            },
            tab_1: {
                bind: function(){
                    $("#tab-target-1").bindTab({
                        theme : "AXTabs",
                        value:"M",
                        overflow:"visible", /* "visible" */
                        options:[
                            {optionValue:"M", optionText:"코알라A"},
                            {optionValue:"T", optionText:"꼬끼리"}
                        ],
                        onchange: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onchange: "+Object.toJSON(value));
                        },
                        onclose: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onclose: "+Object.toJSON(value));
                        }
                    });
                }
            },
            tab_2: {
                bind: function(){
                    $("#tab-target-2").bindTab({
                        theme : "AXTabs",
                        value:"0",
                        overflow:"visible", /* "visible" */
                        options:[
                            {optionValue:"0", optionText:"M"},
                            {optionValue:"1", optionText:"V", closable:true},
                            {optionValue:"2", optionText:"C", closable:true}
                        ],
                        onchange: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onchange: "+Object.toJSON(value));
                        },
                        onclose: function(selectedObject, value){
                            //toast.push(Object.toJSON(this));
                            //toast.push(Object.toJSON(selectedObject));
                            toast.push("onclose: "+Object.toJSON(value));
                        }
                    });
                }
            },
            code: {
                path:"",
                pathTyp:"virtual",
                target: null,
                init: function(){
                    fnObj.code.target = CodeMirror(axf.getId("codeEditor"), {
                        value: "",
                        mode: "application/x-ejs",
                        theme: "eclipse",

                        indentUnit: 4,
                        smartIndent: true,
                        tabSize: 4,
                        indentWithTabs: true,

                        styleActiveLine: true,
                        lineNumbers: true,
                        lineWrapping: true,
                        matchBrackets: true,
                        foldGutter: true,
                        gutters: ["CodeMirror-lint-markers","CodeMirror-foldgutter"],

                        autoCloseBrackets:true,
                        autoCloseTags:true
                    });
                },
                setSize: function(height){
                    fnObj.code.target.setSize("100%", height - 45);
                },
                setValue: function(value){
                    fnObj.code.target.setValue(value);
                }
            },
            grid_grid: {
                target: new AXGrid(),
                bind: function(){
                    var grid = this.target;
                    this.target.setConfig({
                        targetID : "grid-target-grid",
                        theme : "AXGrid",
                        colGroup : [
                            {key:"no", label:"속성", width:"80", editor:{type:"text"}},
                            {key:"title", label:"속성명(한글)", width:"80", editor:{type:"text"}},
                            {key:"date", label:"데이터유형", width:"80", editor:{type:"text"}}
                        ],
                        body : {
                            onclick: function(){
                                toast.push(Object.toJSON({index:this.index, item:this.item}));
                                //alert(this.list);
                                //alert(this.page);
                            }
                        },
                        view: {
                            label:true,
                            column: [ // col 은 4
                                {key:"title", label:"제목", col:4, addClass:"underLine"},
                                {key:"no", label:"번호", col:2, align:"right"},
                                {key:"date", label:"일자", col:2, align:"center"}
                            ]
                        },
                        page:{
                            paging:false
                        },
                        contextMenu: {
                            theme:"AXContextMenu", // 선택항목
                            width:"150", // 선택항목
                            menu:[
                                {
                                    need_data:false, label: "<i class='axi axi-plus-square'></i> 추가하기",
                                    onclick: function () {
                                        grid.pushList({title:"noname"});
                                    }
                                },
                                {
                                    need_data:true, label: "<i class='axi axi-minus-square'></i> 삭제하기",
                                    onclick: function () {
                                        var select = grid.getSelectedItem();
                                        if(!select.error){
                                            var idxs = [].concat(select.index), remove_idxs = [];
                                            axf.each(idxs, function(){
                                                remove_idxs.push({index:this});
                                            });
                                            grid.removeListIndex(remove_idxs);
                                        }
                                    }
                                }
                            ],
                            filter:function(){
                                return (this.sendObj) ? true : !this.menu.need_data;
                            }
                        }
                    });
                    this.target.setList([
                        {no:1, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:2, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:3, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:4, title:"인사정보 - 업무용", date:"2014-04-03"},
                        {no:5, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:6, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:7, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:8, title:"인사정보 - 업무용", date:"2014-04-03"},
                        {no:9, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:10, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:11, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:12, title:"인사정보 - 업무용", date:"2014-04-03"}
                    ]);
                }
            },
            grid_list: {
                target: new AXGrid(),
                bind: function(){

                    this.target.setConfig({
                        targetID : "grid-target-list",
                        theme : "AXGrid",
                        viewMode: "mobile",
                        colGroup : [
                            {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
                            {key:"title", label:"제목", width:"200"},
                            {key:"date", label:"작성일", width:"100", align:"center"}
                        ],
                        body : {
                            onclick: function(){
                                toast.push(Object.toJSON({index:this.index, item:this.item}));
                                //alert(this.list);
                                //alert(this.page);
                            }
                        },
                        view: {
                            label:true,
                            column: [ // col 은 4
                                {key:"title", label:"제목", col:4, addClass:"underLine"},
                                {key:"no", label:"번호", col:2, align:"right"},
                                {key:"date", label:"일자", col:2, align:"center"}
                            ]
                        },
                        page:{
                            paging:false
                        }
                    });
                    this.target.setList([
                        {no:1, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:2, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:3, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:4, title:"인사정보 - 업무용", date:"2014-04-03"},
                        {no:5, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:6, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:7, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:8, title:"인사정보 - 업무용", date:"2014-04-03"},
                        {no:9, title:"인사정보 - 부서모델", date:"2014-04-03"},
                        {no:10, title:"인사정보 - 경력사항 모델", date:"2014-04-03"},
                        {no:11, title:"인사정보 - 서비스용", date:"2014-04-03"},
                        {no:12, title:"인사정보 - 업무용", date:"2014-04-03"}
                    ]);
                }
            }
        };
	    </script>
	</ax:div>
</ax:layout>