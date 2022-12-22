<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@9"></script>


  <h5 class="card-title text-center mb-5 fw-light fs-5"><b>로그인</b></h5>
    <form action="/main/login" method="post">
      <div class="form-floating mb-3" >
       <input type="text" name="id" class="form-control" id="floatingInput">
       <label for="floatingInput">아이디</label>
      </div>
      <div class="form-floating mb-3">
        <input type="password" name="pw" class="form-control" id="floatingPassword">
        <label for="floatingPassword">비밀번호</label>
      </div>
      <div class="d-grid">
        <div class="d-grid">
          <input type="hidden" value="false" id="idflag" placeholder="아이디 중복체크 했나요?"><br>
           <button class="btn btn-primary btn-login text-uppercase fw-bold" style="border: none; background-color: #5107b0;" type="submit">로 그 인</button>
        </div>
      </div>
    </form>