<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>극장홈페이지</title>

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
    
    <section>
       
        <div class="container">
            <div class="row">
                <div class="col-sm-10 col-md-7 col-lg-6 login-form">
                    
                    <form action="loginForm" method="post">
                          <div class="form-group">
                              <label>아이디</label>
                              <input type="text" class="form-control" placeholder="아이디를 입력하세요" id="userId" name="userId">
                          </div>
                          <div class="form-group">
                              <label>비밀번호</label>
                              <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" id="userPw" name="userPw">
                          </div>

                          <!--button의 클래스 속성은 부트스트랩에서 확인-->
                          <button type="button" class="btn btn-block" style="background-color: #cccccce0" onclick="location.href='userJoin'">회원가입</button>
                          <input type="submit" class="btn btn-block" value="로그인">
                          <a href="#" data-toggle="modal" data-target="#idModal">아이디찾기</a><br>
                          <a href="#" data-toggle="modal" data-target="#pwModal" id="findPw">비밀번호찾기</a>
                    </form>
                </div>
               
            </div>
            
        </div>
        <div id="idModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">아이디찾기</h4>
              </div>
                <div class="modal-body">
                      <div class="input-group">
                        <span class="input-group-addon">이메일</span>
                        <input type="text" class="form-control" id="userEmail1" name="email" placeholder="Email">
                      </div>
                     <br>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="findIdBtn">찾기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
        
        <div id="pwModal" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">비밀번호찾기</h4>
              </div>
                <div class="modal-body">
                      <div class="input-group">
                            <span class="input-group-addon">아이디</span>
                            <input type="text" class="form-control" id="userId2" name="id" placeholder="id">
                      </div>
                      <div class="input-group">
                            <span class="input-group-addon">이메일</span>
                            <input type="text" class="form-control" id="userEmail2" name="email" placeholder="Email">
                      </div>
                     <br>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="findPwBtn">찾기</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
    </section>
    
    <%@ include file="../include/footer.jsp" %>
    
    <script>
	    $(document).ready(function(){
			
			(function(){
				var msg = '${msg}';
				if(msg != ''){
					alert(msg);
				}
			})();
			
		})
		
		
		$("#findIdBtn").click(function(){
			
			if($("#userEmail1").val() == ''){
				alert("이메일을 입력하세요");
				return false;
			}
			
			
			var userEmail = $("#userEmail1").val();
			$.ajax({
				type:"POST",
				url: "emailConfirm",
				data:JSON.stringify({"userEmail":userEmail}),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					if(result==""){
						$("#userEmail1").val("");
						alert("이메일 주소를 다시 입력해주세요");
						$("#idModal").modal();
						
					}else{
						$("#userEmail1").val("");
						alert("회원님의 아이디 : " + result);
					}
				},
				error:function(){
					alert("아이디찾기 에러");	
				}
				
			})			
		})
		
		
		$("#findPwBtn").click(function(){
			
			if($("#userEmail2").val() == ''){
				alert("이메일을 입력하세요");
				return false;
			}else if($("#userId2").val() == ''){
				alert("아이디를 입력하세요");
				return false;
			}
			
			var userEmail = $("#userEmail2").val();
			var userId = $("#userId2").val();
			
			var jsonData = {"userEmail":userEmail, "userId":userId};
			$.ajax({
				type:"POST",
				url: "findPw",
				data:JSON.stringify(jsonData),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					if(result==""){
						alert("아이디와 이메일 주소를 확인하세요");
						$("#userId2").val("");
						$("#userEmail2").val("");
						$("#pwModal").modal();
						return false;
						
					}else{
						$("#userId2").val("");
						$("#userEmail2").val("");
						alert("해당 이메일로 인증확인 이메일을 전송했습니다");
					}
				},
				error:function(){
					alert("비밀번호찾기 에러");	
				}
				
			})			
		})
    </script>
   
</body>
</html>