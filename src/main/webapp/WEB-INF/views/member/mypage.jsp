<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

 <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
  <link id="pagestyle" href="${pageContext.request.contextPath}/resources/css/soft-ui-dashboard.css?v=1.0.6" rel="stylesheet" />
  
  
<!-- ${pageContext.request.contextPath} -->

<div class="container">
   <div class="row">
     <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
       <div class="card border-0 shadow rounded-3 my-5">
         <div class="card-body p-4 p-sm-5">
					<h3 class="card-title text-center mb-5 fw-light fs-5"><b>마이 페이지</b></h3>
					<div class="mypage">
						<div class="form-floating mb-3">   
						   <input type="text" class="form-control" value="${vo.name }" readonly="readonly">
						   <label>이름</label>
						</div>
						<div class="form-floating mb-3">
						   <input type="text" class="form-control" value="${vo.phone}" readonly="readonly">
						   <label>연락처</label>
						</div>
						<div class="form-floating mb-3">
						   <input type="text" class="form-control" value="${vo.birth }" readonly="readonly">
						   <label>생년월일</label>
						</div>
						<hr class="my-4">
						<div class="d-grid">
						   <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit"
						   onclick="location.href='/member/update';">수정하기</button>
						</div>
					</div>
					 <br>
						<div class="container" align="right" style="color: #d1b9f6; margin: 5px; font-size: 15px;"
						 	onclick="location.href='/member/delete';"> 
				    <span>회원탈퇴</span>
				     </div>
		 </div>
	   </div>
	 </div>
   </div> 
</div>