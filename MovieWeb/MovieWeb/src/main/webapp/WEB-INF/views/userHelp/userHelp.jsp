<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>  
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
/* ========= user Help페이지 ==========*/
        .userHelpPage{
          text-align: center;
        }
/* ========= user Help페이지 끝==========*/    
    </style>
    
    
</head>
<body>
   

	<%@ include file="../include/header.jsp" %>
   
   
  
   
   <section style="margin-top: 0px">
       <div class="container">
         <br>
         <br>
         <br>
          <div>
                     <br>
                      <h1>고객센터<span class="glyphicon glyphicon-user"></span></h1><br>
                      <h2>무엇이 궁금하신가요?</h2>
                          <br><br>
                       <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="5">고객 문의 내역</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                       <th class="col-sm-1">NO</th>
                                       <th class="col-sm-1">질문유형</th>
                                       <th class="col-sm-4">제목</th>
                                       <th class="col-sm-2">답변상태</th>
                                       <th class="col-sm-2">등록일</th>
                                  </tr>
                                  <c:forEach var="vo" items="${helpList }">
                                  <tr>
                                      <td>${vo.uhNo }</td>
                                      <td>${vo.uhOption }</td>
                                      <td><a href="userHelpDetail?uhNo=${vo.uhNo }">${vo.uhTitle }</a></td>
                                      <td>${vo.uhCheck }</td>
                                      <td>${vo.uhDate }</td>
                                  </tr>
                                  </c:forEach>
                                </tbody>
                           </table>
                           
                           <!-- 고객센터 페이징 -->
                           <form>
                           <div class="userHelpPage">
		                       <c:if test="${pageVO.prev }"><!-- 이전버튼 활성화 여부 -->
				                   <a href="userHelp?pageNum=${pageVO.startPage-1 }">
				                   <input type="button" value="이전" class="btn btn-secondary"></a>
			                   </c:if>
			                   <!-- pageNum -->
		                       <c:forEach var="num" begin="${pageVO.startPage }" end="${pageVO.endPage }">   
	                           		<a class="${pageVO.pageNum == num ? 'active': '' }"
	                           		href="userHelp?pageNum=${num }">
	                           		<input type="button" value="${num }" class="btn btn-secondary"></a>
	                           </c:forEach>
	                           <!-- 다음버튼 -->
	                           <c:if test="${pageVO.next }">
	                           		<a href="userHelp?pageNum=${pageVO.endPage+1 }">
	                           		<input type="button" value="다음" class="btn btn-secondary"></a>
	                           </c:if>
                           </div>
                           <br>
                           </form>
                           <button class="btn btn-secondary" style="float: right" id="helpRegist">글쓰기</button>
                           <br><br><br><br>
            </div>
      </div>
   </section>
   
   <%@ include file="../include/footer.jsp" %>
   
   <script>
   $(document).ready(function(){
	   var userId = '${sessionScope.userId}';
	   
	   /* ============글쓰기 화면으로이동(로그인해야 글 쓸수 있도록)============ */
	   /* 
	  	var HelpRegist = document.getElementById("HelpRegist");
	  	HelpRegist.onclick = function() {
			location.href = "userHelpWrite";
		} 
	  	*/ 
	  	
	   	$("#helpRegist").click(function(){
	   		if(userId == ''){
	   			alert("로그인이 필요한 시스템입니다.");
	   			location.href = '${pageContext.request.contextPath }/user/userLogin';
	   		} else {	   			
	   			location.href = '${pageContext.request.contextPath }/userHelp/userHelpWrite';
	   		}
	   	})
   
   })
	   
	   	
	   	
   </script>
   
   
</body>
</html>