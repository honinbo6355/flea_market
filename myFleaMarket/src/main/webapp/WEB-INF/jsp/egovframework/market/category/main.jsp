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
	                                            <a href="productDetail.do?prodId=${prod.prodId}">
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
	                                            <li class="new__price">${prod.price}원</li>
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
                    			<div class="col-md-3">
                    			</div>
		                        <div class="col-md-9 col-sm-12 col-xs-12" style="text-align:center;">
		                        	<ul class="pagination">
		                        		<c:if test="${PAGING.prev}">
		                        			<li><a href="categoryMain.do?page=${PAGING.search.startPage-1}&perPageNum=${PAGING.search.perPageNum}&cateCode=${CATEGORY.cateCode}&cateLevel=${CATEGORY.cateLevel}" aria-label="Previous">
		                        			<span aria-hidden="true">&laquo;</span></a></li>
		                        		</c:if>
		                        		
		                        		<c:forEach var="page" begin="${PAGING.startPage}" end="${PAGING.endPage}">
		                        			<li
		                        			<c:out value="${PAGING.search.page == page ? 'class=active' : ''}" />>
		                        			<a href="categoryMain.do?page=${page}&perPageNum=${PAGING.search.perPageNum}&cateCode=${CATEGORY.cateCode}&cateLevel=${CATEGORY.cateLevel}">${page}</a>
		                        			</li>
		                        		</c:forEach>
		                        		
		                        		<c:if test="${PAGING.next}">
		                        			<li><a href="categoryMain.do?page=${PAGING.search.endPage+1}&perPageNum=${PAGING.search.perPageNum}&cateCode=${CATEGORY.cateCode}&cateLevel=${CATEGORY.cateLevel}" aria-label="Next">
		                        			<span aria-hidden="true">&raquo;</span></a></li>
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
	        
        	initCategory();
        	
			$(document).ready(function() {
				$('.pro__thumb img').each(function() {
					var fileName = $(this).attr('src');
					
					$(this).attr('src', getOriginalFile(fileName));
				});	
			});
			
        </script>