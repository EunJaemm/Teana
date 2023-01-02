<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- ${pageContext.request.contextPath} -->
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
<!-- Template Main CSS File -->
<link href="${pageContext.request.contextPath}/resources/css/style.css" rel="stylesheet">
<link href="${pageContext.request.contextPath}/resources/css/login.css" rel="stylesheet">

<!-- 비밀번호 유효성 검사 -->
<script type="text/javascript">
// 비밀번호 유효성 검사
function checkpw(){
	var pw = document.getElementById("pw").value;
	 if(pw.length>7) {
		 if(pw.match(/([a-zA-Z0-9].*[!,@,#,$,%,^,&,*,?,_,~,-)])/)||
		    pw.match(/([!,@,#,$,%,^,&,*,?,_,~,-)].*[a-zA-Z0-9])/)) {
		     $(".pwdiv").html("사용 가능한 비밀번호입니다.");
		     $(".pwdiv").css('color','blue');
		    }else {
		       $(".pwdiv").html("비밀번호는 영어대소문자, 숫자, 특수문자가 하나씩 포함되어야 합니다.");
		       $(".pwdiv").css('color','red');
		       document.getElementById("pw").value="";
		    }
	  }else {
		     $(".pwdiv").html("비밀번호는 8글자 이상, 16글자 이하만 사용 가능합니다.");
		     $(".pwdiv").css('color','red');
		     document.getElemntById("pw").value="";
	 }
}
</script>

<!-- 비밀번호 일치 검사 -->
<script>
function checkpw2(){
	if($('#pw').val()!=$('#pw2').val()){
		$('.pw2div').html('비밀번호가 일치하지 않습니다.');
		$('.pw2div').css('color','red');
		$('#pw2').focus();
		document.getElementById("pw2").value="";
	}else{
		$('.pw2div').html('비밀번호가 일치합니다.');
		$('.pw2div').css('color','blue');
		$('#pw2').focus();
		
	}
}

const autoHyphen = (target) => {
 target.value = target.value
 .replace(/[^0])-9]/g, '')
 .replace(/^(\d{0,3})(\d{0,4})(\d{0,4})$/g, "$1-$2-$3")
 .replace(/(\-{1,2})$/g, "");
}

</script>

<!-- 아이디 중복 체크 후 회원가입-->
<script>
$(document).ready(function(){
	var idflag = document.getElementById("idflag");
//  alert(idflag.value);

    $("#join").submit(function(){
    	if(idflag.value=="false") {
    		alert("아이디 중복 여부를 확인하세요");
    		$("#id").focus();
    		return false;
    	}
    });
	
    $("#idcheck").click(function(){
//       alert('중복체크');
         $.ajax({
        	 url : "/ajax/idcheck",
        	 data: {'id':$("#id").val()},
        	 success : function(result) {
        		 if(result == "no"){
        			 //아이디가 존재할 경우 빨강으로, 아니면 파랑으로 처리하는 디자인
        			 $('.iddiv').html("이미 존재하는 아이디입니다");
        			 $('.iddiv').css('color', 'red');
        			 document.getElementById("id").value=="";
        			 $("#id").focus();
        		 } else {
        			 $(".iddiv").html("사용 가능한 아이디입니다");
        			 $(".iddiv").css("color", "blue");
        			 idflag.value="true";
        			 document.set
        		 }
        	 },//success
        	 error : function(error) {
        		 $('.iddiv').html("에러");
        		 return false;
        	 }//error
         });//ajax
    });//idcheck
    
    $("#name").change(function(){
//    	alert('닉네임 중복체크');
        $.ajax({
         url : "/ajax/nickcheck",
         data: {'nick':$("#nick").val()},
         success : function(result) {
        	 if(result == "no"){
            //닉네임이 존재할 경우 빨강으로, 아니면 파랑으로 처리하는 디자인
             $(".namediv").html("이미 존재하는 닉네임입니다.");
             $(".namediv").css("color","red");
             document.getElementById("name").value=="";
             $("#name").focus();
        	      } else if(result == "ok"){
        	    	  $("namediv").html("사용 가능한 닉네임입니다.");
        	 $(".namediv").css("color","blue");
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
}); //document
</script>


    <!-- login -->
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
