<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!-- Start Login Register Area -->
        <div class="htc__login__register bg__white ptb--130" style="background: rgba(0, 0, 0, 0) url(images/bg/5.jpg) no-repeat scroll center center / cover ;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <ul class="login__register__menu">
                            <li role="presentation" class="register active"><a href="#snsRegister">Register</a></li>
                        </ul>
                    </div>
                </div>
                
                <!-- Start Login Register Content -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="htc__login__register__wrap">
                            <!-- Start Single Content -->
                            <div id="snsRegister" role="tabpanel" class="single__tabs__panel tab-pane fade in active">
                                <form id="snsRegisterFrm" class="login" method="post" action="userSnsRegister.do">
                                	<input type="hidden" name="snsRegisterSnsId" value="${NEW_SNS_USER.snsId}">
                                	<input type="hidden" name="snsRegisterEmail" value="${NEW_SNS_USER.email}">
                                	
                                	<label for="snsRegisterNickname">닉네임</label>
                                	<input type="text" placeholder="닉네임" id="snsRegisterNickname" class="unchecked" name="snsRegisterNickname" style="width:70%" required>
                                	<a href="#" id="snsNicknameCheckBtn" class="registerBtn" style="font-size:15px; height:40px; line-height:40px; width:100px">중복 체크</a>
                                	
                                	<label for="snsRegisterName">이름</label>
                                	<input type="text" placeholder="이름" id="snsRegisterName" name="snsRegisterName" required>
                                	
                                	<label for="snsRegisterBirth">생일</label>
                                	<input type="date" placeholder="생일" id="snsRegisterBirth" name="snsRegisterBirth" required>
                                	
                                	<label>성별</label>
                                	<select id="snsRegisterGender" name="snsRegisterGender">
		                            	<option value="M">남자</option>
		                                <option value="F">여자</option>
		                            </select>
		                            
		                            <label for="phone2">휴대폰 번호</label>
		                            <input type="text" id="snsRegisterPhone1" name="snsRegisterPhone1" value="010" style="width:32%" readonly>
			                        <input type="text" id="snsRegisterPhone2" name="snsRegisterPhone2" class="digit_check" maxlength="4" style="width:32%" required>
			                        <input type="text" id="snsRegisterPhone3" name="snsRegisterPhone3" class="digit_check" maxlength="4" style="width:32%" required>
			                        
			                        <label>우편 번호</label>
			                        <input type="text" id="snsRegisterZipCode" name="snsRegisterZipCode" class="postcodify_postcode5" style="width:70%" required onkeypress="return false;">
			                        <a href="#" id="sns_postcodify_search_button" class="registerBtn" style="font-size:15px; height:40px; line-height:40px; width:100px">주소 검색</a>
			                        
			                        <label>주소</label>
			                        <input type="text" id="snsRegisterAddr" name="snsRegisterAddr" class="postcodify_address" required onkeypress="return false;">
			                        
			                        <label>상세 주소</label>
			                        <input type="text" id="snsRegisterAddrDetail" name="snsRegisterAddrDetail" class="postcodify_details" placeholder="상세 주소" required>
			                        
			                        <div style="text-align:center">
			                        	<button type="submit" class="btn btn-default btn-lg">가입하기</button>
			                        </div>
                                </form>
                            </div>
                            <!-- End Single Content -->
                        </div>
                    </div>
                </div>
                <!-- End Login Register Content -->
            </div>
        </div>
        <!-- End Login Register Area -->
        
        <!-- 주소 검색 api -->
        <script src="//d1p7wdleee1q2z.cloudfront.net/post/search.min.js"></script>
        
        <script type="text/javascript"> 
        	$('#sns_postcodify_search_button').postcodifyPopUp();
        	
        	var snsRegister = {
        		init : function() {
        			this.bindEvent();
        		},
        		
        		bindEvent : function() {
        			$('#snsNicknameCheckBtn').on('click', this.snsNicknameCheckBtnClick);
        			$('#snsRegisterNickname').on('keyup', this.snsRegisterNicknameKeyUp);
        			$('.digit_check').on('keydown', formCheck.digitCheckKeydown);
        			$('.digit_check').on('keyup', formCheck.digitCheckKeyUp);
        			$('#snsRegisterFrm').on('submit', this.snsRegisterFrmSubmit);
        		},
        		
        		snsNicknameCheckBtnClick : function() {
					var nicknameObj = {"nickname" : $('#snsRegisterNickname').val()};
        			
        			$.ajax({
        				type : "post",
        				data : JSON.stringify(nicknameObj),
        				dataType : "json",
        				url : "nicknameCheck.do",
        				contentType : "application/json; charset=utf-8",
        				success : function(data) {
        					if (data.count === 1) {
        						confirm("이미 닉네임이 존재합니다.");
        						$('#snsRegisterNickname').removeClass('checked');
        						$('#snsRegisterNickname').addClass('unchecked');
        					} else {
        						confirm("사용 가능한 닉네임 입니다.");
        						$('#snsRegisterNickname').removeClass('unchecked');
        						$('#snsRegisterNickname').addClass('checked');
        					}
        				},
        				error : function(error) {
        					
        				}
        			});	
        		},
        		
        		snsRegisterNicknameKeyUp : function() {
        			$('#snsRegisterNickname').removeClass('checked');
					$('#snsRegisterNickname').addClass('unchecked');
        		},
        		
        		/*
        		registerPhoneCheckKeyDown : function() {
        			if (event.keyCode >=48 && event.keyCode <= 57 ) {
        		        return true;
        		    } else if (event.keyCode === 8 || event.keyCode === 9) {
        		    	return true;
        		    }
        			else {
        		        event.returnValue = false;
        		    }
        		},
        		*/
        		
        		snsRegisterFrmSubmit : function(e) {
        			if ($('#snsRegisterNickname').attr('class') === 'unchecked') {
        				e.preventDefault();
        				alert("닉네임 중복체크를 해주세요.");
        			}
        		}
        	}
        	
        	snsRegister.init();
        </script>
        