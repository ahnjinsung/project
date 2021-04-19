<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>부트스트랩 101 템플릿</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>        <!--달력땜에필요한거 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/moment.min.js"></script>    <!--달력땜에필요한거 -->
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.18.0/locale/ko.js"></script>        <!--달력땜에필요한거 -->
  	<link href="${pageContext.request.contextPath }/resources/css/bootstrap.css" rel="stylesheet">
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap.js"></script>
    <script src="${pageContext.request.contextPath }/resources/js/bootstrap-datetimepicker.js"></script><!--달력땜에필요한거 -->
    <!--개인 디자인(가장 아래쪽에 링크)-->
    <link href="${pageContext.request.contextPath }/resources/css/style.css" rel="stylesheet">
    
    <style type="text/css">
        .alert{
            border: 2px solid #e8e8e8;
        }
        .container{
            text-align: center;
        }
        
    </style>
</head>    
<body>
   
   <%@ include file="../include/header.jsp" %>
   <section>
      <br><br>
       <div class="container">
       	<input type="hidden" value="${vo.movEndDate }" id="movEndDate">
          <div class="location">
            <!--맨위에 뜨는 자기위치랄까? 버튼으로준거 의아하겠지만 난버튼성애자라 버튼주고 디세이블줌 그리고 다음/이전 할때마다 색상바뀌게한거임-->
             <button class="black btn btn-secondary" disabled style="background-color: black; color: aliceblue;" id="pre1">극장</button>
             <button class="white btn btn-secondary" disabled style="background-color: gainsboro; color: black;" id="pre2">날짜</button>
             <button class="white btn btn-secondary" disabled style="background-color: gainsboro; color: black;" id="pre3">시간</button>
             <button class="white btn btn-secondary" disabled style="background-color: gainsboro; color: black;" id="pre4">좌석</button>
             <button class="white btn btn-secondary" disabled style="background-color: gainsboro; color: black;" id="pre5">결과</button>
          </div>
          <br>
          <div id="movieOpen"><!-- 이건 극장선택할때나오는 div-->
              <h2>극장 선택</h2>
               <div class="movie_select">
                <select class="form-control" style="width:80px;height:50px;" id="maker_check">
                  <option>강남</option>
                  <option>종로</option>
                  <option>노원</option>
                  <option>홍대</option>
                  <option>북한</option>
                </select>
              </div>
              <div>
                  <img src="${pageContext.request.contextPath }/resources/img/seoul.png">
              </div>
              <div class="maker_gang">
                  <img src="${pageContext.request.contextPath }/resources/img/marker.png">
              </div>
              <div class="maker_zong">
                  <img src="${pageContext.request.contextPath }/resources/img/marker.png">
              </div>
              <div class="maker_no">
                  <img src="${pageContext.request.contextPath }/resources/img/marker.png">
              </div>
              <div class="maker_hong">
                  <img src="${pageContext.request.contextPath }/resources/img/marker.png">
              </div>
              <div class="maker_book">
                  <img src="${pageContext.request.contextPath }/resources/img/marker.png">
              </div>
              <div class="maker_gang_active" id="maker_gang_active">
                  <img src="${pageContext.request.contextPath }/resources/img/marker_active.png">
              </div>
              <div class="maker_zong_active" style="display: none;" id="maker_zong_active">
                  <img src="${pageContext.request.contextPath }/resources/img/marker_active.png">
              </div>
              <div class="maker_no_active" style="display: none;" id="maker_no_active">
                  <img src="${pageContext.request.contextPath }/resources/img/marker_active.png">
              </div>
              <div class="maker_hong_active" style="display: none;" id="maker_hong_active">
                  <img src="${pageContext.request.contextPath }/resources/img/marker_active.png">
              </div>
              <div class="maker_book_active" style="display: none;" id="maker_book_active">
                  <img src="${pageContext.request.contextPath }/resources/img/marker_active.png">
              </div>
          </div>
          <div id="dateOpen" style="display: none;"> <!-- 이건 날짜선택할때나오는 div-->
                       <h2>날짜 선택</h2>            <!--그리고 날짜선택하는 div이긴한데 좀중요한게 js안에 datepicker이런거 추가해야됨-->
                        <div class="form-group1"><!--그리고 jquery 3.4.1?인가그거빼야됨 그게있으면 아예안나옴 ;;그거땜에 고생 죠나했음;-->
                            <div class="">
                               <div class=''>
                                    <div class="form-group">
                                        <div class='input-group date dateTimePicker' id="datepicker1">
                                            <input type='text' class="form-control" name="openDate" required="required" id="movieDate"/>
                                            <span class="input-group-addon">
                                                <span class="glyphicon glyphicon-calendar">
                                                </span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
          </div>
          <div id="timeOpen" style="display: none;">    <!--이건 시간선택할때 나오는 div-->
             <h2>시간 선택</h2>
              <div class="btn-group-vertical" role="group" id="time">
                  <button class="btn btn-default dropdown-toggle" id="12시30분" >12시 30분</button>
                  <button class="btn btn-default dropdown-toggle" id="2시25분">2시 25분</button>
                  <button class="btn btn-default dropdown-toggle" id="4시50분">4시 50분</button>
                  <button class="btn btn-default dropdown-toggle" id="6시0분">6시 0분</button>
                  
              </div>
              <br><br><br>
          </div>
          <div id="sitOpen" style="display: none;">    <!--이건 자리선택할때 나오는 div-->
             <h2>자리선택</h2>
             <div id="sitCheck">
             </div>
             <div style="position: absolute; right: 80%; top:25%">
                 <div style="width: 75%; float: left">
                    인원
                 </div>
                 <div style="width: 80%; float: left" class="form-control">
                     <select id="sitNumber" style="width: 100%">
                         <option>1</option>
                         <option>2</option>
                         <option>3</option>
                         <option>4</option>
                     </select>
                 </div>
              </div>
             <div><button class="btn btn-default" style="width: 70%" disabled>SCREEN</button></div>
             <br>
             
          </div>
          <div id="resultOpen" style="display: none;">    <!--이건 결과를나타내줄때 나오는 div-->
              <div><h2>고객님의 예약정보</h2></div>
              <br>
              <form action="moviePreInsert" method="post" id="moviePreInsert">
              <div class="container">
                 <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert" >
                      <strong>영화이름 </strong> - <span id="resMovieName">${vo.movName}</span>
                  </div>
                  <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert" >
                      <strong>극장</strong> - <span id="resMovie" >강남</span>
                  </div>
                  <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert">
                      <strong>날짜</strong> - <span id="resDate">2019-12-18</span>
                  </div>
                  <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert">
                      <strong>시간</strong> - <span id="resTime"></span>
                  </div>
                  <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert">
                      <strong>좌석</strong> - <span id="resSit"></span>
                  </div>
                  <div class="alert alert-dismissible" style="background-color: #ebedef" role="alert">
                      <strong>인원</strong> - <span id="resPeo">1</span>명
                  </div>
              </div>
              <input type="hidden" id="movName" value="${vo.movName}" name="movName"> 
              <input type="hidden" id="mrPlace" value="강남" name="mrPlace">
              <input type="hidden" id="mrDate" name="mrDate">
              <input type="hidden" id="mrTime" name="mrTime">
              <input type="hidden" id="mrSit" name="mrSit">
              <input type="hidden" id="mrPeo" value="1" name="mrPeo">
              </form>
              
          </div>
          <div>
              <button class="btn btn-secondary" id="back" >이전</button>
              <button class="btn btn-secondary" id="next">다음</button>
          </div>
       </div>
       <br><br>
   </section>
   <script>
        $(document).ready(function() {// 시작시 한번 실행해주는거라고생각하면됨
        	
            let count = 0;
            let sit = 1;                                //이부분부터 설명하자면 인원수 기본값 1을준거
            $('#sitNumber').change(function() {         //이function은 인원수를 셀렉트할때 실행되는것
                sit = $('#sitNumber option:selected').val();
                $("#resPeo").html(sit);
                $("#mrPeo").val(sit);
                for(var j=65; j<68; j++){           //자이부분을왜하냐 기본적으로 인원수를 정하면 좌석골랏던거초기화할려고
                     for(var i=1; i<9; i++){
                         $("#"+String.fromCharCode(j)+"-"+i+"").attr("class", "btn btn-default");
                     }
                }
            })
            
            $("#time > button").click(function(){           //이펑션은 그냥 시간쪽에서 버튼눌렀을때 값을 결과창에서 값입힐려고 ㅇㅇ
                $("#resTime").html(event.target.id);
                $("#mrTime").val(event.target.id);
            })
            
            $("#sitCheck").on("click","button",function(event){     //이부분 개중요하지..ㄹㅇ별5개 개중요 
            	count = 0;                      //일단 카운트 변수는 내가 좌석클릭을했을때 그카운팅을세려고만든거임
                var str = "";                   //str은 어느좌석에 앉았는지 그걸저장하는 str값 2명이면 2명의자리값
                for(var j=65; j<68; j++){   //이포문은 어떤좌석에앉았는지 포문으로 확인하는거고
                    for(var i=1; i<9; i++){
                        if($("#"+String.fromCharCode(j)+"-"+i+"").attr("class") == "btn btn-default on"){
                            count += 1;
                        }
                    }
                }
                if(count < sit){                //자 그다음에 아까전에 좌석이 내가선택한 인원수라고했지
                    count = 0;
                    $(this).toggleClass("on");  //그리고 카운트가 내가좌석누른게 되는거고
                    for(var j=65; j<68; j++){   //그래서 저런등호가 나오는거고
                        for(var i=1; i<9; i++){ //여기서또포문을 돌려야된다 왜냐면
                            if($("#"+String.fromCharCode(j)+"-"+i+"").attr("class") == "btn btn-default on"){
                                count += 1;
                                str += (","+String.fromCharCode(j)+"-"+i);
                            }
                        }
                    }
                    str = str.replace(",","");
                    $("#resSit").html(str);     //이부분이 나중에결과창에 좌석표시를해줄 span임 그래서 html로인해서 추가할려고
                    $("#mrSit").val(str);
                }else{
                    alert(sit+"명 인원초과");       //이건 카운트가더크면 좌석못앉게할려고
                }
            })
            
            //날짜선택하는거
            $('.dateTimePicker').datetimepicker({format:"YYYY-MM-DD",minDate : moment()});
            $('#datepicker1').datetimepicker({
                useCurrent: false 
            });
            
            $('#maker_check').change(function() {       //이건존나쉬움그냥 그 극장선택할때 즉 셀렉트에서 옵션값선택할때 실행되는함수임
                var state = $('#maker_check option:selected').val();
                if ( state == '강남' ) {
                    $("#resMovie").html("강남");
                    $("#mrPlace").val("강남");
                    $("#maker_gang_active").css("display", "");
                    $("#maker_zong_active").css("display", "none");
                    $("#maker_no_active").css("display", "none");
                    $("#maker_hong_active").css("display", "none");
                    $("#maker_book_active").css("display", "none");
                }else if(state == '종로'){
                    $("#resMovie").html("종로");
                    $("#mrPlace").val("종로");
                    $("#maker_gang_active").css("display", "none");
                    $("#maker_zong_active").css("display", "");
                    $("#maker_no_active").css("display", "none");
                    $("#maker_hong_active").css("display", "none");
                    $("#maker_book_active").css("display", "none");
                }else if(state == '노원'){
                    $("#resMovie").html("노원");
                    $("#mrPlace").val("노원");
                    $("#maker_gang_active").css("display", "none");
                    $("#maker_zong_active").css("display", "none");
                    $("#maker_no_active").css("display", "");
                    $("#maker_hong_active").css("display", "none");
                    $("#maker_book_active").css("display", "none");
                }else if(state == '홍대'){
                    $("#resMovie").html("홍대");
                    $("#mrPlace").val("홍대");
                    $("#maker_gang_active").css("display", "none");
                    $("#maker_zong_active").css("display", "none");
                    $("#maker_no_active").css("display", "none");
                    $("#maker_hong_active").css("display", "");
                    $("#maker_book_active").css("display", "none");
                }else if(state == '북한'){
                    $("#resMovie").html("북한");
                    $("#mrPlace").val("북한");
                    $("#maker_gang_active").css("display", "none");
                    $("#maker_zong_active").css("display", "none");
                    $("#maker_no_active").css("display", "none");
                    $("#maker_hong_active").css("display", "none");
                    $("#maker_book_active").css("display", "");
                }
            });

            $("#back").click(function(){        //이건 이전버튼눌렀을때나오는거
                if($("#pre1").attr("class") == "black btn btn-secondary"){      //이밑에 css등attr은 말그대로 뭐  div속성을바꿔
                  alert("이전으로가실수없습니다.");                            //줌으로써 보이게하고 안보이게하고 버튼색상바꿔주는거 등등ㅇㅇ
                }else if($("#pre2").attr("class") == "black btn btn-secondary"){
                    $("#movieOpen").css("display", "");
                    $("#dateOpen").css("display", "none");
                    $("#pre2").attr("class", "white btn btn-secondary");
                    $("#pre1").attr("class", "black btn btn-secondary");
                    $("#pre2").css("backgroundColor","gainsboro");
                   $("#pre2").css("color","black"); 
                   $("#pre1").css("backgroundColor","black");
                   $("#pre1").css("color","aliceblue");
                }else if($("#pre3").attr("class") == "black btn btn-secondary"){
                    $("#dateOpen").css("display", "");
                    $("#timeOpen").css("display", "none");
                    $("#pre3").attr("class", "white btn btn-secondary");
                    $("#pre2").attr("class", "black btn btn-secondary");
                    $("#pre3").css("backgroundColor","gainsboro");
                   $("#pre3").css("color","black"); 
                   $("#pre2").css("backgroundColor","black");
                   $("#pre2").css("color","aliceblue");
                }else if($("#pre4").attr("class") == "black btn btn-secondary"){
                    $("#timeOpen").css("display", "");
                    $("#sitOpen").css("display", "none");
                    $("#pre4").attr("class", "white btn btn-secondary");
                    $("#pre3").attr("class", "black btn btn-secondary");
                   $("#pre4").css("backgroundColor","gainsboro");
                   $("#pre4").css("color","black"); 
                   $("#pre3").css("backgroundColor","black");
                   $("#pre3").css("color","aliceblue");
                }else if($("#pre5").attr("class") == "black btn btn-secondary"){
                    $("#sitOpen").css("display", "");
                    $("#resultOpen").css("display", "none");
                    $("#pre5").attr("class", "white btn btn-secondary");
                    $("#pre4").attr("class", "black btn btn-secondary");
                   $("#pre5").css("backgroundColor","gainsboro");
                   $("#pre5").css("color","black"); 
                   $("#pre4").css("backgroundColor","black");
                   $("#pre4").css("color","aliceblue");
                   
                }
            })
            
            $("#next").click(function(){        //이건다음버튼눌렀을때
                $("#resDate").html($("#movieDate").val());
                $("#mrDate").val($("#movieDate").val());
                if($("#pre1").attr("class") == "black btn btn-secondary"){
                    $("#movieOpen").css("display", "none");
                    $("#dateOpen").css("display", "");
                    $("#pre1").attr("class", "white btn btn-secondary");
                    $("#pre2").attr("class", "black btn btn-secondary");
                   $("#pre1").css("backgroundColor","gainsboro");
                   $("#pre1").css("color","black"); 
                   $("#pre2").css("backgroundColor","black");
                   $("#pre2").css("color","aliceblue");
                }else if($("#pre2").attr("class") == "black btn btn-secondary"){	//날짜
                	var endDate = $("#movEndDate").val();
                	var checkdate = $("#movieDate").val();
                	var endDate = endDate.replace(/\//gi, "");
                	var checkdate = checkdate.replace(/-/gi, "");
                	var checkdate = checkdate.replace("20", "");
                	if(checkdate>endDate){
                		alert("영화종료일을 넘겼습니다.");
                		return false;
                	}else{
	                    $("#dateOpen").css("display", "none");
	                    $("#timeOpen").css("display", "");
	                    $("#pre2").attr("class", "white btn btn-secondary");
	                    $("#pre3").attr("class", "black btn btn-secondary");
	                   $("#pre2").css("backgroundColor","gainsboro");
	                   $("#pre2").css("color","black "); 
	                   $("#pre3").css("backgroundColor","black");
	                   $("#pre3").css("color","aliceblue");
                		return false;
                	}
                }else if($("#pre3").attr("class") == "black btn btn-secondary"){		//시간에서 다음누를때
                	console.log($("#movName").val());
                	console.log($("#mrTime").val());
                	console.log($("#mrDate").val());
                	console.log($("#mrPlace").val());
                	
                	$.getJSON(						//좌석 disable 표시할때 비동기처리
                		"movieSitList/"+$("#movName").val()+"/"+
                		$("#mrTime").val()+"/"+
                		$("#mrDate").val()+"/"+
                		$("#mrPlace").val(),
                		function(data){
                			var str = "";
                			str+="<div class=''>"
                            str+="<div id='sitBtn' style='float: center'>"
                            	for(var j=65; j<68; j++){
                            		for(var i=1; i<9; i++){
                            			let count = 0;
                            			for(var z=0; z<data.length; z++){
                            				if(data[z] == String.fromCharCode(j)+"-"+i){
                            					count = 1;
                            				}
                            			}
                            			if(count==1){
                            				str+="<button class='btn btn-default' disabled style='width: 50px; background-color: black;' id='"+String.fromCharCode(j)+"-"+i+"'>"+String.fromCharCode(j)+"-"+i+"</button>"
                            			}else{
                            				str+="<button class='btn btn-default' style='width: 50px;' id='"+String.fromCharCode(j)+"-"+i+"'>"+String.fromCharCode(j)+"-"+i+"</button>"
                            			}
                            			if(i==8){
                            				str+="<br>"
                            			}
                            			if(i==2 || i==6){
                            				str+="　　　"
                            			}
                            		}
                            	}
                            str+="</div></div>"
                           $("#sitCheck").html(str);
                		}

                	)
                    $("#timeOpen").css("display", "none");
                    $("#sitOpen").css("display", "");
                    $("#pre3").attr("class", "white btn btn-secondary");
                    $("#pre4").attr("class", "black btn btn-secondary");
                    $("#pre3").css("backgroundColor","gainsboro");
                   $("#pre3").css("color","black"); 
                   $("#pre4").css("backgroundColor","black");
                   $("#pre4").css("color","aliceblue");
                }else if( $("#pre4").attr("class") == "black btn btn-secondary" ){
                    $("#sitOpen").css("display", "none");
                    $("#resultOpen").css("display", "");
                    $("#pre4").attr("class", "white btn btn-secondary");
                    $("#pre5").attr("class", "black btn btn-secondary");
                   $("#pre4").css("backgroundColor","gainsboro");
                   $("#pre4").css("color","black"); 
                   $("#pre5").css("backgroundColor","black");
                   $("#pre5").css("color","aliceblue");
                }else if($("#pre5").attr("class") == "black btn btn-secondary"){
                    if($("#resTime").html() == ""){
                        alert("시간을 선택해주세요");
                        return false;
                    }else if($("#resSit").html() == ""){
                        alert("좌석을선택해주세요");
                        return false;
                    }else if($("#resPeo").html() == ""){
                        alert("인원을선택해주세요");
                        return false;
                    }else if(sit!=count){
                        alert("인원수맞지않음");
                        return false;
                    }
                    //이제예매들어가는곳
                    $("#moviePreInsert").submit();
                }
            })
        })
    </script>
   <%@ include file="../include/footer.jsp" %>
</body>
</html>