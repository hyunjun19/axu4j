<!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <!-- TITLE -->
    <title>Barracks</title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link href="resource/axicon/axicon.css" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="http://dev.axisj.com/ui/kakao/AXJ.min.css" />

    <link rel="stylesheet" href="ui/cacao/admin.css" />

    <script type="text/javascript" src="http://dev.axisj.com/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="http://dev.axisj.com/dist/AXJ.min.js"></script>

	<script type="text/javascript">
	var fnObj = {
		pageStart: function(){

		},
        pageResize: function(){
            parent.myModal.resize();
        }
	};
    axdom(window).ready(fnObj.pageStart);
    axdom(window).resize(fnObj.pageResize);
	</script>
</head>
<body>
<div id="AXPage" class="bodyHeightDiv">
    <div class="ax-modal-header">
        <div class="ax-col-12">
            <div class="ax-unit">
                <h1>컨텐츠 제목</h1>
                <p class="desc">컨텐츠 상세 설명을 넣어주세요.</p>
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
	<div class="ax-modal-body">
        <div class="ax-wrap">
            <div class="ax-layer">
                <div class="ax-col-12">


                    <form name="table-form" method="get" onsubmit="return fnObj.login();">
                        <div class="ax-rwd-table">
                            <div class="item-group" style="">
                                <div class="item">
                                    <label class="item-lable">
                                        <span class="th" style="min-width:100px;">번호</span>
                                        <span class="td inputText" style="" title="">
                                            <input type="text" name="user_key" title="" placeholder="" value="" class="AXInput" style="width:50px;" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div class="item-clear"></div>
                                <div class="group-clear"></div>
                            </div>
                            <div class="item-group" style="">
                                <div class="item fullWidth">
                                    <label class="item-lable">
                                        <span class="th" style="min-width:100px;">이메일</span>
                                        <span class="td inputText" style="" title="">
                                            <input type="text" name="email_id" title="" placeholder="" value="" class="AXInput av-email av-required" />
                                        </span>
                                    </label>
                                </div>
                                <div class="item-clear"></div>
                                <div class="group-clear"></div>
                            </div>
                            <div class="item-group" style="">
                                <div class="item">
                                    <label class="item-lable">
                                        <span class="th" style="min-width:100px;">비밀번호</span>
                                        <span class="td inputText" style="" title="">
                                            <input type="password" name="passwd" title="" placeholder="" value="" class="AXInput av-required" style="width:150px;" />
                                        </span>
                                    </label>
                                </div>
                                <div class="item-clear"></div>
                                <div class="group-clear"></div>
                            </div>
                            <div class="item-group" style="">
                                <div class="item">
                                    <label class="item-lable">
                                        <span class="th" style="min-width:100px;">레벨</span>
                                        <span class="td inputText" style="" title="">
                                            <select name="user_lvl" class="AXSelect">
                                                <option value="1">최고관리자</option>
                                                <option value="2">관리자</option>
                                            </select>
                                        </span>
                                    </label>
                                </div>
                                <div class="item-clear"></div>
                                <div class="item secondItem">
                                    <label class="item-lable">
                                        <span class="th" style="min-width:100px;">만든 날짜</span>
                                        <span class="td inputText" style="" title="">
                                            <input type="text" name="reg_dt" title="" placeholder="" value="" class="AXInput" style="width:120px;" readonly="readonly" />
                                        </span>
                                    </label>
                                </div>
                                <div class="item-clear"></div>
                                <div class="group-clear"></div>
                            </div>
                        </div>
                    </form>

                </div>
                <div class="ax-clear"></div>
            </div>
        </div>
    </div>
    <div class="ax-modal-footer">
        <div class="ax-wrap">
            <div class="ax-col-12">
                <div class="ax-unit center">
                    <button type="button" class="AXButton" onclick="parent.myModal.close();">확인</button>
                    <button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
</div>
</body>
</html>
