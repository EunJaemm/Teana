<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>


<div class="container">
  <div class="row">
    <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
      <div class="card border-0 shadow rounded-3 my-5">
        <div class="card-body p-4 p-sm-5" style="background-color:#F5EFFE; border-color: #F5EFFE;">
          <h3 class="card-title text-center mb-5 fw-light fs-5"><b>탈퇴하기</b></h3>
				 <form id="form" method="post" onsubmit="return false">
				   <div class="form-floating mb-3">
				     <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="pw" id="pw">
				     <label for="floatingInput">비밀번호 입력</label>
				   </div>
			<hr class="my-4">
					</form>
           <div class="d-grid">
              <button id="delete" class="btn btn-primary btn-login text-uppercase fw-bold">탈퇴하기</button>
           </div>
         </div>
       </div>
     </div>
   </div>
 </div>
				   