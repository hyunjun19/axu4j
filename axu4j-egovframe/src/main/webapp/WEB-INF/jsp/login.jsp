<%@ page contentType="text/html; charset=UTF-8"
        %><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
        %><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
        %><ax:layout name="empty.jsp">
    <ax:div name="header">
        <h1><i class="axi axi-axu"></i></h1>
        <p class="desc">Application eXperience Universal Administrator</p>
    </ax:div>
    <ax:div name="contents">
        <ax:row>
            <ax:col size="12" wrap="false">

                <div class="ax-box">
                    <h1>로그인</h1>
                    <p>관리자 계정으로 로그인 해주세요.</p>
                    <div class="H20"></div>
                    <form name="login-form" method="post" action="/actionLogin.do" onsubmit="">
                        <div class="ax-input">
                            <span class="name">E-mail</span>
                            <input type="text" name="id" value="" class="AXInput" placeholder="e-mail">
                        </div>
                        <div class="ax-input">
                            <span class="name">Password</span>
                            <input type="password" name="password" value="" class="AXInput" placeholder="password">
                        </div>

                        <div class="ax-clear"></div>
                        <div class="H20"></div>

                        <div class="ax-funcs">
                            <label>
                                <span>&nbsp;아이디 기억하기</span>
                                <input type="text" name="" value="NO" id="AXInputSwitch" style="width:50px;height:23px;border:0px none;" />

                            </label>
                            <button type="submit" class="AXButtonLarge Blue">&nbsp;&nbsp;로그인&nbsp;&nbsp;</button>
                        </div>
                    </form>

                    <div class="ax-clear"></div>
                    <div class="H20"></div>

                    <div class="ax-opts">
                        <button type="button" class="AXButtonSmall Classic">관리자에게 계정 신청하기</button>
                        <button type="button" class="AXButtonSmall Classic">비밀번호 찾기</button>
                    </div>

                    <p>
                        IE8+, Chrome, Firefox, safari
                    </p>
                    <div class="H20"></div>

                </div>
                
            </ax:col>
        </ax:row>
    </ax:div>
    <ax:div name="scripts">
        <script type="text/javascript">
            var fnObj = {
                pageStart: function(){
                    $("#AXInputSwitch").bindSwitch({off:"NO", on:"YES", onChange:function(){
                        toast.push(Object.toJSON({targetID:this.targetID,
                            on:this.on, off:this.off, value:this.value}));
                    }});
                    toast.push({type:"Caution", body:"WELCOME TO AXU"});
                }
            };
        </script>
    </ax:div>
</ax:layout>