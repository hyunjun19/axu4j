<%@ page contentType="text/html; charset=UTF-8"
%><%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"
%><%@ taglib prefix="ax" uri="http://axis.com/axu4j"
%><!DOCTYPE html>
<html>
<head>
    <!-- META -->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1, maximum-scale=1, minimum-scale=1" />
    <meta name="apple-mobile-web-app-capable" content="yes">
    <!-- TITLE -->
    <title>Barracks <ax:block name="title" /></title>

    <link rel="shortcut icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="icon" href="http://dev.axisj.com/ui/axisj.ico" type="image/x-icon" />
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="http://dev.axisj.com/ui/AXJ.png" />
    <link rel="apple-touch-icon-precomposed" href="http://dev.axisj.com/ui/AXJ.png" />
    <meta property="og:image" content="http://dev.axisj.com/samples/_img/axisj_sns.png" />
    <meta property="og:site_name" content="Axis of Javascript - axisj.com" />
    <meta property="og:description" id="meta_description" content="Javascript UI Library based on JQuery" />

    <link rel="stylesheet" type="text/css" href="http://cdn.axisj.com/axicon/axicon.min.css" />
    <link rel="stylesheet" type="text/css" href="http://dev.axisj.com/ui/cocker/AXJ.min.css" />

    <link rel="stylesheet" href="<c:url value='/axu/theme/Barracks/admin/ui/cocker/admin.css' />" />
    <link rel="stylesheet" href="<c:url value='/axu/theme/Barracks/admin/ui/custom.css' />" />

    <script type="text/javascript" src="http://dev.axisj.com/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="http://dev.axisj.com/dist/AXJ.min.js"></script>
</head>
<body>
<div id="AXPage" class="bodyHeightDiv">
    <div class="ax-modal-header">
        <div class="ax-col-12">
            <div class="ax-unit">
<!-- @@@@@@@@@@@@@@@@@@@@@@ header begin @@@@@@@@@@@@@@@@@@@@@@ -->
				<ax:block name="header" />
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
					<ax:block name="contents" />
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
					<ax:block name="buttons" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ contents end   @@@@@@@@@@@@@@@@@@@@@@ -->
                </div>
            </div>
            <div class="ax-clear"></div>
        </div>
    </div>
</div>
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts begin @@@@@@@@@@@@@@@@@@@@@@ -->
<ax:block name="scripts" />
<!-- @@@@@@@@@@@@@@@@@@@@@@ scripts end   @@@@@@@@@@@@@@@@@@@@@@ -->
</body>
</html>