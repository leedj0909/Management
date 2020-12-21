<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator"%>
<%@ taglib prefix="page" uri="http://www.opensymphony.com/sitemesh/page" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>sample</title>
    <decorator:head/>
</head>
<body>
<div class="wrapper">
    <header class="main-header">
        <page:applyDecorator name="header" />
    </header>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <decorator:body />
    </div><!-- /.content-wrapper -->

    
</div>
	<footer class="main-footer">
        <page:applyDecorator name="footer" />
    </footer>
</body>
</html>