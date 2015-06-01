<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
%><!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- TITLE -->
    <title>[AXU4J] </title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="/plugins/axicon/axicon.min.css" />
    <link rel="stylesheet" type="text/css" href="/plugins/axisj/ui/cocker/AXJ.min.css" />
    <link rel="stylesheet" type="text/css" href="/ui/cocker/admin.css" />
    <link rel="stylesheet" type="text/css" href="/ui/custom.css" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ css begin @@@@@@@@@@@@@@@@@@@@@@ -->
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ css end   @@@@@@@@@@@@@@@@@@@@@@ -->

    <script type="text/javascript" src="/plugins/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="/plugins/axisj/dist/AXJ.min.js"></script>
<!-- @@@@@@@@@@@@@@@@@@@@@@ js begin @@@@@@@@@@@@@@@@@@@@@@ -->
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ js end   @@@@@@@@@@@@@@@@@@@@@@ -->

</head>
<body>
<div id="AXPage" class="bodyHeightDiv">
    <div class="ax-modal-header">
        <div class="ax-col-12">
            <div class="ax-unit">
<!-- @@@@@@@@@@@@@@@@@@@@@@ header begin @@@@@@@@@@@@@@@@@@@@@@ -->
                
        <h1>게시물 관리</h1>
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ header end   @@@@@@@@@@@@@@@@@@@@@@ -->
            </div>
        </div>
        <div class="ax-clear"></div>
    </div>
    <div class="ax-modal-body">
        <div class="ax-wrap">
            <div class="ax-layer">
                <div class="ax-col-12">
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents begin @@@@@@@@@@@@@@@@@@@@@@ -->
                    
        

<form id="form-128" name="board" method="post" class="" style="">
	<div class="ax-rwd-table">


        <input type="hidden" name="pageIndex" value="<c:out value='${searchVO.pageIndex}'/>"/>
        <input type="hidden" name="returnUrl" value="<c:url value='/edit.do'/>"/>

        <input type="hidden" name="bbsId" value="<c:out value='${result.bbsId}'/>" />

        <input type="hidden" name="bbsAttrbCode" value="<c:out value='${bdMstr.bbsAttrbCode}'/>" />
        <input type="hidden" name="bbsTyCode" value="<c:out value='${bdMstr.bbsTyCode}'/>" />
        <input type="hidden" name="replyPosblAt" value="<c:out value='${bdMstr.replyPosblAt}'/>" />
        <input type="hidden" name="fileAtchPosblAt" value="<c:out value='${bdMstr.fileAtchPosblAt}'/>" />
        <input type="hidden" name="posblAtchFileNumber" value="<c:out value='0'/>" />
        <input type="hidden" name="posblAtchFileSize" value="<c:out value='${bdMstr.posblAtchFileSize}'/>" />
        <input type="hidden" name="tmplatId" value="<c:out value='${bdMstr.tmplatId}'/>" />

        <input type="hidden" name="cal_url" value="<c:url value='/edit.do'/>" />
            
            

<div id="fields-124" class="item-group " style="">
	
                

<div id="field-124" class="item">
	<div class="item-lable">
		<span class="th">번호</span>
		<span class="td inputText " style="" title="">
			
                    <input type="text" name="nttId" title="" placeholder="" value="<c:out value='${result.nttId}'/>" class="AXInput" style="width:50px;" readonly="readonly" />
                
		</span>
	</div>
</div>
<div class="item-clear"></div>

        
            
	<div class="group-clear"></div>
</div>

        
            

<div id="fields-126" class="item-group " style="">
	
                

<div id="field-126" class="item">
	<div class="item-lable">
		<span class="th">등록일</span>
		<span class="td inputText " style="" title="">
			
                    <input type="text" name="regDate" id="reg_dt" title="" placeholder="" value="${result.frstRegisterPnttm}" class="AXInput" style="width:150px;" readonly="readonly" />
                
		</span>
	</div>
</div>
<div class="item-clear"></div>

        
            
	<div class="group-clear"></div>
</div>

        
            

<div id="fields-128" class="item-group " style="">
	
                

<div id="field-128" class="item">
	<div class="item-lable">
		<span class="th">제목</span>
		<span class="td inputText " style="" title="">
			
                    <input name="nttSj" title="제목" class="AXInput av-required W300" type="text" value='${result.nttSj}' maxlength="60" />
                
		</span>
	</div>
</div>
<div class="item-clear"></div>

        
            
	<div class="group-clear"></div>
</div>

        
            
            <div style="padding:5px">
                <label class="AXInputLabel fullWidth">
                    <textarea id="nttCn" name="nttCn"  cols="75" rows="20" class="AXTextarea av-required" title="내용"><c:out value="${result.nttCn}" escapeXml="false" /></textarea>
                </label>
            </div>
        
	</div>
</form>

        
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents end   @@@@@@@@@@@@@@@@@@@@@@ -->
                </div>
                <div class="ax-clear"></div>
            </div>
        </div>
    </div>
    <div class="ax-modal-footer">
        <div class="ax-wrap">
            <div class="ax-col-12">
                <div class="ax-unit center">
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents begin @@@@@@@@@@@@@@@@@@@@@@ -->
                    
        <button type="button" class="AXButton" onclick="fnObj.form.save();">확인</button>
        <button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents end   @@@@@@@@@@@@@@@@@@@@@@ -->
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts begin @@@@@@@@@@@@@@@@@@@@@@ -->

        <script type="text/javascript">
            if ("${message}") {
                dialog.push("${message}");
            }

            var fnObj = {
                pageStart: function(){
                    $("#reg_dt").bindDate();
                    this.form.init();
                },
                pageResize: function(){
                    parent.myModal.resize();
                },
                form:{
                    validator: new AXValidator(),
                    init: function(){
                        this.validator.setConfig({
                            targetFormName : "board"
                        });
                    },
                    save: function(){

                        var validateResult = this.validator.validate();
                        if (!validateResult) {
                            var msg = this.validator.getErrorMessage();
                            axf.alert(msg);
                            this.validator.getErrorElement().focus();
                            return false;
                        }else{
                            // 통과
                        }
                        
                        /* 위 구문으로 대체 할 수 있음.
                        if(frm.nttSj.value.trim() == "") {
                            alert("제목을 입력해주세요");
                            frm.nttSj.focus();
                            return false;
                        }
                        if(frm.nttSj.value.trim() == "") {
                            alert("제목을 입력해주세요");
                            frm.nttSj.focus();
                            return false;
                        }
                        */

                        if(document.board.nttId.value == ""){
                            document.board.nttId.value = "-1"; // 게시물 등록
                        }else{
                            // 게시물 수정
                        }
                        var url = "/edit.json";
                        var pars = $(document.board).serialize();
                        
                        new AXReq(url, 
                            {
                                pars:pars, 
                                onsucc:function(res){
                                    if(res.result.isOK){
                                        parent.fnObj.search.submit();
                                        parent.myModal.close();
                                    }else{
                                        axf.alert(res.result);
                                        trace(res);
                                    }
                                },
                                onerr:null
                            }
                        );
                        
                        return false;
                    }                    
                }
            };
            axdom(document.body).ready(function(){fnObj.pageStart()});
            axdom(window).resize(fnObj.pageResize);
        </script>
    
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts end   @@@@@@@@@@@@@@@@@@@@@@ -->
</body>
</html>