<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${pageContext.request.contextPath} -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<h1>main/nickCheck.jsp </h1>

<!-- login 성공 메세지 불러오기 -->
<script>
$(document).ready(function({
	let msg1 = "${msg1}";
	let msg2 = "${msg2}"
//	alert()	
    if(msg1!=""&&msg2!=""){
    	warning(msg1, msg2);
    }
});
</script>

<!-- login 성공 alert 모달 -->
<script>
function warning(message, message2){
	Swal.fire({
		title: message,
		tesc: message2,
		confirmButtonColor: '#7A1CF6',
		icon: 'warning' /*디자인 타입*/
	})
}
</script>

<script>
$(document).ready(function(){
	var nameflag = document.getElementById("nameflag").value;
// 	alert(nameflag);

    $("nameCheckBtn").click(function(){
// 		alert('닉네임 중복체크');   
        $.ajax({
        	url : "/member/namecheck",
        	data : {'name':$("#name").val()},
        	success : function(result){
//             	alert("ajax 성공");
                if(result == "no"){
//             		alert("no");
		            //닉네임이 존재할 경우 빨강으로 , 아니면 파랑으로 처리하는 디자인
		            swal.fire ({
		            title: '이미 존재하는 닉네임입니다.',
		            text: '다른 닉네임을 입력해주세요',
		            confirmButtonColor: '#7A1CF6',
		            icon: 'warning' /*디자인 타입*/
		            })
		            
		            document.getElementById("nick").value=="";
		            $("#name").focus();
                } else if(result == "ok"){
                 swal.fire ({
                	title: '축하합니다!',
                	text: '사용 가능한 닉네임입니다.',
                	    confirmButtonColor: '#7A1CF6',
                	icon: 'basic' /*디자인 타입*/)}
                	nameflag="true";
                } else {
                	$(".namediv").html("");
                }
            },//success
            error : function(error) {
            	$('.iddiv').html("에러");
            	return false;
            }//error
        });//ajax
    });//namecheck
    
	// 닉네임 중복여부를 확인한 뒤 submit 가능
	$("#join").submit(function(){
		if(nameflag.value=="false"){
			alert("닉네임 중복 여부를 확인하세요");
			$("#name").focus();
			return false;
		}
	});
    
    $("#nameJoin").attr("action","/main/nameJoin");
        $("#nameJoin").submin();
	
});
</script>

<div class="container">
    <div class="row">
      <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
        <div class="card border-0 shadow rounded-3 my-5">
          <div class="card-body p-4 p-sm-5">
            <h5 class="card-title text-center mb-5 fw-light fs-5"><b>닉네임</b></h5>
            
            <form role= "form" method="post" id="nameJoin">
                <div class="form=floating mb-3">
                <input type="tel" name="name" class="form-control" id="nick" placeholder="전화번호" min="2" required>
                <label for="floatingInput">닉네임 확인하기</label>
                <input type="hidden" value="false" id="nameflag" placeholder="닉네임 중복체크 했나요?"> <br>
              <button id="nameCheckBtn" class="btn btn-primary btn-login text-uppercase fw-bold" type="submit">확인하기</button>
                <span class="namediv">&nbsp;</span>
              </div>
                <hr class="my-4">
              <div class="d-grid">
              </div>
            </form>
            
            
          </div>
        </div>
      </div>
    </div>
  </div>
  <!-- End login -->