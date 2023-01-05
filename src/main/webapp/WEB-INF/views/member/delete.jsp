<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<% 
String loginID = (String)session.getAttribute("loginID");
if(loginID==null) {%>
<!--  세선값 만료 확인 -->
<%} %>
<!-- 작업 처리 후 들어왔을 때 띄울 알림창 -->
<<script>

function warning(msg1, msg2) {
	swal.fire({
		 title: msg1,
		 text: msg2,
		 confirmButtonColor: '#7A1CF6',
		 icon: 'warning' /*디자인 타입*/
	    })
	
}

</script>

<!-- 회원 탈퇴를 위한 비밀번호 입력 시 비밀번호 일치 여부 확인 후
한 번 더 탈퇴 여부를 묻는 알림창 -->
<script>

$(document).ready(function(){
	$("#delete").click(function(){
		$.ajax({
			type:"post",
			url:"/ajax/deleteCheck",
			data:{"pw":$("#pw").val()},
			success: function(data){
				if(data=="ok") {
					console.log(data);
// 					alert(result);
					// 탈퇴 버튼 클릭 시 정말로 탈퇴할건지 묻는 모달 띄우기
					Swal.fire({
			  title: '정말요??',
			  text: "정말 탈퇴하실 건가요?",
			  icon: 'question',
			  showCancelButton: true, //cancel 버튼 보이기
			  confirmButtonColor: '#3085d6', //confirm 버튼 색깔
			  cancelButtonColor: '#d33', //cancel 버튼 색갈
			  confirmButtonText: '예',
			  cancelButtonText: '아니요',
			  reverseButtons: false //버튼 순서 거꾸로
					}).then((result) => {
				if(result.isConfirmed) {
					$("#form").attr("method","post");
					$("#form").attr("action","/member/delete");
					$("#form").attr("onsubmit","return true");
					                  $("#form").submit();
				}else if(result.isDismissed){
					Swal.fire({
						title: '회원 탈퇴 취소',
						text: '회원 탈퇴가 취소되었습니다.',
						confirmButtonColor: '#7A1CF6',
						icon: 'info'
					})
				}
			})
				}else{
						warning("이런? @@@", "비밀번호가 틀리네요!");
						return false;
				
			  } //result == ok
			} // success
		}); //ajax
	});//#delete
}); //document
</script>
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
				   