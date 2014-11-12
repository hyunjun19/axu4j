<%@page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>JSP Template Inheritance</title>
    </head>

<h1>Head</h1>
<div>
    <layout:block name="header">
        header
    </layout:block>
</div>

<h1>Contents</h1>
<div>
    <p>
    <layout:block name="contents">
        <h2>Contents will be placed under this h2</h2>
    </layout:block>
    </p>
</div>

<div class="footer">
    <hr />
    <a href="https://github.com/kwon37xi/jsp-template-inheritance">jsp template inheritance example</a>
</div>
</html>