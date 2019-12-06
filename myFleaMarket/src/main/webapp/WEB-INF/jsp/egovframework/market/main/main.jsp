<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	@media (max-width: 991px) {
		.categories-menu {
		    margin-bottom: 50px;
		}
	}
</style>

<!-- Start Feature Product -->
        <section class="categories-slider-area bg__white" style="padding-bottom:100px;">
            <div class="container">
                <div class="row">
                    <div class="col-md-3">
                        <div class="categories-menu mrg-xs">
                            <div class="category-heading">
                               <h3>카테고리</h3>
                            </div>
                            <div class="category-menu-list">
                            </div>
                        </div>
                    </div>
                    <div class="col-md-9">
                        <div class="product-style-tab">
                            <div class="product-tab-list">
                                <!-- Nav tabs -->
                                <ul class="tab-style" role="tablist">
                                    <li class="active">
                                        <a href="#home1" data-toggle="tab">
                                            <div class="tab-menu-text">
                                                <h4>추천 상품</h4>
                                            </div>
                                        </a>
                                    </li>
                                </ul>
                            </div>
                            <div class="tab-content another-product-style jump">
                                <div class="tab-pane active" id="home1">
                                    <div class="row">
                                        <div id="recommProdList" class="product-slider-active owl-carousel">
                                        	
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Feature Product -->
        
        <script id="prod-template" type="text/x-handlebars-template">
			{{#each .}}
			<div class="col-md-4 single__pro col-lg-4 cat--1 col-sm-4 col-xs-12">
				<div class="product">
                	<div class="product__inner">
                    	<div class="pro__thumb">
                        	<a href="#">
                            	<img src="{{storedFileName}}" alt="product images" style="width:270px; height:270px;">
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
                    	<h2><a href="product-details.html">{{title}}</a></h2>
                        <ul class="product__price">
                        	<li class="new__price">{{price}}</li>
                        </ul>
                    </div>
                </div>
        	</div>
			{{/each}}
		</script>
		
        <script type="text/javascript">
			/* 카테고리 리스트 생성 */
			
			var category = {
				init : function() {
					var categoryArr = getCategoryList();
				
					var categoryList = $('.category-menu-list');
					
					var categoryUl = document.createElement("ul");
					
					for (var i=0; i<categoryArr.length; i++) {
						if (categoryArr[i].cateLevel == 1) {
							$(categoryUl).append("<li><a href='categoryMain.do?cateCode=" 
							+ categoryArr[i].cateCode
							+ "&cateLevel=" + categoryArr[i].cateLevel + "'>" 
							+ categoryArr[i].cateName + "<i class='zmdi zmdi-chevron-right'></i></a></li>");
						}
					}
					
					categoryList.append(categoryUl);	
				}	
			}
			
			var prodSource = $('#prod-template').html();
			var template = Handlebars.compile(prodSource);
			
			var prodArr = [];
			
			<c:forEach items="${PROD_LIST}" var="prod">
				var prodObj = {};
				prodObj.storedFileName = '${prod.storedFileName}';
				prodObj.title = "${prod.title}";
				prodObj.price = "${prod.price}";
				prodArr.push(prodObj);
			</c:forEach>
			
			$('#recommProdList').append(template(prodArr));
			
			$(document).ready(function() {
				$('.pro__thumb img').each(function() {
					var fileName = $(this).attr('src');
					
					$(this).attr('src', getOriginalFile(fileName));
				});	
			});
			
			category.init();
		</script>