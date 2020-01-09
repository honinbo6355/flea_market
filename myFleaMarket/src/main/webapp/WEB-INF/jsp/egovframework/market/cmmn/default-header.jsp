<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Flea Market</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Place favicon.ico in the root directory -->
    <link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
    <link rel="apple-touch-icon" href="apple-touch-icon.png">
    

    <!-- All css files are included here. -->
    <!-- Bootstrap fremwork main css -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Owl Carousel main css -->
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <!-- This core.css file contents all plugings css file. -->
    <link rel="stylesheet" href="css/core.css">
    <!-- Theme shortcodes/elements style -->
    <link rel="stylesheet" href="css/shortcode/shortcodes.css">
    <!-- Theme main style -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive css -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- material icons -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <!-- User style -->
    <link rel="stylesheet" href="css/myCustom.css">
    <!-- Modernizr JS -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
    <!-- jquery latest version -->
    <script src="js/vendor/jquery-1.12.0.min.js"></script>
    
    <!-- handlebars.min.js -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/handlebars.js/4.4.2/handlebars.min.js"></script>
    <script type="text/javascript">
    	var formCheck = {
    			digitCheckKeydown : function() {
        			debugger;
        			
            		if ((event.keyCode >=48) && (event.keyCode <= 57)) {
            			return true;
            		} else if (event.keyCode === 8 || event.keyCode === 9) {
            		    return true;
            		} 
            		
            		return false;
            	},
            	
            	digitCheckKeyUp : function() {
            		if (!(event.keyCode >=37 && event.keyCode<=40)) {
                        var inputVal = $(this).val();
                        $(this).val(inputVal.replace(/[^a-z0-9]/gi,''));
                    }
            	}
    	}
    	
    	function getCategoryList() {
    		var categoryArr = [];
			
			<c:forEach items="${CATEGORY_LIST}" var="category">
				var categoryObj = {};
				categoryObj.cateCode = "${category.cateCode}";
				categoryObj.cateName = "${category.cateName}";
				categoryObj.upperCateCode = "${category.upperCateCode}";
				categoryObj.cateLevel = "${category.cateLevel}";
				categoryArr.push(categoryObj);
			</c:forEach>
			
			return categoryArr;
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
    									+ "<i class='zmdi zmdi-caret-right'></i>" + "${leftCategory.cateName}" + "</a></li>");
    						}
    					</c:forEach>
    					
    					$(leftCategoryDiv).append(leftCategoryUl);
    					$('#leftCategoryMenu').append(leftCategoryDiv);
    				}
    	        };
        	
        	category.init();
        }
    </script>
</head>
