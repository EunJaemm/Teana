<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- alert 모달 필수  --> 
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>
<script src="https://cdn.jsdelivr.net/npm/promise-polyfill@7.1.0/dist/promise.min.js"></script>

  <!-- Template Main CSS File -->
  <link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">

    
<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto" style="width: 50%;">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5" style="background-color:#F5EFFE;">
						<h3 class="card-title text-center mb-5 fw-light fs-5"><b>회원정보 수정</b></h3>
					 <form action="/member/update" method="post" id="update">
						<!-- tg-text=title -->
							<!-- 비밀번호 -->
							<div class="join_pw form-floating mb-3">
							   <input type="password" id="pw" name="pw" maxlength="16" class="form-control"
							       required onchange="pwUpdateCheck(), checkpw()">
							   <label for="floatingPassword">비밀번호</label>
							   <span class="pwdiv" style="font-size: small;">&nbsp;</span>
							</div>
							<!-- 비밀번호 확인 -->
							<div class="join_pw2" form-floating mb-3">
								<input type="password" id="pw2" name="pw2" maxlength="16" class="form-control"
									required onchange="checkpw2()">
								<label for="floatingpassword">비밀번호 확인</label>
								<span class="pw2div" style="font-size: small;">&nbsp;</span>
							</div>
							<!-- 이름 -->
							<div class="join_name form-floating mb-3" >
								<input type="text" id="name" name="name" value="${vo.name }" class="form-control"
									required readonly="readonly">
								<lable for="floatingInput">이름</lable>
								<span class="namediv" style="font-size: small;">&nbsp;</span>
							</div>
							<!-- 연락처 -->
							<div class="join_phone form-floating mb-3" >
								<input type="text" id="phone" name="phone" value="${vo.phone }" class="form-control"
									required maxlength="13"
								oninput="autoHyphen(this)" autofocus>
								<lable for="floatingInput">연락처</lable>
								<span class="phonedeiv" style="font-size: small;">&nbsp;</span>
							</div>
						<hr class="my-4">
			  <div class="d=grid">
			    <button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit"
			      style="background=color: #5107b; border-color: #5107b0;">회원정보수정</button>
			  </div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>
							