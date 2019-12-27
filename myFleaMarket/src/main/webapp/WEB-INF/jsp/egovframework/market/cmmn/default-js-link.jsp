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
    	

    	/* 카테고리, 서브 카테고리 리스트 생성 */
        function initCategory() {
        	var category = {
    				init : function() {
    					this.navCategory();
    					this.leftCategory();
    				},
    				
    				navCategory : function() {
    					var categoryArr = getCategoryList();

    					var subCategoryUl = document.createElement("ul");
    					var mobileSubCategoryUl = document.createElement("ul");
    					
    					subCategoryUl.className = "main__menu";
    					
    					for (var i=0; i<categoryArr.length; i++) {
    						var categoryHref = "<a href='categoryMain.do?cateCode=" + categoryArr[i].cateCode
    						+ "&cateLevel=" + categoryArr[i].cateLevel + "'>" 
    						+ categoryArr[i].cateName + "</a>";
    						
    						if (categoryArr[i].cateLevel == 1) {
    							$(subCategoryUl).append("<li id='" + categoryArr[i].cateCode + "' class='drop'>" 
    								+ categoryHref + "<ul class='dropdown'></ul></li>");
    							
    							$('#sub-category-menu-list').append(subCategoryUl);
    							
    							/* 모바일 버전 메뉴 */
    							$(mobileSubCategoryUl).append("<li id='m-" + categoryArr[i].cateCode + "'>"
    								+ categoryHref + "<ul></ul></li>");		
    							
    							$('#mobile_dropdown').append(mobileSubCategoryUl);
    							
    						} else if (categoryArr[i].cateLevel == 2) {
    							$('#' + categoryArr[i].upperCateCode).find(".dropdown").append(
    								"<li id='" + categoryArr[i].cateCode + "'>"
    								+ categoryHref + "</li>");
    							
    							/* 모바일 버전 메뉴 */
    							$('#m-' + categoryArr[i].upperCateCode).find("ul").append(
    								"<li id='m-" + categoryArr[i].cateCode + "'>"
    								+ categoryHref + "</li>");
    						}
    					}
    				},
    				
    				leftCategory : function() {
    					// 상위 카테고리 코드가 존재할 경우 제목은 상위 카테고리, 자신 카테고리는 하이라이트
    					
    					// 상위 카테고리 코드가 존재할 경우 제목은 상위 카테고리, 자신 카테고리는 하이라이트 없어도 됌
    					
    					var leftCategoryDiv = document.createElement("div");
    					var leftCategoryUl = document.createElement("ul");
    					
    					leftCategoryDiv.className = "our-category-area mt--60";
    					leftCategoryUl.className = "categore-menu";
    					
    					<c:forEach items="${LEFT_CATEGORY_LIST}" var="leftCategory">
    						if ("${leftCategory.cateLevel}" == 1) {
    							$(leftCategoryDiv).append("<h2 class='section-title-2'>" + "${leftCategory.cateName}" + "</h2>");
    							
    						} else if ("${leftCategory.cateLevel}" == 2) {
    							var categoryHref = "<a href='categoryMain.do?cateCode=" + "${leftCategory.cateCode}" 
    								+ "&cateLevel=" + "${leftCategory.cateLevel}'" 
    								+ ("${CATEGORY.cateCode}" == "${leftCategory.cateCode}" ? "style='color:blue;'" : "")
    								+ ">";
    							
    							$(leftCategoryUl).append("<li>" + categoryHref
    									+ "<i class='zmdi zmdi-caret-right'></i>" + "${leftCategory.cateName}" + "<span>20</span></a></li>");
    						}
    					</c:forEach>
    					
    					$(leftCategoryDiv).append(leftCategoryUl);
    					$('#leftCategoryMenu').append(leftCategoryDiv);
    				}
    	        };
        	
        	category.init();
        }
    </script>
    