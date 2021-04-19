<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>

    <link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    <!--개인 디자인(가장 아래쪽에 링크)-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <style type="text/css"> 
    </style>
    
    
</head>
<body>
   
   <%@ include file="../include/header.jsp" %>
   
   
   
   <input type="hidden" id="msg" value="${msg }">
   <section style="margin-top: 0px">
       <div class="section_no2">
            <div class="toggle">
                <div class="tab-content">
                    <div class="tab-content">
<!-- ============================================== 윗줄 영화목록 ============================================== --> 
                        <div id="menu1" class="tab-pane fade in active">
                            <div class="container" id="movieListSelect">
                            <c:forEach var="vo" items="${vo}">
                                <div class="row">
                                    <div class="col-xs" >
                                        <div class="thumbnail">
                                            <img src="view?fileLoca=${vo.movFileLoca }&fileName=${vo.movFileName }">
                                            <div class="caption" id="movDetail">
                                                <h3>${vo.movName}</h3>
                                                <a id="${vo.movNo }" href="${vo.movNo }"class="btn btn-default btn-sm btn-block"
                                                >상세보기</a>
                                                <a id="moviePre" href="${vo.movNo }" class="btn btn-primary btn-block">예매하기</a>
                                            </div>
                                        </div>
                                    </div>
                                </div>  
							</c:forEach>
                            </div>                
                        </div>
