<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><ax:layout name="base.jsp">
    <ax:set name="title" value="그리드 샘플" />
    <ax:set name="page_desc" value="그리드 샘플 코드" />
    <ax:div name="header">
        <h1>${title}</h1>
        <p class="desc">${page_desc}</p>
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
	    var page_menu_id = "m010302";
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
                            {display:true, addClass:"gray", style:"", list:[
                                {label:"채널", labelWidth:"100", type:"link", width:"", key:"openType", addClass:"", valueBoxStyle:"", value:"open",
                                    options:[
                                        {optionValue:"all", optionText:"전체보기"},
                                        {optionValue:"open", optionText:"공개"},
                                        {optionValue:"close", optionText:"채널기본"},
                                        {optionValue:"close2", optionText:"채널선택", display:false},
                                        {optionValue:"close3", optionText:"채널A", display:false},
                                        {optionValue:"close4", optionText:"채널B", display:false}
                                    ],
                                    onChange: function(selectedObject, value){
                                        //아래 3개의 값을 사용 하실 수 있습니다.
                                        //dialog.push(Object.toJSON(this));
                                        //dialog.push(Object.toJSON(selectedObject));
                                        //dialog.push(value);
                                    }
                                }
                            ]},
                            {display:true, addClass:"gray", style:"", list:[
                                {label:"브랜드", labelWidth:"100", type:"inputText", width:"150", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                                {label:"결제번호", labelWidth:"100", type:"inputText", width:"150", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""},
                                {label:"주문번호", labelWidth:"100", type:"inputText", width:"150", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                            ]},
                            {display:true, addClass:"", style:"", list:[
                                {label:"상태", labelWidth:"100", type:"selectBox", width:"", key:"selectbox", addClass:"", valueBoxStyle:"", value:"close",
                                    options:[{optionValue:"all", optionText:"전체보기"}, {optionValue:"open", optionText:"공개"}, {optionValue:"close", optionText:"비공개"}],
                                    AXBind:{
                                        type:"select", config:{
                                            onChange:function(){
                                                //toast.push(Object.toJSON(this));

                                            }
                                        }
                                    }
                                },
                                {label:"일자", labelWidth:"", type:"inputText", width:"70", key:"inputText1", addClass:"secondItem", valueBoxStyle:"", value:"",
                                    onChange: function(){}
                                },
                                {label:"", labelWidth:"", type:"inputText", width:"90", key:"inputText2", addClass:"secondItem", valueBoxStyle:"padding-left:0px;", value:"",
                                    AXBind:{
                                        type:"twinDate", config:{
                                            align:"right", valign:"top", startTargetID:"inputText1",
                                            onChange:function(){
                                                toast.push(Object.toJSON(this));
                                            }
                                        }
                                    }
                                },
                            ]},
                            {display:true, addClass:"gray", style:"", list:[
                                {label:"구매자 이메일", labelWidth:"100", type:"inputText", width:"200", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                                {label:"구매자 전화번", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                            ]},
                            {display:false, addClass:"", style:"", list:[
                                {label:"마스터아이디", labelWidth:"100", type:"inputText", width:"", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                                {label:"채널아이디", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
                            ]},
                            {display:false, addClass:"gray", style:"", list:[
                                {label:"상품명", labelWidth:"100", type:"inputText", width:"", key:"inputText2", addClass:"", valueBoxStyle:"", value:""},
                                {label:"모델명", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""},
                                {label:"브랜드명", labelWidth:"100", type:"inputText", width:"", key:"inputText3", addClass:"secondItem", valueBoxStyle:"", value:""}
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
                        fixedColSeq: 5,
                        colGroup : [
                            {key:"no", label:"", width:"30", align:"center", formatter:"checkbox"},
                            {key:"odate", label:"주문일", width:"80", align:"center"},
                            {key:"ddate", label:"배송지입력일", width:"80"},
                            {key:"channel", label:"채널", width:"60", align:"center"},
                            {key:"orderno", label:"주문번호", width:"100", align:"center"},
                            {key:"productnm", label:"상품명", width:"150"},
                            {key:"optionnm", label:"옵션명", width:"100"},
                            {key:"modelnm", label:"모델명", width:"80"},
                            {key:"productno", label:"상품번호", width:"60"},
                            {key:"sellerproductno", label:"판매자 상품번호", width:"60"},
                            {key:"brand", label:"브랜드", width:"60"},
                            {key:"cost", label:"판매가", width:"70", formatter:"money", align:"right"},
                            {key:"amount", label:"수량", width:"50", formatter:"money", align:"right"},
                            {key:"ordercost", label:"주문금액", width:"70", formatter:"money", align:"right"},
                            {key:"receiver", label:"수령인명", width:"60"},
                            {key:"r_phone1", label:"수령인 연락처1", width:"80"},
                            {key:"r_phone2", label:"수령인 연락처2", width:"80"},
                            {key:"ostat", label:"주문상태", width:"60"},
                            {key:"delevery_type", label:"배송비 형태", width:"70"},
                            {key:"delevery_cost", label:"배송비", width:"60"},
                            {key:"delevery_msg", label:"배송메세지", width:"100"}
                        ],
                        body : {
                            onclick: function(){
                                //toast.push(Object.toJSON({index:this.index, item:this.item}));
                                //alert(this.list);
                                //alert(this.page);
                                fnObj.modal.open("gridView", this.item);
                            }
                        },
                        page:{
                            paging:true,
                            pageNo:1,
                            pageSize:100,
                            status:{formatter: null}
                        }
                    });

                    var list = [
                        {no:12, odate:'2014-12-12 19:19', ddate:'2014-12-12 19:19', channel:'액시스제이', orderno:'O99008182', productnm:'AXU 패키지', optionnm:'색상:파랑', modelnm:'ABC-0011', productno:'9980208', sellerproductno:'', brand:'', cost:54320, amount:5, ordercost:54320, receiver:'알수없음', r_phone1:'', r_phone2:'', ostat:'배송요청', delevery_type:'무료배송', delevery_cost:'0', delevery_msg:'빨리가져다주세요'},
                        {no:13, odate:'2014-12-10 19:19', ddate:'2014-12-09 19:19', channel:'AXU', orderno:'O99008183', productnm:'액시콘 패키지', optionnm:'색상:노랑', modelnm:'ABC-0012', productno:'9980208', sellerproductno:'', brand:'', cost:54320, amount:5, ordercost:54320, receiver:'알수없음', r_phone1:'', r_phone2:'', ostat:'배송요청', delevery_type:'무료배송', delevery_cost:'0', delevery_msg:'빨리가져다주세요'}
                    ]
                    var gridData = {
                        list: list,
                        page:{
                            pageNo: 1,
                            pageSize: 20,
                            pageCount: 20,
                            listCount: 2
                        }
                    };
                    this.target.setData(gridData);
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
                open: function(type, item){
                    this.target.open({
                        url:"modal.do",
                        pars:"a=1&b=2&c=3".queryToObject(),
                        top:100, width:600,
                        closeByEscKey:true
                    });
                }
            }
        };
	    </script>
	</ax:div>
</ax:layout>