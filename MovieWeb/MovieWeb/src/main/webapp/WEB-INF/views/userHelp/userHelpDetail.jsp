<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
                <div class="col-xs-12 col-md-9 write-wrap">
                    <div class="helpTitlebox">
                        <p>상세보기</p>
                    </div>
                    <div>
                    	<form action="userHelpUpdate" method="post" name="regForm">
                    	<input type="hidden" value="${userHelpVO.uhNo }" name="uhNo">
                       <div>
                           <label>NO</label>
                           <p class="form-group">${userHelpVO.uhNo }</p>
                       </div>
                        <div>
                            <label>DATE</label>
                            <p class="form-group" >${userHelpVO.uhDate }</p>
                        </div>
                        <div class="form-group">
                            <label>질문유형</label>
                            <p class="form-group">${userHelpVO.uhOption }</p>
                        </div>
                        <div class="form-group">
                            <label>작성자</label>
                            <input class="form-control writer" value="${userHelpVO.userId }"readonly>
                        </div>
                        <div class="form-group">
                            <label>제목</label>
                            <input class="form-control title" value="${userHelpVO.uhTitle }"readonly>
                        </div>
                        <div class="form-group">
                            <label>내용</label>
                            <textarea class="form-control" rows="10"readonly>${userHelpVO.uhContent }</textarea>
                        </div>
                        </form>
                        
                        <div class="detailfoot">
                            <button class="btn" id="userHelpUpdate">수정</button>
                            <button class="btn" id="userHelpDelete">삭제</button>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </section>


	<c:if test="${sessionScope.userId eq 'admin' }">
	<section>
		<div class="container">
			<div class="row">
				<div class="col-xs-12 col-md-9 reply-wrap">
					<div class="movie_rep_content form-group">
						<textarea class="form-control" rows="5" id="rep_comment"></textarea>
					</div>
					<button class="btn movie_rep_button" id="hlepRegist">답변등록</button>
				</div>

			</div>
		</div>
		
	</section>
	</c:if>
	
	<!-- 고객센터 댓글 -->
	<section style="margin-bottom: 30px">
		<div id="replyList">
			<!-- 
			<div class="container">
				<div class="row">
					<div class="col-xs-12 col-md-9 reply-wrap">
						<div class="reply-content">
							<div class="reply-group">
								<div class="reply-input">
									<strong>${sessionScope.userId }</strong> 
									<small>2019/11/13</small>
									<p>관리자 ㄴㄴ</p>
								</div>
							</div>
						</div>
					</div>
	
				</div>
			</div>
			-->	
		</div>
	</section>
	
	


	<%@ include file="../include/footer.jsp" %>

	<script>
		
		//수정화면으로이동
		var userHelpUpdate = document.getElementById("userHelpUpdate");
		userHelpUpdate.onclick = function() {
			document.regForm.submit(); //폼에 접근해서 폼으로 전송
		}

		//삭제기능
		var userHelpDelete = document.getElementById("userHelpDelete");
		userHelpDelete.onclick = function() {

			if (confirm("삭제 하시겠습니까?")) {
				document.regForm.setAttribute("action", "userHelpDelete");//액션 속성을바꾼다.
				document.regForm.submit(); //서브밋
			}
		}
	</script>
	
	<!-- 댓글처리  -->
	<script>
		$(document).ready(function(){
			
			//답변등록버튼
			$("#hlepRegist").click(function(){
				add();
			})
			
			//답변등록
			function add(){
				
				var uhNo = '${userHelpVO.uhNo }';
				var reply = $('#rep_comment').val();
				
				$.ajax({
					type:"POST",
					url:"../reply/new",
					data: JSON.stringify({"uhNo":uhNo, "uhRepContent":reply}),
					contentType: "application/json; charset=utf-8",
					success: function(result){
						$("#rep_comment").val("");
						getList(1,true);//리로드
					},
					error: function(status){
						alert("답변등록 실패" + status);
					}	
				})
			} //답변등록 끝
			
			
			//댓글목록
			getList(1,true);
			var str = "";
			function getList(pageNum, reset) {
				
				if(reset == true) { //reset은 str초기화여부
					str = "";
				}
				
				var uhNo = '${userHelpVO.uhNo }';
				
				$.getJSON(
					"../reply/getReply/"+ uhNo +"/"+ pageNum , //요청보낼 주소
					function(data) { //성공시 전달받을 익명함수
														
						for(var i = 0; i < data.length; i++) {
							str += "<div class='container'>";
		                    str += "<div class='row'>";
		                    str += "<div class='col-xs-12 col-md-9 reply-wrap'>";
	                        str += "<div class='reply-content'>";
	                        str += "<div class='reply-group'>";    
	                        str += "<div class='reply-input'>";
	                        str += "<strong>관리자</strong>";
	                        str += "<small>"+data[i].uhRepRegdate+"</small>";
	                        str += "<p>"+data[i].uhRepContent+"</p>";        
	                        str += "</div>";        
	                        str += "</div>";        
	                        str += "</div>";    
	                        str += "</div>";  
	                        str += "</div>";
	                        str += "</div>";
						} //for끝
	                    $("#replyList").html(str); //replyList아래에 문자열을 통째로 추가
						
					}
				)
				
			}//댓글 목록 끝
			
		})
	</script>




</body>
</html>