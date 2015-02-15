<%@ page contentType="text/html; charset=UTF-8"
        %><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
        %><%@ taglib prefix="ax" uri="http://axisj.com/axu4j"
        %><ax:layout name="modal.jsp">
    <ax:div name="header">
        <h1>게시물 관리</h1>
    </ax:div>
    <ax:div name="contents">
        <ax:form name="board" method="post">
            
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
            
            <ax:fields>
                <ax:field label="번호">
                    <input type="text" name="nttId" title="" placeholder="" value="<c:out value='${result.nttId}'/>" class="AXInput" style="width:50px;" readonly="readonly" />
                </ax:field>
            </ax:fields>
            <ax:fields>
                <ax:field label="등록일">
                    <input type="text" name="regDate" id="reg_dt" title="" placeholder="" value="" class="AXInput" style="width:100px;" readonly="readonly" />
                </ax:field>
            </ax:fields>
            <ax:fields>
                <ax:field label="제목">
                    <input name="nttSj" title="제목" class="AXInput av-required W300" type="text" value='${result.nttSj}' maxlength="60" />
                </ax:field>
            </ax:fields>
            
            <div style="padding:5px">
                <label class="AXInputLabel fullWidth">
                    <textarea id="nttCn" name="nttCn"  cols="75" rows="20" class="AXTextarea av-required" title="내용"><c:out value="${result.nttCn}" escapeXml="false" /></textarea>
                </label>
            </div>
        </ax:form>
    </ax:div>
    <ax:div name="buttons">
        <button type="button" class="AXButton" onclick="fnObj.form.save();">확인</button>
        <button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
    </ax:div>
    <ax:div name="scripts">
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
    </ax:div>
</ax:layout>