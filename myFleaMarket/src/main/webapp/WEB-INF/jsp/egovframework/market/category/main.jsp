<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- Start MAinmenu Ares -->
                        <div class="col-md-12 col-lg-12 col-sm-6 col-xs-6">
                            <nav id="sub-category-menu-list" class="mainmenu__nav hidden-xs hidden-sm" style="border-top:1px solid #ccc; border-bottom:1px solid #ccc;">
								
                            </nav>
                              
                            <div class="mobile-menu clearfix visible-xs visible-sm">
                                <nav id="mobile_dropdown">
                                
                                </nav>
                            </div>
                                                      
                        </div>
                        <!-- End MAinmenu Ares -->
                                        
<!-- Start Our Product Area -->
        <section class="htc__product__area shop__page ptb--130 bg__white">
            <div class="container">
                <div class="htc__product__container">
                    
                    <!-- End Product MEnu -->
                    <div class="row">
                    	<div class="col-md-3">
	                        <div>
	                            <div class="category-search-area">
	                                <input placeholder="Search......" type="text">
	                                <a class="srch-btn" href="#"><i class="zmdi zmdi-search"></i></a>    
	                            </div>
	                            <!-- Start Category Area -->
	                            <div class="our-category-area mt--60" id="leftCategoryMenu">
	                                
	                            </div>
	                            <!-- End Category Area -->
	                        </div>
                    	</div>
                    	
                    	<div class="col-md-9">
                    		<div class="product__list another-product-style">
                    			<c:forEach var="prod" items="${PROD_LIST}" varStatus="status">
	                            <c:if test="${status.index % 3 == 0}">
	                                <div class="row">
	                            </c:if>
	                            <!-- Start Single Product -->
	                            <div class="col-md-4 single__pro col-lg-4 cat--1 col-sm-4 col-xs-12">
	                                <div class="product foo">
	                                    <div class="product__inner">
	                                        <div class="pro__thumb">
	                                            <a href="#">
	                                                <img src="${prod.storedFileName}" alt="product images" style="width:270px; height:270px;">
	                                            </a>
	                                        </div>
	                                        <div class="product__hover__info">
	                                            <ul class="product__action">
	                                                <li><a data-toggle="modal" data-target="#productModal" title="Quick View" class="quick-view modal-view detail-link" href="#"><span class="ti-plus"></span></a></li>
	                                                <li><a title="Add TO Cart" href="cart.html"><span class="ti-shopping-cart"></span></a></li>
	                                                <li><a title="Wishlist" href="wishlist.html"><span class="ti-heart"></span></a></li>
	                                            </ul>
	                                        </div>
	                                    </div>
	                                    <div class="product__details">
	                                        <h2><a href="product-details.html">${prod.title}</a></h2>
	                                        <ul class="product__price">
	                                            <li class="new__price">${prod.price}</li>
	                                        </ul>
	                                    </div>
	                                </div>
	                            </div>
	                            <!-- End Single Product -->
	                            <c:if test="${status.count % 3 == 0 || fn:length(PROD_LIST) == status.count}">
		                        	</div>
	                            </c:if>
	                            </c:forEach>
                        	</div>
                    	</div>
                    	<div class="row">
                    			<div class="col-md-3 col-sm-3 col-xs-3">
                    			</div>
		                        <div class="col-md-9 col-sm-9 col-xs-9" style="text-align:center;">
		                        	<ul class="pagination">
		                        		<c:if test="${PAGING.prev}">
		                        			<li><a href="#" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
		                        		</c:if>
		                        		
		                        		<c:forEach var="page" begin="${PAGING.startPage}" end="${PAGING.endPage}">
		                        			<li
		                        			<c:out value="${PAGING.search.page == page ? 'class=active' : ''}" />>
		                        			<a href="#">${page}</a>
		                        			</li>
		                        		</c:forEach>
		                        		
		                        		<c:if test="${PAGING.next}">
		                        			<li><a href="#" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
		                        		</c:if>
		                       		</ul>
		                        </div>
	                	</div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Our Product Area -->
        
        <script type="text/javascript">
	        /* 카테고리, 서브 카테고리 리스트 생성 */
	        
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
								+ ("${ACTIVE_CATE_CODE}" == "${leftCategory.cateCode}" ? "style='color:blue;'" : "")
								+ ">";
							
							$(leftCategoryUl).append("<li>" + categoryHref
									+ "<i class='zmdi zmdi-caret-right'></i>" + "${leftCategory.cateName}" + "<span>20</span></a></li>");
						}
					</c:forEach>
					
					$(leftCategoryDiv).append(leftCategoryUl);
					$('#leftCategoryMenu').append(leftCategoryDiv);
				}
	        };
	        
			$(document).ready(function() {
				$('.pro__thumb img').each(function() {
					var fileName = $(this).attr('src');
					
					$(this).attr('src', getOriginalFile(fileName));
				});	
			});
	        
	        category.init();
        </script>