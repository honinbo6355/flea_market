<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="col-md-3 left_col">
          <div class="left_col scroll-view">
            <div class="navbar nav_title" style="border: 0;">
              <a href="register.do" class="site_title"><i class="fa fa-paw"></i> <span>MyStore</span></a>
            </div>

            <div class="clearfix"></div>

            <!-- menu profile quick info -->
            <div class="profile clearfix">
              <div class="profile_pic">
              	<!-- <img src="images/img.jpg" alt="..." class="img-circle profile_img"> -->
                <img src="images/store.png" id="store_img" />
              </div>
              <div class="profile_info">
                <span>${sessionScope.USER.nickname}님의</span>
                <h2>개인 상점</h2>
              </div>
            </div>
            <!-- /menu profile quick info -->

            <br />

            <!-- sidebar menu -->
            <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
              <div class="menu_section">
                <ul class="nav side-menu">
                  <li><a href="${pageContext.request.contextPath}/main.do"><i class="fa fa-home"></i> 홈 </a></li>
                  <li><a href="register.do"><i class="fa fa-edit"></i> 물품 등록 </a></li>
                  <li><a href="manage.do"><i class="fa fa-desktop"></i> 물품 관리 </a></li>
                </ul>
              </div>
            </div>
            <!-- /sidebar menu -->

          </div>
        </div>