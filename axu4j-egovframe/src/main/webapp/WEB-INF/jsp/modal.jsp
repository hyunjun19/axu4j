<%@ page contentType="text/html; charset=UTF-8"
        %><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
        %><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
        %><ax:layout name="modal.jsp">
    <ax:div name="header">
        <h1>컨텐츠 제목</h1>
        <p class="desc">컨텐츠 상세 설명을 넣어주세요.</p>
    </ax:div>
    <ax:div name="contents">

        <form name="table-form" method="get" onsubmit="return false;">
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

    </ax:div>
    <ax:div name="buttons">
        <button type="button" class="AXButton" onclick="parent.myModal.close();">확인</button>
        <button type="button" class="AXButton" onclick="parent.myModal.close();">취소</button>
    </ax:div>
    <ax:div name="scripts">
        <script type="text/javascript">
            var fnObj = {
                pageStart: function(){

                },
                pageResize: function(){
                    parent.myModal.resize();
                }
            };
            axdom(document.body).ready(function() {
                fnObj.pageStart();
            });
            axdom(window).resize(fnObj.pageResize);
        </script>
    </ax:div>
</ax:layout>