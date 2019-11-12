<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles"  prefix="tiles"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
	<head>
		<tiles:insertAttribute name="header" />
	</head>
	<body>
		<!--[if lt IE 8]>
        	<p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    	<![endif]-->  

    	<!-- Body main wrapper start -->
    	<div class="wrapper fixed__footer">
			<tiles:insertAttribute name="nav" />
			<tiles:insertAttribute name="content" />
			<tiles:insertAttribute name="footer" />
			<tiles:insertAttribute name="js" />
		</div>
		<!-- Body main wrapper end -->
		
	</body>
</html>