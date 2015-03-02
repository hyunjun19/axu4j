<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %><%@
    taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %><%@
    taglib prefix="ax" uri="http://axisj.com/axu4j"
%><!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- TITLE -->
    <title>AXU4J ::: 폼 샘플</title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="<c:url value='/plugins/axicon/axicon.min.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/plugins/axisj/ui/cocker/AXJ.min.css' />" id="axu-theme-axisj" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/ui/cocker/admin.css' />" id="axu-theme-admin" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/ui/custom.css' />" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ css begin @@@@@@@@@@@@@@@@@@@@@@ -->
	<ax:write divname="css" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ css end   @@@@@@@@@@@@@@@@@@@@@@ -->

    <script type="text/javascript" src="<c:url value='/plugins/jquery/jquery.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/plugins/axisj/dist/AXJ.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/plugins/chartjs/Chart.min.js' />"></script>
<!-- @@@@@@@@@@@@@@@@@@@@@@ js begin @@@@@@@@@@@@@@@@@@@@@@ -->
    <ax:write divname="js" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ js end   @@@@@@@@@@@@@@@@@@@@@@ -->
    <script type="text/javascript" src="<c:url value='/js/data/data.js' />"></script>
    <script type="text/javascript" src="<c:url value='/js/common/base.js' />"></script>
</head>
<body>
<div id="AXPage">
    <ax:write divname="ax-header">
        <div class="ax-header">
            <div class="ax-wrap">
                <div class="ax-layer">
                    <div class="ax-col-12">
                        <div class="ax-unit">
                            <div class="ax-logo">
                                <a href="/main.do"><span class="logo-img"><i class="axi axi-axisj"></i></span><span class="logo-txt">AXU4J@AXISJ</span></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ax-layer">
                    <div class="ax-col-8">
                        <div class="ax-unit">
                            <!-- 상단 top-down-menu 표시 영역 : s-->
                            <div id="ax-top-menu" class="ax-top-menu AXMenuBox"></div>
                            <!-- e : 상단 top-down-menu 표시 영역 -->
                            <div class="mx-top-menu"><a id="mx-top-menu-handle" class="mx-menu-button"><i class="axi axi-th"></i></a></div>
                        </div>
                    </div>
                    <div class="ax-col-4">
                        <div class="ax-unit">
                            <ul class="ax-loginfo" id="ax-loginfo">
                                <li class="profile"><div class="photo"></div></li>
                                <li class="account"><a href="#ax">로그인사용자</a></li>
                                <li class="btns"><a href="#ax" class="AXButton" onclick="location.href = 'login.do';"><i class="axi axi-power-off"></i> 로그아웃</a></li>
                                <!--li class="lang"><a href="#ax"><i class="axi axi-keyboard-o"></i> 한국어</a></li-->
                            </ul>
                            <div class="mx-loginfo"><a id="mx-loginfo-handle" class="mx-menu-button"><i class="axi axi-bars"></i></a></div>
                        </div>
                    </div>
                    <div class="ax-clear"></div>
                </div>
            </div>
        </div>
        <div class="H60"></div>
    </ax:write>
    <!-- e ax-header -->

	<div class="ax-body">
		<div class="ax-wrap">

			<div class="ax-layer ax-title">
				<div class="ax-col-12 ax-content">
<!-- @@@@@@@@@@@@@@@@@@@@@@ header begin @@@@@@@@@@@@@@@@@@@@@@ -->
                    <h1>폼 샘플</h1>
                    <p class="desc">폼 샘플 코드</p>
