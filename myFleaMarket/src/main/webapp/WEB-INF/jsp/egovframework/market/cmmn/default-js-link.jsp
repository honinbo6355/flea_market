<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Placed js at the end of the document so the pages load faster -->

    <!-- Bootstrap framework js -->
    <script src="js/bootstrap.min.js"></script>
    <!-- All js plugins included in this file. -->
    <script src="js/plugins.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <!-- Waypoints.min.js. -->
    <script src="js/waypoints.min.js"></script>
    <!-- Main js file that contents all jQuery plugins activation. -->
    <script src="js/main.js"></script>
    
    <script type="text/javascript">
    	function getOriginalFile(fileName) {
			var lastSlash = fileName.lastIndexOf('/')+1;
			var realFile = fileName.substr(0, lastSlash) + fileName.substr(lastSlash+2);
			return realFile;
		}
    	
    </script>
    