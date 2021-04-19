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
    
       
    <section>
        <div class="container">
            <div class="row">
                <div class="col-xs-12 col-md-9 content-wrap">
                    <div class="helpTitlebox">
                        <p>고객센터</p>
                    </div>
                    
                    <form action="userHelpModify" method="post" name="regForm">
	                    <input type="hidden" value="${userHelpVO.uhNo }" name="uhNo">
	                    <table class="table">
	                        <tbody class=t-control>
	                          <tr>
	                            <td class="t-title" ><label>작성자</label></td>
	                            <td><input class="form-control writer" name="userId"
	                            	 value="${userHelpVO.userId }" readonly></td>
	                          </tr>
	                          <tr>
	                              <td class="t-title">
	                              <label>질문유형</label></td>
	                              <td><input class="form-control writer" name="uhOption" 
	                              		value="${userHelpVO.uhOption }" readonly></td>
	                              
	                              
	                          </tr>
	                          <tr>
	                            <td class="t-title"><label>제목</label></td>
	                            <td><input class="form-control title" name="uhTitle"
	                            	 value="${userHelpVO.uhTitle }"></td>
	                          </tr>
	                          <tr>
	                            <td class="t-title"><label>내용</label></td>
	                            <td><textarea class="form-control" rows="7" name="uhContent">${userHelpVO.uhContent }</textarea></td>
	                          </tr>
	                        </tbody>
	                    </table>
                    </form>
                    <div class="titlefoot">
                        <button class="btn" id="userHelpModify">완료</button>
                        <button class="btn" onclick="location.href='userHelp'">취소</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>
       
       
    <%@ include file="../include/footer.jsp" %>   
       
    <script>
    	var userHelpModify = document.getElementById("userHelpModify");
    	userHelpModify.onclick = function() {
    	
	    	if(document.regForm.userId.value == '') {
	    		alert("작성자는 필수 사항 입니다");
	    		return;
	    	} else if(document.regForm.uhTitle.value == '') {
	    		alert("제목은 필수 사항 입니다");
	    		return;
	    	} else if(document.regForm.uhContent.value == '') {
	    		alert("내용은 필수 사항 입니다");
	    		return;
	    	} else if(confirm("수정하시겠습니까?")) {
	    		document.regForm.submit(); //폼전송
	    	}
   		}
    
    
    </script>
        
        
        
        
</body>
</html>