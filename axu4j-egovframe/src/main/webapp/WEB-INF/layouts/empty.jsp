<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %><%@
        taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %><%@
        taglib prefix="ax" uri="http://axis.com/axu4j"
        %><!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- TITLE -->
    <title>[AXU4J] ${title}</title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="<c:url value='/plugins/axicon/axicon.min.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/plugins/axisj/ui/cocker/AXJ.min.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/ui/cocker/admin.css' />" />
    <link rel="stylesheet" type="text/css" href="<c:url value='/ui/custom.css' />" />
    <!-- @@@@@@@@@@@@@@@@@@@@@@ css begin @@@@@@@@@@@@@@@@@@@@@@ -->
    <ax:write divname="css" />
    <!-- @@@@@@@@@@@@@@@@@@@@@@ css end   @@@@@@@@@@@@@@@@@@@@@@ -->

    <script type="text/javascript" src="<c:url value='/plugins/jquery/jquery.min.js' />"></script>
    <script type="text/javascript" src="<c:url value='/plugins/axisj/dist/AXJ.min.js' />"></script>
    <!-- @@@@@@@@@@@@@@@@@@@@@@ js begin @@@@@@@@@@@@@@@@@@@@@@ -->
    <ax:write divname="js" />
    <!-- @@@@@@@@@@@@@@@@@@@@@@ js end   @@@@@@@@@@@@@@@@@@@@@@ -->
    <script type="text/javascript" src="<c:url value='/js/common/base.js' />"></script>
</head>
<body>
<div id="AXPage" class="login">

    <div class="ax-body">
        <div class="ax-wrap">

            <div class="ax-layer ax-title">
                <div class="ax-col-12">
                    <!-- @@@@@@@@@@@@@@@@@@@@@@ header begin @@@@@@@@@@@@@@@@@@@@@@ -->
                    <ax:write divname="header" />
                    <!-- @@@@@@@@@@@@@@@@@@@@@@ header end   @@@@@@@@@@@@@@@@@@@@@@ -->
                </div>
                <div class="ax-clear"></div>
            </div>


            <div class="ax-layer">
                <div class="ax-col-12">
                    <div class="ax-unit">

                        <!-- @@@@@@@@@@@@@@@@@@@@@@ contents begin @@@@@@@@@@@@@@@@@@@@@@ -->
                        <ax:write divname="contents" />
                        <!-- @@@@@@@@@@@@@@@@@@@@@@ contents end   @@@@@@@@@@@@@@@@@@@@@@ -->

                    </div>
                    <!-- e.CXPage -->
                </div>
                <div class="ax-clear"></div>
            </div>

        </div>
    </div>
    <!-- e ax-body -->

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
<ax:write divname="scripts" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts end   @@@@@@@@@@@@@@@@@@@@@@ -->
</body>
</html>