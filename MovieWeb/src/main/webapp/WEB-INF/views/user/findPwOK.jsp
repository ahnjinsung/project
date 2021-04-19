<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>인덱스를 만들어 보자</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <!--개인 디자인 추가-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    
    
    <style type="text/css">

        
    </style>
    
    
</head>
<body>
   
   <%@ include file="../include/header.jsp" %>
   
   
   <section style="margin-top: 0px">
       <div class="userform">
           <div class="container">
                <div class="col-sm-2userform userjoin_ok">
                    <h2>이메일 인증에 성공하였습니다<span class="glyphicon glyphicon-ok"></span></h2><br>
             		<div class="center">회원님의 비밀번호는 <strong>${userPw }</strong></div>
                    <div class="userjoin_btn">
	                    <button class="btn btn-default" id="mainBtn">메인</button>
	                    <button class="btn btn-default" id="loginBtn">로그인</button>
                    </div>
               </div>
           </div>
      </div>
   </section>
	
	<%@ include file="../include/footer.jsp" %>
	
	<script>
		var mainBtn = document.getElementById("mainBtn");
		mainBtn.onclick = function(){
			location.href="${pageContext.request.contextPath }/";			
		}
		
		var loginBtn = document.getElementById("loginBtn");
		loginBtn.onclick = function(){
			location.href="${pageContext.request.contextPath }/user/userLogin";
		}
			
	</script>
   
</body>
</html>