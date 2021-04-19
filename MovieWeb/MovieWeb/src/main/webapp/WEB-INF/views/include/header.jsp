<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>

    <style>
	  .login_ok_box{
            width: 350px;
            padding: 5px;
        }
        
        .login_box_body button{
            background-color: white;
        } 
</style>

</head>


<body>
	
	<header>   
            <nav class="navbar navbar-default">
                <div class="container">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <a class="navbar-brand" href="${pageContext.request.contextPath }" ><img src="${pageContext.request.contextPath }/resources/img/logo2.png" width="100"></a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                           
                        	<ul class="nav navbar-nav navbar-right" id="header-link">
	                              <form class="navbar-form navbar-left" role="search">
		                                <div class="form-group">
		                                  <input type="text" class="form-control" placeholder="movie">
		                                </div>
		                                <button type="submit" class="btn btn-default">
		                                <span class="glyphicon glyphicon-search"></span></button>
	                              </form>
                                
                               <li><a href="${pageContext.request.contextPath }/movie/movieList" title="영화">영화예매
                               <span class="glyphicon glyphicon-film"></span></a></li>
                               
                               
                               
                               <li><a href="${pageContext.request.contextPath }/userHelp/userHelp" title="고객센터">고객센터
                               <span class="glyphicon glyphicon-user"></span></a></li>
                               
                               
                               
                               
                               <li class="dropdown">
                               	<c:choose>
                               	<c:when test="${sessionScope.userId eq null }">
                               		<a class="login dropdown-toggle" data-toggle="dropdown" href="#">로그인
                                   	<span class="caret"></span></a>
                               	</c:when>
                               	<c:otherwise>
                               		<a class="login dropdown-toggle" data-toggle="dropdown" href="#">${sessionScope.userName }
                                   	<span class="caret"></span></a>
                               	</c:otherwise>
                               	</c:choose>
                                   
                                    <ul class="dropdown-menu">
	                                    <c:choose>
                                       	<c:when test="${sessionScope.userId eq null }">
                                       		<li><a href="${pageContext.request.contextPath }/user/userJoin"><span class="glyphicon glyphicon-pencil"></span>회원가입</a></li>
                                       		<li><a href="${pageContext.request.contextPath }/user/userLogin"><span class="glyphicon glyphicon-log-in"></span>로그인</a></li>
                                       	</c:when>
                                       	<c:otherwise>
                                    		<div class="login_ok_box">
		                                          		<div class="login_box_header">
		                                              		<strong>${sessionScope.userId }님</strong>환영합니다
		                                          		</div>
		                                          	<hr>
		                                          <div class="login_box_body">
		                                              <div>
		                                                  <h4><button type="button" class="glyphicon glyphicon-cog" id="userPageBtn">정보수정</button></h4><br>
		                                                  <h4><button type="button" class="glyphicon glyphicon-film" id="moviePreBtn">예매확인/취소</button></h4><br>
		                                                  <h4><button type="button" class="glyphicon glyphicon-user" id="userHelpBtn">문의내역</button></h4>
		                                              </div>
		                                          </div>
		                                          <hr>
		                                          <div class="login_box_footer">
		                                              	마지막 로그인 ${sessionScope.userLoginDate }
		                                              <button type="button" id="userLogout">로그아웃</button>
		                                          </div>
		                                       </div>
                                   		</c:otherwise>
                                   		</c:choose>
                                  	</ul>
                               	</li>
                           	</ul>
                        </div>

                    </div>
                </div>
            </nav>
   </header>
   
   <script>
   
   		$("#userPageBtn").click(function(){
   			location.href="${pageContext.request.contextPath }/user/userPage?option=userPage";
   		})
   		
   		$("#moviePreBtn").click(function(){
   			location.href="${pageContext.request.contextPath }/user/userPage?option=userPre";
   		})
   		
   		$("#userHelpBtn").click(function(){
   			location.href="${pageContext.request.contextPath }/user/userPage?option=userHelp";
   		})
   		
   		$("#userLogout").click(function(){
   			location.href="${pageContext.request.contextPath }/user/userLogout";
   		})
   </script>
   
</body>
</html>