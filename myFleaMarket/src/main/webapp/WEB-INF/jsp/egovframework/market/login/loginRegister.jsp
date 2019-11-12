<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<style>
	.login input {
		margin-bottom:15px;
	}
	
	.login select {
		margin-bottom:15px;
	}
	
	.login label {
		width:100%;
	}
	
	.registerBtn {
		border: 1px solid #d5d5d5;
	    display: inline-block;
	    font-size: 20px;
	    height: 50px;
	    line-height: 50px;
	    text-align: center;
	    text-transform: capitalize;
	    transition: all 0.5s ease 0s;
	    width: 150px;
	    color: #4b4b4b;
	    text-transform: uppercase;
	}
	
	.registerBtn:hover {
		background: #ff4136;
	    color: #fff;
	    border: 1px solid #ff4136;
	}
	
</style>
    <!-- Start Login Register Area -->
        <div class="htc__login__register bg__white ptb--130" style="background: rgba(0, 0, 0, 0) url(images/bg/5.jpg) no-repeat scroll center center / cover ;">
            <div class="container">
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <ul class="login__register__menu" role="tablist">
                            <li role="presentation" class="login active"><a href="#login" role="tab" data-toggle="tab">Login</a></li>
                            <li role="presentation" class="register"><a href="#register" role="tab" data-toggle="tab">Register</a></li>
                        </ul>
                    </div>
                </div>
                <!-- Start Login Register Content -->
                <div class="row">
                    <div class="col-md-6 col-md-offset-3">
                        <div class="htc__login__register__wrap">
                            <!-- Start Single Content -->
                            <div id="login" role="tabpanel" class="single__tabs__panel tab-pane fade in active">
                                <form id="loginFrm" class="login">
                                    <input type="text" id="loginEmail" name="loginEmail" placeholder="이메일">
                                    <input type="password" id="loginPw" name="loginPw" placeholder="패스워드">
                                </form>
                                <div class="tabs__checkbox">
                                    <input type="checkbox">
                                    <span> Remember me</span>
                                    <span class="forget"><a href="#">Forget Password?</a></span>
                                </div>
                                <div class="row">
                                	<div class="col-md-12">
                                		<span id="loginResultMsg" style="color:red; display:none;">아이디 또는 패스워드가 잘못되었습니다.</span>
                                	</div>
                                </div>
                                <div class="htc__login__btn mt--30">
                                    <a href="#" id="loginBtn">Login</a>
                                </div>
                                <div class="htc__social__connect">
                                    <h2>Or Login With</h2>
                                    <a href="${naverAuthUrl}"><img src="img/Login_with_NAVER_button_Green.png" style="width:75%;" /></a>
                                    <!-- 
                                    <ul class="htc__soaial__list">
                                        <li><a class="bg--twitter" href="#"><i class="zmdi zmdi-twitter"></i></a></li>
                                        <li><a class="bg--instagram" href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                        <li><a class="bg--facebook" href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                        <li><a class="bg--googleplus" href="#"><i class="zmdi zmdi-google-plus"></i></a></li>
                                    </ul>
                                    -->
                                </div>
                            </div>
                            <!-- End Single Content -->
                            <!-- Start Single Content -->
                            <div id="register" role="tabpanel" class="single__tabs__panel tab-pane fade">
                                <form id="registerFrm" class="login" method="post" action="userRegister.do">
                                	<label for="registerEmail">이메일</label>
                                	<input type="email" placeholder="이메일" id="registerEmail" class="unchecked" name="registerEmail" style="width:70%" required>
                                	<a href="#" id="emailCheckBtn" class="registerBtn" style="font-size:15px; height:40px; line-height:40px; width:100px">중복 체크</a>
			                        
                                	<div style="width:100%"><label for="registerPw" style="width:20%">패스워드</label> <span id="pwCheckMsg" style="color:red; display:none"></span></div>
                                	<input type="password" placeholder="패스워드" id="registerPw" class="registerPwCheck" name="registerPw" required>
                                	
                                	<label for="registerPwCheck">패스워드 확인</label>
                                	<input type="password" placeholder="패스워드 확인" id="registerPwCheck" class="registerPwCheck" required>
                                	
                                	<label for="registerNickname">닉네임</label>
                                	<input type="text" placeholder="닉네임" id="registerNickname" class="unchecked" name="registerNickname" style="width:70%" required>
                                	<a href="#" id="nicknameCheckBtn" class="registerBtn" style="font-size:15px; height:40px; line-height:40px; width:100px">중복 체크</a>
                                	
                                	<label for="registerName">이름</label>
                                	<input type="text" placeholder="이름" id="registerName" name="registerName" required>
                                	
                                	<label for="registerBirth">생일</label>
                                	<input type="date" placeholder="생일" id="registerBirth" name="registerBirth" required>
                                	
                                	<label>성별</label>
                                	<select id="registerGender" name="registerGender">
		                            	<option value="M">남자</option>
		                                <option value="F">여자</option>
		                            </select>
		                            
		                            <label for="phone2">휴대폰 번호</label>
		                            <input type="text" id="registerPhone1" name="registerPhone1" value="010" style="width:32%" readonly>
			                        <input type="text" id="registerPhone2" name="registerPhone2" class="digit_check" maxlength="4" style="width:32%" required>
			                        <input type="text" id="registerPhone3" name="registerPhone3" class="digit_check" maxlength="4" style="width:32%" required>
			                        
			                        <label>우편 번호</label>
			                        <input type="text" id="registerZipCode" name="registerZipCode" class="postcodify_postcode5" style="width:70%" required onkeypress="return false;">
			                        <a href="#" id="postcodify_search_button" class="registerBtn" style="font-size:15px; height:40px; line-height:40px; width:100px">주소 검색</a>
			                        
			                        <label>주소</label>
			                        <input type="text" id="registerAddr" name="registerAddr" class="postcodify_address" required onkeypress="return false;">
			                        
			                        <label>상세 주소</label>
			                        <input type="text" id="registerAddrDetail" name="registerAddrDetail" class="postcodify_details" placeholder="상세 주소" required>
			                        
			                        <div style="text-align:center">
			                        	<button type="submit" id="submitBtn" class="btn btn-default btn-lg">가입하기</button>
			                        </div>
                                </form>
                                
                                <div class="htc__social__connect">
                                    <h2>Or Register With</h2>
                                    <a href="${naverAuthUrl}"><img src="img/Join_with_NAVER_button_custom.png" style="width:75%;" /></a>
                                    <!--  
                                    <ul class="htc__soaial__list">
                                        <li><a class="bg--twitter" href="#"><i class="zmdi zmdi-twitter"></i></a></li>
                                        <li><a class="bg--instagram" href="#"><i class="zmdi zmdi-instagram"></i></a></li>
                                        <li><a class="bg--facebook" href="#"><i class="zmdi zmdi-facebook"></i></a></li>
                                        <li><a class="bg--googleplus" href="#"><i class="zmdi zmdi-google-plus"></i></a></li>
                                    </ul>
                                    -->
                                </div>
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
        	$('#postcodify_search_button').postcodifyPopUp();
        	
        	var register = {
        		init : function() {
        			this.bindEvent();
        		},
        		
        		bindEvent : function() {
        			$('#emailCheckBtn').on('click', this.emailCheckBtnClick);
        			$('#nicknameCheckBtn').on('click', this.nicknameCheckBtnClick);
        			$('#registerEmail').on('keyup', this.registerEmailKeyUp);
        			$('.registerPwCheck').on('keyup', this.registerPwCheckKeyUp);
        			$('#registerNickname').on('keyup', this.registerNicknameKeyUp);
        			$('.digit_check').on('keydown', formCheck.digitCheckKeydown);
        			$('#registerFrm').on('submit', this.registerFrmSubmit);
        		},
        		
        		emailCheckBtnClick : function() {
        			var emailObj = {"email" : $('#registerEmail').val()};
        			
        			$.ajax({
        				type : "post",
        				data : JSON.stringify(emailObj),
        				dataType : "json",
        				url : "emailCheck.do",
        				contentType : "application/json; charset=utf-8",
        				success : function(data) {
        					if (data.count === 1) {
        						confirm("이미 아이디가 존재합니다.");
        						$('#registerEmail').removeClass('checked');
        						$('#registerEmail').addClass('unchecked');
        					} else {
        						confirm("사용 가능한 아이디 입니다.");
        						$('#registerEmail').removeClass('unchecked');
        						$('#registerEmail').addClass('checked');
        					}
        				},
        				error : function(error) {
        					
        				}
        			});
        		},
        		
        		nicknameCheckBtnClick : function() {
					var nicknameObj = {"nickname" : $('#registerNickname').val()};
        			
        			$.ajax({
        				type : "post",
        				data : JSON.stringify(nicknameObj),
        				dataType : "json",
        				url : "nicknameCheck.do",
        				contentType : "application/json; charset=utf-8",
        				success : function(data) {
        					if (data.count === 1) {
        						confirm("이미 닉네임이 존재합니다.");
        						$('#registerNickname').removeClass('checked');
        						$('#registerNickname').addClass('unchecked');
        					} else {
        						confirm("사용 가능한 닉네임 입니다.");
        						$('#registerNickname').removeClass('unchecked');
        						$('#registerNickname').addClass('checked');
        					}
        				},
        				error : function(error) {
        					
        				}
        			});	
        		},
        		
        		registerEmailKeyUp : function() {
        			$('#registerEmail').removeClass('checked');
					$('#registerEmail').addClass('unchecked');
        		},
        		
        		registerPwCheckKeyUp : function() {
        			var $input = $('.registerPwCheck');
        			
        			if ($input.eq(0).val() === $input.eq(1).val()) {
        				$('#pwCheckMsg').hide();
        				$('#pwCheckMsg').text('');
        			} else {
        				$('#pwCheckMsg').show();
        				$('#pwCheckMsg').text('패스워드가 맞지 않습니다.');
        			}
        		},
        		
        		registerNicknameKeyUp : function() {
        			$('#registerNickname').removeClass('checked');
					$('#registerNickname').addClass('unchecked');
        		},
        		
        		/*
        		digitCheckKeydown : function() {
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
        		
        		registerFrmSubmit : function(e) {
        			if ($('#registerEmail').attr('class') === 'unchecked') {
        				e.preventDefault();
        				alert("이메일 중복체크를 해주세요.");
        			} else if ($('#registerNickname').attr('class') === 'unchecked') {
        				e.preventDefault();
        				alert("닉네임 중복체크를 해주세요.");
        			} else if (!($('#pwCheckMsg').css('display') === 'none')) {
        				e.preventDefault();
        				alert('패스워드가 불일치 합니다.');
        			}
        		}
        	}
        	
			var userRegisterResult = '<c:out value="${USER_REGISTER_RESULT}" />';
			
			if (userRegisterResult !== "") {
				if (userRegisterResult !== "0") /* 회원 가입에 성공한 경우 */
					alert("회원가입에 성공했습니다.");	
				else /* 회원 가입에 실패한 경우 */
					alert("회원가입에 실패했습니다.");
			}
			
			var snsRegisterResult = '<c:out value="${SNS_REGISTER_RESULT}" />';
			
			if (snsRegisterResult !== "") {
				if (snsRegisterResult !== "0") /* 회원 가입에 성공한 경우 */
					alert("회원가입에 성공했습니다.");	
				else /* 회원 가입에 실패한 경우 */
					alert("회원가입에 실패했습니다.");
			}
			
			$('#loginBtn').on('click', function() {
				var loginObj = {
					email : $('#loginEmail').val(),
					pw : $('#loginPw').val()
				}
				
				$.ajax({
					type : "POST",
					data : JSON.stringify(loginObj),
					dataType : "json",
					url : "login.do",
					contentType : "application/json; charset=utf-8",
					success : function(data) {
						if (data.loginResult === "idError") {
							console.log("idError");
							$('#loginResultMsg').show();
							$('#loginResultMsg').text('아이디가 존재하지 않습니다.');
						} else if (data.loginResult === "pwError") {
							console.log("pwError");
							$('#loginResultMsg').show();
							$('#loginResultMsg').text('비밀번호가 일치하지 않습니다.');
						} else {
							console.log("success");
							window.location.href = "./main.do";
						}
					},
					error : function(error) {
						
					}
				});
			});
			
        	register.init();
        </script>
        