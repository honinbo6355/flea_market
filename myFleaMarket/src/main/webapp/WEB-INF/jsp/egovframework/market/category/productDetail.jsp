<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<style>
	.title__6 {
		color: #555555;
		font-weight: 600;
	}
	.pro__review {
		margin-bottom: 50px;
	}
	.review__details textarea {
		background: transparent none repeat scroll 0 0;
    	border: 1px solid #999;
    	min-height: 100px;
    	padding-left: 20px;
	}
	.replaceInqAction {
		margin-right: 20px;
	}
</style>

    <!--[if lt IE 8]>
        <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> to improve your experience.</p>
    <![endif]-->  

	
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
                        
                        
    <!-- Body main wrapper start -->
    <div class="wrapper fixed__footer">
        
        <!-- Start Product Details -->
        <section class="htc__product__details pt--120 pb--100 bg__white">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12">
                        <div class="product__details__container">
                            <!-- Start Small images -->
                            <ul class="product__small__images" role="tablist" id="productSmallImg">
                            	<!--
                                <li role="presentation" class="pot-small-img active">
                                    <a href="#img-tab-1" role="tab" data-toggle="tab">
                                        <img src="images/product-details/small-img/1.jpg" alt="small-image">
                                    </a>
                                </li>
                                <li role="presentation" class="pot-small-img">
                                    <a href="#img-tab-2" role="tab" data-toggle="tab">
                                        <img src="images/product-details/small-img/2.jpg" alt="small-image">
                                    </a>
                                </li>
                                <li role="presentation" class="pot-small-img hidden-xs">
                                    <a href="#img-tab-3" role="tab" data-toggle="tab">
                                        <img src="images/product-details/small-img/3.jpg" alt="small-image">
                                    </a>
                                </li>
                                <li role="presentation" class="pot-small-img hidden-xs hidden-sm">
                                    <a href="#img-tab-4" role="tab" data-toggle="tab">
                                        <img src="images/product-details/small-img/2.jpg" alt="small-image">
                                    </a>
                                </li>
                                -->
                            </ul>
                            <!-- End Small images -->
                            <div class="product__big__images">
                                <div class="portfolio-full-image tab-content" id="productBigImg">
                                	<!--
                                    <div role="tabpanel" class="tab-pane fade in active" id="img-tab-1">
                                        <img src="images/product-details/big-img/10.jpg" alt="full-image">
                                    </div>
                                    
                                    <div role="tabpanel" class="tab-pane fade product-video-position" id="img-tab-2">
                                        <img src="images/product-details/big-img/12.jpg" alt="full-image">
                                        <div class="product-video">
                                            <a class="video-popup" href="https://www.youtube.com/watch?v=cDDWvj_q-o8">
                                                <i class="zmdi zmdi-videocam"></i> View Video
                                            </a>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade product-video-position" id="img-tab-3">
                                        <img src="images/product-details/big-img/11.jpg" alt="full-image">
                                        <div class="product-video">
                                            <a class="video-popup" href="https://www.youtube.com/watch?v=cDDWvj_q-o8">
                                                <i class="zmdi zmdi-videocam"></i> View Video
                                            </a>
                                        </div>
                                    </div>
                                    <div role="tabpanel" class="tab-pane fade product-video-position" id="img-tab-4">
                                        <img src="images/product-details/big-img/12.jpg" alt="full-image">
                                        <div class="product-video">
                                            <a class="video-popup" href="https://www.youtube.com/watch?v=cDDWvj_q-o8">
                                                <i class="zmdi zmdi-videocam"></i> View Video
                                            </a>
                                        </div>
                                    </div>
                                    -->
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6 col-lg-6 col-sm-12 col-xs-12 smt-30 xmt-30">
                        <div class="htc__product__details__inner">
                            <div class="pro__detl__title">
                                <h2>${PROD.title}</h2>
                            </div>
                            <div class="pro__dtl__rating">
                                <ul class="pro__rating">
                                    <li><span class="ti-star"></span></li>
                                    <li><span class="ti-star"></span></li>
                                    <li><span class="ti-star"></span></li>
                                    <li><span class="ti-star"></span></li>
                                    <li><span class="ti-star"></span></li>
                                </ul>
                                <span class="rat__qun">(Based on 0 Ratings)</span>
                            </div>
                            <ul class="pro__dtl__prize">
                                <li>${PROD.price}</li>
                            </ul>
                            
                            <div style="display: flex; margin-bottom:15px;">
                            	<h2 class="title__5" style="width:20%">거래 방식</h2>
                            	<div>${PROD.tradeName}</div>
                            </div>
                            
                            <div style="display: flex; margin-bottom:15px;">
                            	<h2 class="title__5" style="width:20%">상품 상태</h2>
                            	<div>${PROD.statusName}</div>
                            </div>
                            
                            <ul class="pro__dtl__btn">
                                <li class="buy__now__btn"><a href="#">buy now</a></li>
                                <li><a href="#"><span class="ti-heart"></span></a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product Details -->
        <!-- Start Product tab -->
        <section class="htc__product__details__tab bg__white pb--120">
            <div class="container">
                <div class="row">
                    <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                        <ul class="product__deatils__tab mb--60" role="tablist">
                            <li role="presentation" class="active">
                                <a href="#description" role="tab" data-toggle="tab">상품정보</a>
                            </li>
                            <li role="presentation">
                                <a href="#inquiry" role="tab" data-toggle="tab">상품문의</a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <div class="product__details__tab__content">
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="description" class="product__tab__content fade in active">
                                <div class="product__description__wrap">
                                    <div class="product__desc">
                                        <h2 class="title__6">상품정보</h2>
                                        <p>${PROD.des}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- End Single Content -->
                            
                            <!-- Start Single Content -->
                            <div role="tabpanel" id="inquiry" class="product__tab__content fade">
                                
                                <div class="review__address__inner" id="inquiryInner">
                                	<h2 class="title__6">상품문의</h2>
                                	
                                    
                                    
                                    <!-- Start Single Review -->
                                    <!--
                                    <div class="pro__review ans">  
                                        <div class="review__thumb">
                                        	<img src="img/baseline_subdirectory_arrow_right_black_24dp.png">
                                        </div>
                                        
                                        <div class="review__details">
                                            <div class="review__info">
                                                <h4><a href="#">Gerald Barnes</a></h4>
                                                <ul class="rating">
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star"></i></li>
                                                    <li><i class="zmdi zmdi-star-half"></i></li>
                                                    <li><i class="zmdi zmdi-star-half"></i></li>
                                                </ul>
                                                <div class="rating__send">
                                                    <a href="#"><i class="zmdi zmdi-close"></i></a>
                                                </div>
                                            </div>
                                            <div class="review__date">
                                                <span>27 Jun, 2016 at 2:30pm</span>
                                            </div>
                                            <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer accumsan egestas elese ifend. Phasellus a felis at estei to bibendum feugiat ut eget eni Praesent et messages in con sectetur posuere dolor non.</p>
                                        </div>
                                    </div>
                                    -->
                                    <!-- End Single Review -->
                                </div>
                                <!-- Start RAting Area -->
                                <div class="rating__wrap">
                                    <h2 class="title__6">상품에 문의할 점</h2>
                                </div>
                                <!-- End RAting Area -->
                                <div class="review__box">
                                    <form id="review-form">
                                        <div class="single-review-form">
                                            <div class="review-box name">
                                                <input type="text" id="inqNickname" placeholder="닉네임 입력" value="${sessionScope.USER.nickname}" readonly>
                                            </div>
                                        </div>
                                        <div class="single-review-form">
                                            <div class="review-box message">
                                                <textarea id="inqContents" placeholder="상품 문의 작성"></textarea>
                                            </div>
                                        </div>
                                        <div class="review-btn">
                                            <a class="fv-btn" href="#" id="inqSubmit">완료</a>
                                        </div>
                                    </form>                                
                                </div>
                            </div>
                            <!-- End Single Content -->
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- End Product tab -->
        <!-- Start Footer Area -->
        <footer class="htc__foooter__area gray-bg">
            <div class="container">
                <div class="row">
                    <div class="footer__container clearfix">
                         <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-lg-3 col-sm-6">
                            <div class="ft__widget">
                                <div class="ft__logo">
                                    <a href="index.html">
                                        <img src="images/logo/logo.png" alt="footer logo">
                                    </a>
                                </div>
                                <div class="footer-address">
                                    <ul>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-pin"></i>
                                            </div>
                                            <div class="address-text">
                                                <p>194 Main Rd T, FS Rayed <br> VIC 3057, USA</p>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-email"></i>
                                            </div>
                                            <div class="address-text">
                                                <a href="#"> info@example.com</a>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="address-icon">
                                                <i class="zmdi zmdi-phone-in-talk"></i>
                                            </div>
                                            <div class="address-text">
                                                <p>+012 345 678 102 </p>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <ul class="social__icon">
                                    <li><a href="#"><i class="zmdi zmdi-twitter"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                    <li><a href="#"><i class="zmdi zmdi-google-plus"></i></a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-lg-2 col-sm-6 smt-30 xmt-30">
                            <div class="ft__widget">
                                <h2 class="ft__title">Categories</h2>
                                <ul class="footer-categories">
                                    <li><a href="shop-sidebar.html">Men</a></li>
                                    <li><a href="shop-sidebar.html">Women</a></li>
                                    <li><a href="shop-sidebar.html">Accessories</a></li>
                                    <li><a href="shop-sidebar.html">Shoes</a></li>
                                    <li><a href="shop-sidebar.html">Dress</a></li>
                                    <li><a href="shop-sidebar.html">Denim</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-lg-2 col-sm-6 smt-30 xmt-30">
                            <div class="ft__widget">
                                <h2 class="ft__title">Infomation</h2>
                                <ul class="footer-categories">
                                    <li><a href="about.html">About Us</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                    <li><a href="#">Terms & Conditions</a></li>
                                    <li><a href="#">Returns & Exchanges</a></li>
                                    <li><a href="#">Shipping & Delivery</a></li>
                                    <li><a href="#">Privacy Policy</a></li>
                                </ul>
                            </div>
                        </div>
                        <!-- Start Single Footer Widget -->
                        <div class="col-md-3 col-lg-3 col-lg-offset-1 col-sm-6 smt-30 xmt-30">
                            <div class="ft__widget">
                                <h2 class="ft__title">Newsletter</h2>
                                <div class="newsletter__form">
                                    <p>Subscribe to our newsletter and get 10% off your first purchase .</p>
                                    <div class="input__box">
                                        <div id="mc_embed_signup">
                                            <form action="#" method="post" id="mc-embedded-subscribe-form" name="mc-embedded-subscribe-form" class="validate" target="_blank" novalidate>
                                                <div id="mc_embed_signup_scroll" class="htc__news__inner">
                                                    <div class="news__input">
                                                        <input type="email" value="" name="EMAIL" class="email" id="mce-EMAIL" placeholder="Email Address" required>
                                                    </div>
                                                    <!-- real people should not fill this in and expect good things - do not remove this or risk form bot signups-->
                                                    <div style="position: absolute; left: -5000px;" aria-hidden="true"><input type="text" name="b_6bbb9b6f5827bd842d9640c82_05d85f18ef" tabindex="-1" value=""></div>
                                                    <div class="clearfix subscribe__btn"><input type="submit" value="Send" name="subscribe" id="mc-embedded-subscribe" class="bst__btn btn--white__color">
                                                        
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>        
                                </div>
                            </div>
                        </div>
                        <!-- End Single Footer Widget -->
                    </div>
                </div>
                <!-- Start Copyright Area -->
                <div class="htc__copyright__area">
                    <div class="row">
                        <div class="col-md-12 col-lg-12 col-sm-12 col-xs-12">
                            <div class="copyright__inner">
                                <div class="copyright">
                                    <p>© 2017 <a href="https://freethemescloud.com/">Free themes Cloud</a>
                                    All Right Reserved.</p>
                                </div>
                                <ul class="footer__menu">
                                    <li><a href="index.html">Home</a></li>
                                    <li><a href="shop.html">Product</a></li>
                                    <li><a href="contact.html">Contact Us</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Copyright Area -->
            </div>
        </footer>
        <!-- End Footer Area -->
    </div>
    <!-- Body main wrapper end -->
    <!-- QUICKVIEW PRODUCT -->
    <div id="quickview-wrapper">
        <!-- Modal -->
        <div class="modal fade" id="productModal" tabindex="-1" role="dialog">
            <div class="modal-dialog modal__container" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    </div>
                    <div class="modal-body">
                        <div class="modal-product">
                            <!-- Start product images -->
                            <div class="product-images">
                                <div class="main-image images">
                                    <img alt="big images" src="images/product/big-img/1.jpg">
                                </div>
                            </div>
                            <!-- end product images -->
                            <div class="product-info">
                                <h1>Simple Fabric Bags</h1>
                                <div class="rating__and__review">
                                    <ul class="rating">
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                        <li><span class="ti-star"></span></li>
                                    </ul>
                                    <div class="review">
                                        <a href="#">4 customer reviews</a>
                                    </div>
                                </div>
                                <div class="price-box-3">
                                    <div class="s-price-box">
                                        <span class="new-price">$17.20</span>
                                        <span class="old-price">$45.00</span>
                                    </div>
                                </div>
                                <div class="quick-desc">
                                    Designed for simplicity and made from high quality materials. Its sleek geometry and material combinations creates a modern look.
                                </div>
                                <div class="select__color">
                                    <h2>Select color</h2>
                                    <ul class="color__list">
                                        <li class="red"><a title="Red" href="#">Red</a></li>
                                        <li class="gold"><a title="Gold" href="#">Gold</a></li>
                                        <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                        <li class="orange"><a title="Orange" href="#">Orange</a></li>
                                    </ul>
                                </div>
                                <div class="select__size">
                                    <h2>Select size</h2>
                                    <ul class="color__list">
                                        <li class="l__size"><a title="L" href="#">L</a></li>
                                        <li class="m__size"><a title="M" href="#">M</a></li>
                                        <li class="s__size"><a title="S" href="#">S</a></li>
                                        <li class="xl__size"><a title="XL" href="#">XL</a></li>
                                        <li class="xxl__size"><a title="XXL" href="#">XXL</a></li>
                                    </ul>
                                </div>
                                <div class="social-sharing">
                                    <div class="widget widget_socialsharing_widget">
                                        <h3 class="widget-title-modal">Share this product</h3>
                                        <ul class="social-icons">
                                            <li><a target="_blank" title="rss" href="#" class="rss social-icon"><i class="zmdi zmdi-rss"></i></a></li>
                                            <li><a target="_blank" title="Linkedin" href="#" class="linkedin social-icon"><i class="zmdi zmdi-linkedin"></i></a></li>
                                            <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="zmdi zmdi-pinterest"></i></a></li>
                                            <li><a target="_blank" title="Tumblr" href="#" class="tumblr social-icon"><i class="zmdi zmdi-tumblr"></i></a></li>
                                            <li><a target="_blank" title="Pinterest" href="#" class="pinterest social-icon"><i class="zmdi zmdi-pinterest"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="addtocart-btn">
                                    <a href="#">Add to cart</a>
                                </div>
                            </div><!-- .product-info -->
                        </div><!-- .modal-product -->
                    </div><!-- .modal-body -->
                </div><!-- .modal-content -->
            </div><!-- .modal-dialog -->
        </div>
        <!-- END Modal -->
    </div>
    <!-- END QUICKVIEW PRODUCT -->
    
    <script id="inq-template" type="text/x-handlebars-template">
		{{#each .}}
		<div class="pro__review">
			<div class="review__details">
				<div class="review__info">
					<h4><a href="#">{{nickname}}</a></h4>
					<div class="rating__send">
						<a href="javascript:void(0)" id="{{inqId inqNum}}" onclick="inquiry.inqModify({{inqNum}})"><i class="zmdi zmdi-edit"></i></a>
						<a href="javascript:void(0)" onclick="inquiry.inqRemove({{inqNum}})"><i class="zmdi zmdi-close"></i></a>
					</div>
				</div>
				<div class="review__date">
					<span>{{updDate}}</span>
				</div>
				<p>{{inqContents}}</p>
			</div>
		</div>
		{{/each}}
	</script>
    
    <script type="text/javascript">
    	
    	$(document).ready(function() {
    		initCategory();
    		inquiry.init();
    		
    		var prodIdObj = {
    			'prodId' : '<c:out value="${PROD.prodId}" />'	
    		};
    	    
    	    $.ajax({
    	    	url: 'getUploadFile.do',
    	    	type: 'POST',
    	    	contentType: 'application/json',
    	    	data: JSON.stringify(prodIdObj),
    	    	success: function(data) {
    	    		debugger;
    	    		
    	    		$.each(data, function(index, item) {
    	    			var smallImgHtml, bigImgHtml;
    	    			if (index == 0) {
    	    				smallImgHtml = '<li role="presentation" class="pot-small-img active">';
    	    				bigImgHtml = '<div role="tabpanel" class="tab-pane fade in active" id="img-tab-' + index + '">';
    	    			} else {
    	    				smallImgHtml = "<li role='presentation' class='pot-small-img'>";
    	    				bigImgHtml = '<div role="tabpanel" class="tab-pane fade in" id="img-tab-' + index + '">';
    	    			}
    	    				
    	    			smallImgHtml = smallImgHtml + '<a href="#img-tab-' + index + '" role="tab" data-toggle="tab">'
    									+ '<img src="' + item.storedFileName + '" alt="small-image" style="width:120px; height:140px;">'
    									+ '</a></li>';
    										
    					bigImgHtml = bigImgHtml + '<img src="' + getOriginalFile(item.storedFileName) +  '" alt="full-image" style="width:440px; height:590px;">'
    									+ '</div>';
    										
    					$('#productSmallImg').append(smallImgHtml);
    					$('#productBigImg').append(bigImgHtml);
    	    		});
    	    	}
    	    });
    	});
    	
    	var inquiry = {
    		init : function() {
    			$('#inqSubmit').on('click', this.inqRegister.bind(this));
    			this.getInqList();
    		},
    		
    		inqRegister : function(e) {
    			e.preventDefault();
        		
    			var that = this;
    			
        		var inqObj = {
        			nickname: $('#inqNickname').val(), 
        			inqContents: $('#inqContents').val(),
        			prodId: "${PROD.prodId}"	
        		};
        		
        		$.ajax({
        			url: "inqRegister.do",
        			type: "POST",
        			contentType: "application/json; charset=utf-8",
        			dataType: "text",
        			data: JSON.stringify(inqObj),
        			success: function(data) {
        				console.log("data : " + data);
        				if (data === "success") {
        					debugger;
        					$('#inqContents').val("");
        					that.getInqList();
        				}
        			},
        			error: function(error) {
        				console.log("error : " + error);
        			}
        		});
    		},
    		
    		getInqList : function() {
    			debugger;
    			
    			var prodId = "${PROD.prodId}";
    			
    			$.ajax({
    				url : "getInqList.do",
    				type : "GET",
    				data : "prodId=" + prodId,
    				dataType : "json",
    				success : function(data) {
    					debugger;
    					
    					console.log("data : " + data);
    					
    					var inqSource = $('#inq-template').html();
    					var template = Handlebars.compile(inqSource);
    					
    					$('#inquiryInner').html(template(data));
    				}
    			});
    		},
    		
    		inqModify : function(inqNum) {
    			debugger;
    			
    			var replaceHtml = "";
    			var p = $("#inq" + inqNum).closest(".review__details").find("p");
    			
    			replaceHtml += "<div>"
    			replaceHtml += "<textarea id=" + "inqContents" + inqNum + ">" + p.html() + "</textarea>";
    			replaceHtml += "<a href='javascript:void(0)' onclick=inquiry.updateInq(" + inqNum + ") class='replaceInqAction'>저장</a>"
    			replaceHtml += "<a href='javascript:void(0)' onclick=inquiry.showInq() class='replaceInqAction'>취소</a>"
    			replaceHtml += "</div>";
    			
    			p.replaceWith(replaceHtml);
    		},
    		
    		updateInq : function(inqNum) {
    			debugger;
    			
    			var that = this;
    			
    			$.ajax({
    				url : 'modifyInquiry.do',
    				type : 'POST',
    				data : JSON.stringify({
    					inqContents : $('#inqContents' + inqNum).val(),
    					inqNum : inqNum
    				}),
    				contentType : 'application/json; charset=utf-8',
    				dataType : 'text',
    				success : function(data) {
    					debugger;
    					
    					console.log("data : " + data);
    					if (data === "success") {
    						that.getInqList();
    					}
    				},
    				error : function(error) {
    					
    				}
    			});
    		},
    		
    		showInq : function() {
    			this.getInqList();
    		},
    		
    		inqRemove : function(inqNum) {
    			if (confirm("댓글을 삭제하시겠습니까?") == false) {
    				return;
    			}
    			var that = this;
    			
    			$.ajax({
    				url : "removeInquiry.do",
    				type : "POST",
    				contentType : "application/json; charset=utf-8",
    				data : JSON.stringify({inqNum : inqNum}),
    				dataType : "text",
    				success : function(data) {
    					console.log("data : " + data);
    					if (data === "success") {
    						that.getInqList();
    					}
    				},
    				error : function(error) {
    					
    				}
    			});
    		}
    	}
    	
    	Handlebars.registerHelper('inqId', function(inqNum) {
    		return "inq" + inqNum;
    	});
    </script>
