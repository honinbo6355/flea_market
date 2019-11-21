<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
	.page-title .title_right {
		float:right;
	}
	.top_search .input-group {
		float:left;
	}
	.top_search .input-group .input-group-btn{
		width:auto;
	}
</style>

	<div class="right_col" role="main">
		<div class="">
            <div class="page-title">
            	<div class="title_right" style="width:25%;">
			       	<div class="col-md-12 col-sm-12 col-xs-12 form-group pull-right top_search">
			            <div class="input-group">
			                <input type="text" id="keywordTxt" class="form-control" placeholder="물품명을 입력하세요..." value="${PAGING.search.keyword}">
			                <span class="input-group-btn">
			                	<button id="searchBtn" class="btn btn-default" type="button" onclick="searchProd()" >검색</button>
			                </span>
			           	</div>
			           	<!--  
			           	<div class="input-group">
			       			<select class="form-control">
			       				<option>10개씩</option>
		                    	<option>20개씩</option>
		                    	<option>50개씩</option>
		                    	<option>100개씩</option>
			       			</select>
			       		</div>
			       		<div class="input-group">
			       			<select class="form-control">
			       				<option>전체</option>
		                    	<option>판매중</option>
		                    	<option>예약중</option>
		                    	<option>판매완료</option>
			       			</select>
			       		</div>
			       		-->
			       	</div>
	        	</div>
	        </div>
	        
	        <div class="clearfix"></div>
	        
	        <div class="row">
	        	<div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                  <div class="x_title">
                    <h2>물품 현황</h2>
                    <div class="clearfix"></div>
                  </div>
                  <div class="x_content">
                    <table class="table table-hover">
                      <thead>
                        <tr>
                          <th>상태</th>
                          <th>물품명</th>
                          <th>가격</th>
                          <th>최근수정일</th>
                          <th>기능</th>
                        </tr>
                      </thead>
                      <tbody>
                      	<c:forEach var="product" items="${PROD_LIST}">
	                      	<tr>
	                          <td><c:out value="${product.statusName}" /></td>
	                          <td><a href="modify.do?prodId=${product.prodId}&page=${PAGING.search.page}&perPageNum=${PAGING.search.perPageNum}
	                          &keyword=${PAGING.search.keyword}" style="color:#337ab7"><c:out value="${product.title}" /></a></td>
	                          <td><c:out value="${product.price}" /></td>
	                          <td><fmt:formatDate value="${product.updDate}" pattern="yyyy-MM-dd"/></td>
	                          <td>
	                          	<button type="button" class="btn btn-success">보기</button>
		                        <button type="button" class="btn btn-danger" onclick="deleteProduct(${product.prodId})">삭제</button>
	                          </td>
	                        </tr>	
                      	</c:forEach>
                      	
                      </tbody>
                    </table>
					<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:center;">
							<ul class="pagination">  
								<c:if test="${PAGING.prev}">
									<li>
								      <a href="manage.do?page=${PAGING.startPage-1}&perPageNum=${PAGING.search.perPageNum}
								      &keyword=${PAGING.search.keyword}" aria-label="Previous">
								        <span aria-hidden="true">&laquo;</span>
								      </a>
								    </li>
								</c:if>
								<c:forEach var="page" begin="${PAGING.startPage}" end="${PAGING.endPage}">
									<li
									<c:out value="${PAGING.search.page == page ? 'class=active' : ''}" />>
									<a href="manage.do?page=${page}&perPageNum=${PAGING.search.perPageNum}
									&keyword=${PAGING.search.keyword}">${page}</a>
									</li>
								</c:forEach>
								<c:if test="${PAGING.next}">
									<li>
								      <a href="manage.do?page=${PAGING.endPage+1}&perPageNum=${PAGING.search.perPageNum}
								      &keyword=${PAGING.search.keyword}" aria-label="Next">
								        <span aria-hidden="true">&raquo;</span>
								      </a>
							    	</li>
							    </c:if>
								
								<!--    
								<li>
							      <a href="#" aria-label="Previous">
							        <span aria-hidden="true">&laquo;</span>
							      </a>
							    </li>
							    <li class="active"><a href="#">1</a></li>
							    <li><a href="#">2</a></li>
							    <li><a href="#">3</a></li>
							    <li><a href="#">4</a></li>
							    <li><a href="#">5</a></li>
							    <li>
							      <a href="#" aria-label="Next">
							        <span aria-hidden="true">&raquo;</span>
							      </a>
							    </li>
							    -->
							</ul>
						</div>
					</div>
                  </div>
                </div>
              </div>
              <div class="row">
              	<div class="col-md-12 col-sm-12 col-xs-12" style="text-align:right;">
              		<div class="form-group">
              			<button type="button" class="btn btn-success" onclick="location.href='register.do'">물품 등록</button>
              		</div>
              	</div>
              </div>              
	        </div>
        </div>
    </div>
    
    <form method="post" action="productDelete.do" id="deleteForm">
    	<input type="hidden" name="page" id="page">
    	<input type="hidden" name="perPageNum" id="perPageNum">
    	<input type="hidden" name="prodId" id="prodId">
    	<input type="hidden" name="keyword" id="keyword">
    </form>
    
    <script type="text/javascript">
    	function deleteProduct(prodId) {
			var result = confirm('정말 삭제하시겠습니까?');
			
    		if (result) {
    			$('#page').val(${PAGING.search.page});
    			$('#perPageNum').val(${PAGING.search.perPageNum});
    			$('#prodId').val(prodId);
    			$('#keyword').val("<c:out value='${PAGING.search.keyword}' />");
    			$('#deleteForm').submit();
    		}
    	}
    	
    	$('#keywordTxt').keydown(function(e) {
    		if (e.keyCode == 13) {
    			searchProd();
    		}
    	});
    	
    	function searchProd() {
			var keywordTxt = $('#keywordTxt').val();
    		
    		window.location.href = "manage.do?keyword=" + keywordTxt;
    	}
    </script>
    