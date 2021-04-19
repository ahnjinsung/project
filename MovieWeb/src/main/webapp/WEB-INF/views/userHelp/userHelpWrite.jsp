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
                    
                    <form action="helpRegistForm" method="post" name="regForm">
	                    <table class="table">
	                        <tbody class=t-control>
	                          <tr>
	                            <td class="t-title"><label>작성자</label></td>
	                            <td><input class="form-control input" name="userId" id="userId"
	                            value="${sessionScope.userId }" readonly></td>
	                          </tr>
	                          <tr>
	                              <td class="t-title"><label>질문유형</label></td>
	                             
	                              <td>
	                                 <div class="form-group">
	                                      <select class="form-control" name="uhOption" id="uhOption">
	                                        <option>예매및취소</option>
	                                        <option>영화</option>
	                                        <option>계정</option>
	                                        <option>기타</option>
	                                      </select>
	                                </div>
	                              </td>
	                              
	                          </tr>
	                          <tr>
	                            <td class="t-title"><label>제목</label></td>
	                            <td><input class="form-control input"  name="uhTitle" id="uhTitle"></td>
	                          </tr>
	                          <tr>
	                            <td class="t-title"><label>내용</label></td>
	                            <td><textarea class="form-control" rows="7" name="uhContent" id="uhContent"></textarea></td>
	                          </tr>
	                        </tbody>
	                    </table>
                    </form>
                    
                    <div class="titlefoot">
                        <button class="btn" id="helpRegist">등록</button>
                        <button class="btn" onclick="location.href='userHelp'">목록</button>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>

	<%@ include file="../include/footer.jsp" %>       
	
	<script>
		var helpRegist = document.getElementById("helpRegist");
		helpRegist.onclick = function() {
			
			if($("#writer").val() == '' ) {
				alert("작성자는 필수 사항입니다");
				document.regForm.writer.focus();
				return; //함수 종료
			} else if($("#title").val() == '') {
				alert("제목은 필수 사항입니다");
				document.regForm.title.focus();
				return;
			} else if($("#content").val() == '') {
				alert("내용은 필수 사항입니다");
				document.regForm.content.focus();
				return;
			}else {
    			document.regForm.submit(); //폼의 서브밋기능
    		}
	}
	</script>
	
	
	
</body>
</html>