<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<!-- Dropzone.css -->
    <link href="vendors/dropzone/dist/min/dropzone.min.css" rel="stylesheet">
    
    <!-- Switchery -->
    <link href="vendors/switchery/dist/switchery.min.css" rel="stylesheet">
</head>
    
	<div class="right_col" role="main">
          <div class="">
          	<!--  
            <div class="page-title">  
              	<div class="title_left">
                	<h3>이미지 등록 </h3>
              	</div>
            	<div class="title_right">
			       	<div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
			            <div class="input-group">
			                <input type="text" class="form-control" placeholder="Search for...">
			                <span class="input-group-btn">
			                	<button class="btn btn-default" type="button">Go!</button>
			                </span>
			           	</div>
			       	</div>
	        	</div>
	        </div>
	        -->

            <div class="clearfix"></div>

            <div class="row">
              <div class="col-md-9 col-sm-9 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>이미지 등록</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <p>* 상품 이미지는 640x640에 최적화 되어 있습니다.
						- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.
						- 확대하기를 누를 경우 원본이미지를 확인할 수 있습니다. 
						- 사진을 클릭 후 이동하여 등록순서를 변경할 수 있습니다.
						- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.
						최대 지원 사이즈인 640 X 640 으로 리사이즈 해서 올려주세요.(개당 이미지 최대 10M )</p>
                    
                    <form action="uploadForm.do" class="dropzone" method="post" id="uploadForm" enctype="multipart/form-data"></form>
                    <!--  
                    <div class="col-md-12 col-sm-12 col-xs-12" id="uploadedList" style="border:1px solid black; height:100px; cursor:pointer;">
	                
	                </div>
                    <form action="uploadForm.do" method="post" id="uploadForm" enctype="multipart/form-data">
                    	<input type="file" name="file" id="uploadFile">
                    </form>
                    -->
                    <br />
                    <br />
                    <br />
                    <br />
                  </div>
                </div>
              </div>
            </div>
            
            <div class="row">
	            <div class="col-md-9 col-sm-9 col-xs-12">
	                <div class="x_panel">
	                  <div class="x_title">
	                    <h2>기본 정보</h2>
	                    <div class="clearfix"></div>
	                  </div>
	                  <div class="x_content">
	                    <br />
	                    <form class="form-horizontal form-label-left" id="product_register_form" action="productRegister.do" method="post">
	
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">카테고리</label>
	                        <div class="col-md-4 col-sm-4 col-xs-12">
	                          <select class="form-control" id="a_category">
	                            <option value="">전체</option>
	                            <c:forEach items="${A_CATEGORY_LIST}" var="aCategoryList">
	                            	<option value="<c:out value='${aCategoryList.cateCode}' />">
	                            		<c:out value='${aCategoryList.cateName}' />
	                            	</option>
	                            </c:forEach>
	                          </select>
	                        </div>
	                        <div class="col-md-4 col-sm-4 col-xs-12">
	                          <select class="form-control" id="b_category" name="cateCode">
	                            <option value="">전체</option>
	                          </select>
	                        </div>
	                      </div>
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">거래 방식</label>
	                        <div class="col-md-4 col-sm-4 col-xs-12">
	                          <select class="form-control" name="tradeCode">
	                            <option value="tr1">직거래</option>
	                            <option value="tr2">선불택배(가격에 택배비 포함)</option>
	                            <option value="tr3">착불택배(가격에 택배비 미포함)</option>
	                          </select>
	                        </div>
	                      </div>
	                      <!--  
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">거래 지역 </label>
	                        <div class="col-md-4 col-sm-4 col-xs-12">
	                          <input type="text" class="form-control" disabled="disabled" placeholder="선호 거래 지역">
	                        </div>
	                        <div class="col-md-6 col-sm-6 col-xs-12">
	                        	<button type="button" class="btn btn-default">최근 지역</button>
	                        	<button type="button" class="btn btn-primary">지하철 검색</button>
	                        	<button type="button" class="btn btn-success">지역 검색</button>
	                        </div>
	                      </div>
	                      -->
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">상태</label>
	                        <div class="col-md-4 col-sm-4 col-xs-12">
	                          <select class="form-control" name="statusCode">
	                            <option value="st1">중고</option>
	                            <option value="st2">새상품</option>
	                          </select>
	                        </div>
	                      </div>
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">제목</label>
	                        <div class="col-md-9 col-sm-9 col-xs-12">
                          		<input type="text" class="form-control" placeholder="제목 (최대 40자)" name="title" required>
                        	</div>
	                      </div>
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">가격</label>
	                        <div class="col-md-9 col-sm-9 col-xs-12">
                          		<input type="text" class="form-control digit_check" placeholder="10000 (가격은 숫자로만 입력)" name="price" required>
                        	</div>
                        	<!--  
                        	<div class="col-md-2 col-sm-2 col-xs-12"></div>
                        	<div class="col-md-9 col-sm-9 col-xs-12">
	                        	<div class="checkbox">
	                            	<label>
	                              		<input type="checkbox" class="flat" checked="checked"> 택배비포함
	                            	</label>
	                            	<label>
	                              		<input type="checkbox" class="flat"> 교환가능
	                            	</label>
	                          	</div>
                          	</div>
                          	-->
	                      </div>
	                      <div class="form-group">
	                        <label class="control-label col-md-2 col-sm-2 col-xs-12">설명</label>
	                        <div class="col-md-9 col-sm-9 col-xs-12">
                          		<textarea class="form-control" rows="6" placeholder="상품설명은 2000자까지 가능합니다." name="des"></textarea>
                        	</div>
	                      </div>
	                      <div class="form-group">
	                      	<label class="control-label col-md-2 col-sm-2 col-xs-12">수량</label>
	                        <div class="col-md-9 col-sm-9 col-xs-12">
                          		<input type="text" class="form-control digit_check" placeholder="1" name="stock" required>
                        	</div>
	                      </div>
	                      <div class="form-group">
	                        <div class="col-md-11 col-sm-11 col-xs-11" style="text-align:right;">
	                          <button type="submit" class="btn btn-success">물품 등록</button>
	                        </div>
	                      </div>
	                    </form>
	                  </div>
	                </div>
	              </div>
	      		</div>
          </div>
        </div>
        
	<!-- Dropzone.js -->
    <script src="vendors/dropzone/dist/min/dropzone.min.js"></script>

    <!-- Switchery -->
    <script src="vendors/switchery/dist/switchery.min.js"></script>

	<!-- jquery.form.min.js -->
	<!-- <script src="js/jquery.form.min.js"></script> -->
	
	<script type="text/javascript">
		Dropzone.autoDiscover = false;
		
		var productRegister = {
			init : function() {
				this.bindEvent();
			},
			
			bindEvent : function() {
				$('#a_category').on('change', this.aCategoryChange);
				$('.digit_check').on('keydown', formCheck.digitCheckKeydown);
				$('.digit_check').on('keyup', formCheck.digitCheckKeyUp);
				$('#product_register_form').on('submit', this.productRegisterFormSubmit);
			},
			
			aCategoryChange : function() {
				var aCategoryObj = {"aCategory" : $(this).val()};
				
				$('#b_category').children().remove();
				
				$.ajax({
					type : "post",
					url : "bCategoryList.do",
					contentType : "application/json",
					data : JSON.stringify(aCategoryObj),
					success : function(data) {
						console.log(data);
						
						productRegister.displayBCategory(data);
					},
					error : function(error) {
						
					}
				});
			},
			
			productRegisterFormSubmit : function(event) {
				debugger;
				
				if ($('#a_category option:selected').val() === "" || $('#b_category option:selected').val() === "") {
					alert("카테고리를 선택하세요");
					return false;
				} else if ($('.dz-preview').length == 0) {
					alert("물품 이미지를 등록해주세요");
					return false;
				} else if ($('.dz-preview').length > 4) {
					alert("물품 이미지는 최대 4개까지 등록가능합니다");
					return false;
				}
				
				var $that = $(this);
				
				$('.dz-preview').each(function(i) {
					var origFileName = $(this).find('[data-dz-name]').html();
					var storedFileName = $(this).find('.dz-remove').data('resFile');
					var fileSize = $(this).find('[data-dz-size] strong').html();
					
					$that.append("<input type='hidden' name='attachList[" + i + "].origFileName' value='" + origFileName + "'>");
					$that.append("<input type='hidden' name='attachList[" + i + "].storedFileName' value='" + storedFileName + "'>");
					$that.append("<input type='hidden' name='attachList[" + i + "].fileSize' value='" + fileSize + "'>");
				});
			},
			
			displayBCategory : function(bCategoryObj) {
				if (bCategoryObj.length > 0) {						
					$.each(bCategoryObj, function(index, item) {
						var bCategoryOption = "<option value='" + item.cateCode + "'>" + item.cateName + "</option>";
						
						$('#b_category').append(bCategoryOption);
					});	
				} else {
					$('#b_category').append("<option value='" + $('#a_category').val() + "'>전체</option>");
				}
			}		
		};
		
		$('#uploadForm').dropzone({
			addRemoveLinks: true,
			acceptedFiles: 'image/*',
			maxFilesize: 10,
			maxFiles: 4,
			parallelUploads: 4,
			uploadMultiple: true,
			
			removedfile : function(file) {
				debugger;
				var resFile = $(file._removeLink).data("resFile");
				
				console.log(resFile);
				
				$.ajax({
					url: "deleteFile.do",
					type: "POST",
					data: JSON.stringify({file : resFile}),
					contentType: "application/json",
					success : function(data) {
						debugger;
						if (data === "deleted") {
							var refFile = file.previewElement;
							refFile.parentNode.removeChild(file.previewElement);
						}
					},
					error : function(data) {
						
					}
				});
			},
			init : function() {
				this.on("error", function(file, xhr) {
					debugger;
					
					var refFile = file.previewElement;
					refFile.parentNode.removeChild(file.previewElement);
		        });
				
				
				/*
				this.on('success', function(file) {
					debugger;
					$(file._removeLink).data('resFile', file.xhr.responseText);
				});
				*/
				
				this.on('successmultiple', function(files, response) {
					debugger;
					
					for (var i=0; i<files.length; i++) {
						$(files[i]._removeLink).data('resFile', response[i]);
					}
				});
			}
		});
		
		productRegister.init();
	</script>        