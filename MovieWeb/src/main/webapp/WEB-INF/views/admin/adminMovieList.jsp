<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/jquery.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    <!--개인 디자인(가장 아래쪽에 링크)-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
     
</head>
<body>
    <header>
        <nav class="navbar navbar-default">
                <div class="container">
                    <div class="container-fluid">

                        <div class="navbar-header">
                            <a class="navbar-brand" href="#" ><img src="${pageContext.request.contextPath }/resources/img/logo2.png" width="100"></a>
                        </div>

                        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                           
                            <ul class="nav navbar-nav navbar-right" id="header-link">
                               
                                
                                <li><a href="adminMoviePre" title="사용자예매목록">사용자예매목록
                                <span class="glyphicon glyphicon-ok"></span></a></li>
                                
                                <li><a href="adminMovieList" title="영화">영화
                                <span class="glyphicon glyphicon-film"></span></a></li>
                                
                                
                                <li><a style="height: 50px"></a></li>
                                
                            </ul>
                        </div>

                    </div>
                </div>
            </nav>
    </header>
    <section>
        <div class="container">
           <div style="text-align: center;">
               <h2>영화목록 현황입니다.</h2>
           </div>
           <div>
               <table class="table">
                   <tr>
                       <th>번호</th>
                       <th>영화이름</th>
                       <th>사진</th>
                       <th>개봉일</th>
                       <th>상영종료일</th>
                   </tr>
                   <c:forEach var="vo" items="${vo}">
                   <tr>
                       <td>${vo.movNo }</td>
                       <td><a href="#" id="${vo.movNo }">${vo.movName }</a></td>
                       <td><img src="view?fileLoca=${vo.movFileLoca }&fileName=${vo.movFileName }" style="height: 80px;"></td>
                       <td>${vo.movStartDate }</td>
                       <td>${vo.movEndDate }</td>
                   </tr>
                   </c:forEach>
               </table>
           </div>
           <button type="button" class="btn btn-info btn-lg" id="movieInsertForm">영화추가하기</button>
           <div class="modal fade" id="movieInsert" role="dialog">
                <div class="modal-dialog">

                  <!-- Modal content-->
                  <div class="modal-content">
                    <div class="modal-header">
                      <button type="button" class="close" data-dismiss="modal">×</button>
                      <h4 class="modal-title">영화 추가</h4>
                    </div>
                    <div class="modal-body">
                      <input type="text" class="form-control" placeholder="영화제목" id="inName">
                      <input type="text" class="form-control" placeholder="영화내용" id="inContent">
                      <input type="text" class="form-control" placeholder="개봉일 ex)19/12/30" id="inStart">
                      <input type="text" class="form-control" placeholder="종료일 ex)19/12/31" id="inEnd">
                      <div class="filebox pull-left">
                        <label for="file">파일 업로드</label>
                        <input type="file" name="file" id="file">
                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
                      <button type="button" class="btn btn-default" id="movieInsertBtn">추가</button>
                    </div>
                  </div>
                </div>
            </div>
        </div>
        

        
<div class="modal fade" id="movieDetail" role="dialog" style="text-align: center;">
    
  </div>
   
   

   
    </section>
    
    
    <script>
        $(document).ready(function(){
        	let movNo1;
        	$("#movieInsertBtn").click(function(){
        		var file = $("#file").val();
				file = file.slice(file.indexOf(".") + 1).toLowerCase();
				if(file != "jpg" && file != "png" && file != "bmp"){
					alert("이미지파일(jpg,png,bmp)만 등록가능");
					$("#file").val("");
					return false;
				}
				var formData = new FormData();
				var fileData = $("#file");
				
				formData.append("file",fileData[0].files[0]);
				var movName = $("#inName").val();
				var movContent = $("#inContent").val();
				var movStartDate = $("#inStart").val();
				var movEndDate = $("#inEnd").val();
				formData.append("movName", movName);
				formData.append("movContent", movContent);
				formData.append("movStartDate", movStartDate);
				formData.append("movEndDate", movEndDate);
				$.ajax({
					url:"movieInsert",
					type:"POST",
					data:formData,
					processData:false,
					contentType:false,
					success:function(result){
						alert("영화 추가 성공!");
						$("#movieInsert").hide();
					},
					error:function(result){
						alert("영화추가실패 ㅠ"+result);
					}
				
				})
				
        	});
        	
        	$(".container").on("click", "a", function(event){
        		var movNo = event.target.id;
        		$.getJSON(
        				"movieDetail/"+movNo,
        				function(data){
        					movNo1 = data.movNo;
        					var str = "";
        					str+="<div class='modal-dialog'>"
        				    str+="<div class='modal-content'>"
        				    str+="<div class='modal_header'>"
        				    str+="<button type='button' class='close' data-dismiss='modal'>&times;</button></div>"
        				    str+="<div class='modal_body'>"
        				    str+="<div class='modal_body_top'>"
        				    str+="<div class='modal_body_inner'>"
        				    str+="<img src='view?fileLoca="+data.movFileLoca+"&fileName="+data.movFileName+"' style='height: 300px;'></div>"
        				    str+="<div class='modal_body_inner2'>"
        				    str+="<div class='modal_body_title'>"
        				    str+="<h1><strong>"+data.movName+"</strong></h1>"
        				    str+="개봉날짜 : "+data.movStartDate+"<br>"
        				    str+="상영종료 : "+data.movEndDate+"</div>"
        				    str+="<hr>"
        				  	str+="<div class='modal_body_content'>"
        				  	str+="<h3>줄거리</h3>"
        				    str+=data.movContent+"<br>"
        				    str+="</div></div>"
        				    str+="<br>"
        				    str+="<div class='col-sm-4'></div>"
        				    str+="<div class='col-sm-2'>"
        				    str+="<button type='button' class='btn btn-primary btn-block' id='movdelete'>삭제</button>"
        				    str+="</div>"
        				    str+="</div><hr></div></div></div>"
        				    $("#movieDetail").html(str);
        					$("#movieDetail").modal("show");
        				}
        		)
        	})
        	
            $("#movieInsertForm").click(function(){
                $("#movieInsert").modal("show");
            });
            
            $("#movieDetail").on("click", "button", function(event){
            	if(event.target.id == "movdelete"){
            		$.ajax({
            			type:"delete",
            			url:"movieDelete",
            			data:JSON.stringify({"movNo" : movNo1}),
            			contentType: "application/json; charset=utf-8",
    	    			success:function(result){
    	    				alert("삭제성공");
    	    				$("#movieDetail").modal("hide");
    	    			},
    	    			error:function(status){
    	    				alert("삭제실패");
    	    			}
            		})
            	}
            });
           
        });
    </script>

	
</body>
</html>