<!-- @@@@@@@@@@@@@@@@@@@@@@ header end   @@@@@@@@@@@@@@@@@@@@@@ -->
				</div>
                <div class="ax-clear"></div>
			</div>

			<div class="ax-layer">
				<div class="ax-col-12 ax-content">
					<!-- s.CXPage -->
					<div id="CXPage">
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents begin @@@@@@@@@@@@@@@@@@@@@@ -->
                        <div id="row-62" class="ax-layer " style="">
                            <div id="col-62" class="ax-col-12">
                                <div class="ax-unit">
                                    <div class="ax-box " style="">
                                        <div class="ax-box-wrap">
                                            <h2>반응형 테이블 / 입력도구</h2>
                                            <form id="form-62" name="table-form" method="get" class="" style="">
                                                <div class="ax-rwd-table">
                                                    <div id="fields-52" class="item-group " style="">
                                                        <div id="field-51" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">번호</span>
		                                                        <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-number" class="AXInput W100" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div id="field-52" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">통화단위</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-money" class="AXInput" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div class="group-clear"></div>
                                                    </div>

                                                    <div id="fields-55" class="item-group " style="">
                                                        <div id="field-54" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Switch</span>
		                                                        <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-switch" class="AXInput W50" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div id="field-55" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Segment</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-segment" class="AXInput" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div class="group-clear"></div>
                                                    </div>

                                                    <div id="fields-57" class="item-group " style="">
                                                        <div id="field-57" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Slider</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-slider" class="AXInput W200" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div class="group-clear"></div>
                                                    </div>

                                                    <div id="fields-60" class="item-group " style="">
                                                        <div id="field-59" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Selector</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-selector" class="AXInput" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div id="field-60" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Select</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <select class="AXSelect" id="ax-select">
                                                                        <option value="">-- 선택하세요 --</option>
                                                                        <option value="1">%가나다라마바사</option>
                                                                        <option value="2" selected="selected">abcdefg</option>
                                                                        <option value="3">abcdefg 가나다라마바사</option>
                                                                        <option value="4">abcdefg 가나다라마바사</option>
                                                                        <option value="5">abcdefg 가나다라마바사</option>
                                                                        <option value="6">abcdefg 가나다라마바사</option>
                                                                    </select>
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div class="group-clear"></div>
                                                    </div>

                                                    <div id="fields-62" class="item-group " style="">
                                                        <div id="field-62" class="item">
                                                            <div class="item-lable">
                                                                <span class="th">Date</span>
                                                                <span class="td inputText " style="" title="">
                                                                    <input type="text" name="" id="ax-inp-date" class="AXInput" />
                                                                </span>
                                                            </div>
                                                        </div>
                                                        <div class="item-clear"></div>

                                                        <div class="group-clear"></div>
                                                    </div>
                                                </div>
                                            </form>

                                            <div class="H10"></div>
                                            <a href="http://dev.axisj.com/samples/AXInput/index.html">http://dev.axisj.com/samples/AXInput/index.html</a>
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
                                            <a href="http://dev.axisj.com/samples/AXButton/index.html">http://dev.axisj.com/samples/AXButton/index.html</a>
                                            <div class="H10"></div>

                                            <h2>조합형</h2>
                                            <div id="ax-grid-target"></div>

                                        </div>
                                    </div>
                                    <div class="ax-clear"></div>
                                    <div class="H20"></div>
                                </div>
                            </div>

                            <div class="ax-clear"></div>
                        </div>

                        <!-- @@@@@@@@@@@@@@@@@@@@@@ contents end   @@@@@@@@@@@@@@@@@@@@@@ -->
					</div>
					<!-- e.CXPage -->
				</div>
				<div class="ax-clear"></div>
			</div>

		</div>
	</div>
    <!-- e ax-body -->

    <!-- 좌측 퀵 메뉴 : s-->
    <div class="ax-aside">
        <div class="ax-layer ax-aside-menu-box">
            <a class="ax-aside-menu"><i class="axi axi-angle-double-right fa-lg"></i><i class="axi axi-angle-double-left fa-lg"></i></a>
        </div>
        <div class="ax-layer ax-aside-box">
            <div class="ax-unit">
                <div class="ax-box">
                    <h3>사이드 메뉴</h3>
                    <ul class="ax-aside-ul" id="ax-aside-ul"></ul>
                </div>

                <div class="H10"></div>
                <div class="ax-box">
                    <h3>사용자 박스</h3>
                    
                    <style type="text/css">
                        .cx-aside-ul{
                            list-style: none;
                            margin: 0px;padding: 0px;
                            border-top:1px solid #d9d9d9;
                        }
                        .cx-aside-ul li{
                            list-style: none;
                            border-bottom:1px solid #d9d9d9;
                        }
                        .cx-aside-ul li a {
                            display: block;
                            padding: 8px 10px;
                            font-size: 13px;
                            line-height:22px;
                        }
                        .cx-aside-ul ul.child{
                            padding: 0px;
                            border-top:1px solid #d9d9d9;
                        }
                        .cx-aside-ul ul.child li{
                            border-bottom: 0px none;
                            background: #f3f3f3;
                            
                        }
                        .cx-aside-ul ul.child li a {
                            padding-left: 30px;
                            font-size: 12px;
                            line-height: 15px;
                        }
                    </style>
                    <ul class="cx-aside-ul top-border">
                        <li>
                            <a href="notice.php">
                                <i class="axi axi-lightbulb-o"></i>
                                공지사항</a>
                        </li>
                        <li>
                            <a href="counselor-manage.php">
                                <i class="axi axi-group"></i>
                                상담원 관리</a>
                            <ul class="child">
                                <li>
                                    <a href="counselor-register.php">상담원 등록</a>
                                </li>
                                <li>
                                    <a href="counselor-manage.php">상담원 관리</a>
                                </li>
                                <li>
                                    <a href="chat-room.php">대화방 조회(배정)</a>
                                </li>
                            </ul>
                        </li>
                        <li>
                            <a href="manager-info.php">
                                <i class="axi axi-cog"></i>
                                프로필 설정</a>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </div>
    <!-- e : 좌측 퀵 메뉴-->
    
    <!-- ax-footer : include -->
    <div class="ax-footer">
        <div class="ax-wrap">
            <div class="ax-col-6">
                <div class="ax-unit">
                    <ul class="ax-version">
                        <li>AXU - <a href="http://axu.axisj.com" target="_blank">Barracks</a></li>
                        <li><i class="axi axi-check-circle-o"></i> 현재버전 <a href="#ax">0.2</a></li>
                        <li><select id="theme-select"></select></li>
                    </ul>
                </div>
            </div>
            <div class="ax-col-6">
                <div class="ax-unit">
                    <ul class="ax-funcs">
                        <li><a href="https://www.axisj.com" target="_blank"><i class="axi axi-axisj"></i> AXISJ.com</a></li>
                        <li><a href="https://github.com/axisj-com" target="_blank"><i class="axi axi-github-square"></i> AXISJ gitHub</a></li>
                        <li><a href="https://www.facebook.com/axisj" target="_blank"><i class="axi axi-facebook-square"></i> Facebook</a></li>
                    </ul>
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
    <!-- ax-footer : include -->
    
</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts begin @@@@@@@@@@@@@@@@@@@@@@ -->
<script type="text/javascript">
    var page_menu_id = "m010303";
    var fnObj = {
        list:[],
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

            this.grid.init();

        },
        grid: {
            target: new AXGrid(),
            init: function(){

                this.target.setConfig({
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
                this.target.setList(list);
            },
            add: function(){


            },
            remove: function(){


            }

        }
    }
</script>
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts end   @@@@@@@@@@@@@@@@@@@@@@ -->
</body>
</html>