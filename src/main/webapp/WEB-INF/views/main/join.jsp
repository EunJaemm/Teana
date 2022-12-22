<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

    <form action="/main/join" method="post" id="join">
      <div class="form-floating mb-3" >
       <input type="text" name="id" class="form-control" id="id" placeholder="아이디" required>
       <label for="id">아이디</label>
       <div align="right">
         <button id="idcheck">
                   중복<br>체크
         </button>
       </div>
       <span class="iddiv">&nbsp;</span>
      </div>
      <div class="form-floating mb-3">
       <input type="password" name="pw" class="form-control" id="pw" placeholder="비밀번호" required onchange="checkpw()">
       <label for="floatingPassword">비밀번호</label>
       <span class="pwdiv">&nbsp;</span>
      </div>
      <div class="form-floating mb-3">
       <input type="password" name="pw2" class="form-control" id="pw2" placeholder="비밀번호 확인"
       				required onchange="checkpw2()">
       <label for="floatingpassword">비밀번호 확인</label>
       <span class="pw2div">&nbsp;</span> 
      </div>
      <div class="form-floating mb-3">
       <input type="text" name="name" class="form-control" id="name" placeholder="이름" required>
       <label for="floatingInput">이름</label>
       <span>&nbsp;</span>
      </div>
      <div class="form=floating mb-3">
       <input type="tel" name="phone" class="form-control" id="phone" placeholder="전화번호" maxlength="13" oninput="autoHyphen(this)" required>
       <label for="floatingUnput">전화번호</label>
       <span>&nbsp;</span>
      </div>
      
    </form> 
</body>
</html>