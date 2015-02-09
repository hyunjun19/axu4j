<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><ax:layout name="base.html">
	<ax:div name="header">
		<h1>페이지 제목</h1>
		<p class="desc">컨텐츠 상세 설명을 넣어주세요.</p>
	</ax:div>
	<ax:div name="contents">
		<ax:row>
			<ax:col size="12" wrap="false">
				<div class="ax-search" id="page-search-box"></div>
				<div class="ax-button-group">
				    <div class="left">
				        <button type="button" class="AXButton Blue" id="ax-grid-btn-regist"><i class="axi axi-plus-circle"></i> 등록</button>
				        <button type="button" class="AXButton" id="ax-grid-btn-remove"><i class="axi axi-minus-circle"></i> 삭제</button>
				    </div>
				    <div class="right">
				        <button type="button" class="AXButton Blue" id="ax-search-btn-search"><i class="axi axi-ion-android-search"></i> 검색</button>
				    </div>
				    <div class="ax-clear"></div>
				</div>
				<div class="ax-grid" id="page-grid-box"></div>
			</ax:col>
		</ax:row>
	</ax:div>
	<ax:div name="scripts">
	    <script type="text/javascript">
	    var page_menu_id = "m020201";
	    var fnObj = {
	        pageStart: function(){
	            this.search.bind();
	            this.grid.bind();
	            this.modal.bind();
	            this.bindEvent();
	        },
	        bindEvent: function(){
	            var _this = this;
	            axdom("#ax-search-btn-search").bind("click", function(){
	                _this.search.submit();
	            });
	        },
	        search: {
	            target: new AXSearch(),
	            get: function(){ return this.target },
	            bind: function(){
	                var _this = this;
	                this.target.setConfig({
	                    targetID:"page-search-box",
	                    theme : "AXSearch",
	                    mediaQuery: {
	                        mx:{min:0, max:767}, dx:{min:767}
	                    },
	                    onsubmit: function(){
	                        // 버튼이 선언되지 않았거나 submit 개체가 있는 경우 발동 합니다.
	                    },
	                    rows:[
	                        {display:false, addClass:"gray", style:"", list:[
	                            {label:"공개설정", labelWidth:"100", type:"link", width:"", key:"openType", addClass:"", valueBoxStyle:"", value:"open",
	                                options:[
	                                    {optionValue:"all", optionText:"전체보기"},
	                                    {optionValue:"open", optionText:"공개"},
	                                    {optionValue:"close", optionText:"비공개"},
	                                    {optionValue:"close2", optionText:"비공개2", display:false},
	                                    {optionValue:"close3", optionText:"비공개3", display:false},
	                                    {optionValue:"close4", optionText:"비공개4", display:false}
	                                ],
	                                onChange: function(selectedObject, value){
	                                    //아래 3개의 값을 사용 하실 수 있습니다.
	                                    trace(this);
	                                    trace(selectedObject);
	                                    toast.push(value);
	                                }
	                            }
	                        ]},
	                        {display:true, addClass:"", style:"", list:[
	                            {label:"사원명", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
	                                options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                                AXBind:{
	                                    type:"select", config:{
	                                        onChange:function(){
	                                            //toast.push(Object.toJSON(this));
	
	                                        }
	                                    }
	                                }
	                            },
	                            {label:"", labelWidth:"", type:"inputText", width:"150", key:"inputText", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"ABCD",
	                                onChange: function(changedValue){
	                                    //아래 2개의 값을 사용 하실 수 있습니다.
	                                    toast.push(Object.toJSON(this));
	                                    //dialog.push(changedValue);
	                                }
	                            },
	                            {label:"", type:"button", width:"40", key:"button", addClass:"Green", valueBoxStyle:"padding-left:0px;", value:"찾기",
	                                onclick: function(){
	                                    // 찾기 모달 열기
	                                    fnObj.modal.open("memberFinder", {
	                                        url:"modal-tree.php", pars:"",
	                                        width:400
	                                    });
	                                }
	                            }
	                        ]},
	                        {display:false, addClass:"", style:"", list:[
	                            {label:"체크박스류", labelWidth:"100", type:"checkBox", width:"", key:"checkbox", addClass:"asfasd", valueBoxStyle:"", value:"open,close",
	                                options:[{optionValue:"all", optionText:"전체보기", title:"체크박스"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                                onChange: function(selectedObject, value){
	                                    //아래 3개의 값을 사용 하실 수 있습니다.
	                                    trace(this);
	                                    trace(selectedObject);
	                                    toast.push(value);
	                                }
	                            },
	                            {label:"라디오류", labelWidth:"100", type:"radioBox", width:"", key:"radiobox", addClass:"secondItem", valueBoxStyle:"", value:"close",
	                                options:[{optionValue:"all", optionText:"전체보기", title:"라디오타이틀"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                                onChange: function(selectedObject, value){
	                                    //아래 3개의 값을 사용 하실 수 있습니다.
	                                    trace(this);
	                                    trace(selectedObject);
	                                    toast.push(value);
	                                }
	                            }
	                        ]},
	                        {display:false, addClass:"", style:"", list:[
	                            {label:"생각없이만들기", labelWidth:"100", type:"checkBox", width:"", key:"checkbox3", addClass:"", valueBoxStyle:"", value:"",
	                                options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                                onChange: function(){}
	                            },
	                            {label:"", labelWidth:"", type:"radioBox", width:"", key:"radiobox3", addClass:"secondItem", valueBoxStyle:"", value:"",
	                                options:[{optionValue:"", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
	                                onChange: function(){}
	                            }
	                        ]}
	                    ]
	                });
	            },
	            submit: function(){
	                var pars = this.target.getParam();
	                toast.push("콘솔창에 파라미터 정보를 출력하였습니다.");
	                trace(pars);
	            }
	        },
	        grid: {
	            target: new AXGrid(),
	            get: function(){ return this.target },
	            bind: function(){
	
	                this.target.setConfig({
	                    targetID : "page-grid-box",
	                    theme : "AXGrid",
	                    mediaQuery: {
	                        mx:{min:0, max:767}, dx:{min:767}
	                    },
	                    colGroup : [
	                        {key:"no", label:"번호", width:"40", align:"center", formatter:"money"},
	                        {key:"title", label:"제목", width:"200"},
	                        {key:"writer", label:"작성자", width:"90", align:"center"},
	                        {key:"regDate", label:"작성일", width:"90", align:"center"},
	                        {key:"desc", label:"비고", width:"*"}
	                    ],
	                    view: {
	                        label:true,
	                        column: [ // col 은 4
	                            {key:"title", label:"제목", col:4, addClass:"underLine"},
	                            {key:"no", label:"번호", col:1},
	                            {key:"desc", label:"비고", col:3},
	                            {key:"writer", label:"작성자"},
	                            {key:"regDate", label:"작성일"},
	                            {key:"", label:"사용자연산", formatter: function(){
	                                return (this.item.no * 987).money();
	                            }}
	                        ],
	                        buttons: [
	                            {addClass:"handle", onclick:function(){
	                                toast.push("handle Click");
	                                trace(this.item);
	                            }}
	                        ]
	                    },
	                    body : {
	                        onclick: function(){
	                            //toast.push(Object.toJSON({index:this.index, item:this.item}));
	                            //alert(this.list);
	                            //alert(this.page);
	                            fnObj.modal.open("gridView", {
	                                url:"modal.jsp", pars:"no=" + this.item.no
	                            });
	                        }
	                    },
	                    page:{
	                        paging:true,
	                        pageNo:1,
	                        pageSize:100,
	                        status:{formatter: null}
	                    }
	                });
	
	                this.target.setList({
	                    ajaxUrl:"<c:url value='/data/list.json' />", ajaxPars:"param1=1&param2=2", onLoad:function(){
	                        //trace(this);
	                    }
	                });
	            }
	        },
	        modal: {
	            target: new AXModal(),
	            get: function(){ return this.target },
	            bind: function(){
	                window.myModal = this.target;
	                this.target.setConfig({
	                    windowID:"myModalContainer",
	                    mediaQuery: {
	                        mx:{min:0, max:767}, dx:{min:767}
	                    },
	                    displayLoading:true
	                });
	            },
	            open: function(type, http){
	                this.target.open({
	                    url: http.url,
	                    pars: http.pars.queryToObject(),
	                    top: ( (typeof http.top == "undefined") ? 100 : http.top ),
	                    width: ( (typeof http.width == "undefined") ? 900 : http.width ),
	                    closeByEscKey: true
	                });
	            }
	        }
	    };
	    </script>
	</ax:div>
</ax:layout>