<!-- ============================================== 아랫줄 영화목록 ============================================== --> 
                    
                </div>
          </div>
        </div>
    </div>
    
  <div class="modal fade" id="myModal" role="dialog">
  <input type="hidden" id="modalRepNo">
  
  </div>

  <div id="rep_update_form" class="modal fade" role="dialog">
          <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">댓글수정</h4>
              </div>
              
                <div class="modal-body">
                      <div class="input-group">
                        <span class="input-group-addon">수정할 내용</span>
                        <input id="repUpdateContent" type="text" class="form-control" name="repUpdateContent" placeholder="내용">
                      </div>
                     <br>
                </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal" id="rep_update_ok">수정</button>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
              </div>
            </div>
          </div>
        </div>
  
   </section>
   <script>
    $(document).ready(function(){
    	var userId = '${sessionScope.userId}';
    	var msg = $("#msg").val();		//예약이완료되거나 예약실패 알려줄려고쓰는거
    	if(msg!=""){
    		alert(msg);
    	}
    	let movNo1;										
    	let movNo;										
    	let movRepNo;
    	let reset = false;
	    $("#movieListSelect").on("click", "a", function(event){
	    	event.preventDefault();
	    	if(userId==""){
	    		alert("로그인을해주세요");
	    		return false;
	    	}
	    	if(event.target.id=='moviePre'){		//예약하기 누르면가는곳
	    		movNo = $(this).attr("href");
	    		location.href='moviePre?movNo='+movNo;
	    		return false;
	    	}else{
		    	movNo = event.target.id;
		    	reset = true;
		    	getList();
	    	}
	    	
	    })
	    
	    
	    function getList(reset){			//영화리스트 처음에 들어오는곳
	    	if(reset==true){
	    		reset = false;
	    	}
	    	$.getJSON(
		    		"movieDetail/"+movNo,
		    		function(data){
		    			movNo1 = data.movNo;
		    			var str = "";
		    			str+="<div class='modal-dialog modal-lg'>"
		    		    str+="<div class='modal-content'>"
		    		    str+="<div class='modal_header'>"
		    		    str+="<button type='button' class='close' data-dismiss='modal'>&times;</button>"
		    		    str+="</div>"
		    		    str+="<div class='modal_body'>"
		    		    str+="<div class='modal_body_top'>"
		    		    str+="<div class='modal_body_inner'>"
		    		    str+="<img src='view?fileLoca="+data.movFileLoca+"&fileName="+data.movFileName+"'>"
		    		    str+="</div>"
		    		    str+="<div class='modal_body_inner2'>"
		    		    str+="<div class='modal_body_title'>"
		    		    str+="<h1><strong>"+data.movName+"</strong></h1>"
		    		    str+="개봉날짜 : "+data.movStartDate+"<br>"
		    		    str+="상영종료 : "+data.movEndDate+"</div><hr>"
		    		    str+="<a type='button' class='btn btn-primary btn-block' href='"+data.movNo+"' id='req_insert''>예매하기</a>"
		    		    str+="<div class='modal_body_content'>"
		    		                       str+="<h3>줄거리</h3>"
		    		                       str+=" "+data.movContent+"<br></div></div> </div><hr></div>"
		    		    str+="<div class='modal_footer'>"
		    		    if(userId != ""){
		    		    str+="<div class='modal_footer_write'>"
		    		    str+="<h3>한줄평 ( "+data.movieRepList.length+" )</h3>"
		    		    str+="<div class='movie_rep_content form-group'>"
		    		    str+="<textarea class='form-control' rows='5' id='rep_comment'></textarea></div>"
		    		   	str+="<div class='movie_rep_content'>"
		    		    str+="<button class='btn movie_rep_button' id='movieRepInsert'>등록</button></div></div>"
		    		    }
		    		    str+="<hr>"
		    		    if(data.movieRepList[0].userId==null){
		    		    	
		    		    }else{
			    		    for(var i = 0; i<data.movieRepList.length; i++){
				    		    str+="<div>"
				    		   	str+="<div class='modal_reply_list'>"
				    		    str+="<div class='modal_reply_inner'>"
				    		    str+="<div class='modal_reply_id'><h3><strong>"+data.movieRepList[i].userId+"</strong></h3></div></div>"
				    		    str+="<div class='modal_reply_inner'>"
				    		   	str+="<div class='modal_reply_date'>"+data.movieRepList[i].movRepRegdate+"</div></div>"
				    		    str+="<div class='modal_reply_inner'>"
				    		    str+="<div class='modal_reply_del'>"
				    		    if(userId == data.movieRepList[i].userId){
				    		   	str+="<a href='"+data.movieRepList[i].movRepNo+"' type='button' class='btn btn-default glyphicon glyphicon-pencil' id='rep_update'>수정</a>"
				    		    str+="<a href='"+data.movieRepList[i].movRepNo+"' type='button' class='btn btn-default glyphicon glyphicon-remove' id='rep_delete'>삭제</a>"
				    		    }
				    		    str+="</div></div></div>" 
				    		    str+="<div>"
				    		    str+=data.movieRepList[i].movRepContent+"</div><hr></div>"
			    		    }
		    		    }
		    		    str+="</div></div></div>"
		    		    $("#myModal").html(str); 
		    			$("#myModal").modal("show");
		    		}
		    	)
	    }
	    
	    $("#myModal").on("click", "a", function(event){		//모달안에서 클릭잡는거
	    	event.preventDefault();
	    	if(event.target.id=='req_insert'){		//예약하는곳들어가는거
	    		location.href='moviePre?movNo='+movNo1;
	    		return false;
	    	}
	    	if(event.target.id=='rep_delete'){		//댓글삭제
	    		movRepNo = $(this).attr("href");
	    		$.ajax({
	    			type:"delete",
	    			url:"../movie/movieRepDelete",
	    			data:JSON.stringify({"movRepNo" : movRepNo, "movNo" : movNo1}),
	    			contentType: "application/json; charset=utf-8",
	    			success:function(result){
	    				alert("삭제성공");
	    				getList();
	    			},
	    			error:function(status){
	    				alert("삭제실패");
	    			}
	    		})
	    		return false;
	    	}else if(event.target.id=='rep_update'){	//댓글수정폼열기
	    		movRepNo = $(this).attr("href");
	    		$("#rep_update_form").modal("show");
	    	}
	    })
    	
	    $("#rep_update_ok").click(function(){ 		//댓글수정
	    	//movRepNo
	    	//movNo1
	    	//repUpdateContent
	    	var repUpdateContent = $("#repUpdateContent").val();
	    	$.ajax({
	    		type:"put",
	    		url:"../movie/movieRepUpdate",
	    		data:JSON.stringify({"movRepNo" : movRepNo, "movNo" : movNo1, "movRepContent" : repUpdateContent}),
	    		contentType: "application/json; charset=utf-8",
	    		success:function(result){
	    			if(result==1){
	    				alert("업데이트성공");
	    				$("#rep_update_form").modal("hide");
	    				getList();
	    			}else{
	    				alert("업데이트실패");
	    			}
	    		},
	    		error:function(status){
	    			alert("업데이트오류"+status);
	    		}
	    	})
	    	
	    })
    	
	    //movieRepInsert	댓글등록
	    $("#myModal").on("click", "button", function(event){
	    	
	    	
	    	if(event.target.id=='movieRepInsert'){
	    		var movRepContent = $("#rep_comment").val();
	    		if(movRepContent==''){
	    			alert("공백입니다");
	    			return false;
	    		}
	    		$.ajax({
	    			type:"POST",
	    			url:"../movie/movieRepInsert",
	    			data:JSON.stringify({"movNo" : movNo1, "movRepContent" : movRepContent, "userId" : userId}),
	    			contentType:"application/json; charset= utf-8",//전송할 타입
	    			success:function(result){
	    				$("#rep_comment").val("");
	    				alert("댓글등록성공");
	    				getList();
	    				
	    			},
	    			error:function(status){
	    				alert("후기등록실패");
	    			}
	    		})
	    	}
	    	
	    })
    })
    </script>
<!-- ============================================== SECTION끝 ============================================== -->
   <%@ include file="../include/footer.jsp" %>
   
    
</body>
</html>