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
        
        .form-control{
            width: 30%;
            float: left;
        }
    
    </style>
    
    
</head>
<body>

   	<%@ include file="../include/header.jsp" %>
           
  
   
   <section style="margin-top: 0px">
       <div class="userform">
           <div class="container">
              <br>
               <h2>가입정보입력<span class="glyphicon glyphicon-pencil"></span></h2>
                <br>
               <div>
                  
                  <form action="joinForm" method="post" id="regForm">
	                  	<table class="table">
	                        <thead>
	                            <tr>
	                                <th>기본정보</th>
	                                <th></th>
	                            </tr>
	                        </thead>
	                        <tbody>
	                           <tr>
	                               <td class="col-sm-2">아이디</td>
	                               <td class="col-sm-8">
		                               <input type="text" id="userId" name="userId">
		                               <button type="button" class="joinBtn btn btn-success glyphicon glyphicon-ok" id="idConfirmBtn">중복확인</button>
	                               		<span id="msgId">영문이나 숫자 혹은 그조합4~10자리</span>
	                               </td>
	                               
	                          </tr>
	                            <tr>
	                                <td class="col-sm-2">비밀번호</td>
	                                <td class=""><input type="password" id="userPw" name="userPw"> 
	                                <span id="msgPw">영문, 숫자, 특수문자 중 2가지 이상 조합 12자리 이상</span></td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">비밀번호 확인</td>
	                                <td class=""><input type="password" id="pwConfirm" name="pwConfirm">
	                                <span id="msgPwc"></span></td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">이름</td>
	                                <td class=""><input type="text" id="userName" name="userName"></td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2" >생년월일</td>
	                                <td class="">
		                                <input type="text" size="3" placeholder="2019" 
		                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userBirYear" name="userBirYear">년
		                                <input type="text" size="1" placeholder="12" 
		                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userBirMon" name="userBirMon">월
		                                <input type="text" size="1" placeholder="16" 
	                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userBirDay" name="userBirDay">일
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">휴대폰</td>
	                                <td class="">
		                                <input type="text" size="2" placeholder="010" 
		                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userPhone1" name="userPhone1">-
		                                <input type="text" size="2" placeholder="0000" 
		                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userPhone2" name="userPhone2">-
		                                <input type="text" size="2" placeholder="0000" 
		                                onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" id="userPhone3" name="userPhone3">
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">이메일</td>
	                                <td><input type="text" placeholder="admin@naver.com" id="userEmail" name="userEmail">
	                                <span id="msgEmail"></span></td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">주소</td>
	                                <td><input type="text" readonly size="7" id="addrZipNum" name="addrZipNum">
	                                <button type="button" class="addBtn btn btn-default" id="addBtn">주소찾기</button>
	                                </td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">전체주소</td>
	                                <td><input type="text" class="col-sm-5" id="addrBasic" name="addrBasic"></td>
	                            </tr>
	                            <tr>
	                                <td class="col-sm-2">상세주소</td>
	                                <td><input type="text" class="col-sm-5" id="addrDetail" name="addrDetail"></td>
	                            </tr>
	                        </tbody>
	                   </table>
	                   <div class="userjoin">
		                   <button class="btn btn-default" id="joinBtn">가입</button>
		                   <button class="btn btn-default">취소</button>
	                   </div>
                  </form>
                   
                   
               </div>
           </div>
      </div>
   </section>
   
   
   <%@ include file="../include/footer.jsp" %>
   
   
   <script>
   
	   var id = document.getElementById("userId");
	   id.onkeyup = function() {
		   
	       var regex = /^[A-Za-z0-9+]{4,10}$/; 
	       if(regex.test(document.getElementById("userId").value )) {
	    	   $("#msgId").html("아이디중복체크는 필수 입니다");
	
	       } else {
	    	   $("#msgId").html("영문이나 숫자 혹은 그조합4~10자리");
	       }
	   }
   
	   $("#idConfirmBtn").click(function(){
			if($("#userId").val() == ''){
				alert("아이디 규칙을 확인하세요");
				$("#idConfirmBtn").css("background-color", "#263238");
				return false;
			}
			
			var userId = $("#userId").val();
			$.ajax({
				type:"POST",
				url: "idConfirm",
				data:JSON.stringify({"userId":userId}),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					if(result==0){
						alert("사용가능한 아이디입니다");
						$("#userId").attr("readonly","readonly");
						$("#msgId").html("사용가능한 아이디입니다.");
						$("#idConfirmBtn").css("background-color", "#449d44");
						$("#idConfirmBtn").css("border-color", "#4cae4c");
					}else{
						alert("중복된 아이디입니다");
						$("#idConfirmBtn").css("background-color", "#263238");
						$("#userId").focus();
					}
				},
				error:function(){
					alert("중복확인에러");	
				}
				
			})			
		})
		
		var pw = document.getElementById("userPw");
	   	pw.onkeyup = function() {
		   
	       var regex = /^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}+]{4,12}$/; 
	       var regex2 = /[~!@#$%^&*()_+|<>?:{}]/;
	       
	       var result = document.getElementById("userPw").value;
	       if( regex.test( result )  ) {
	    	  
	    	   if( !(regex2.test(result)) ){
	    		   $("#msgPw").html("특수문자를 입력하세요");
	    	   }else{
		    	   $("#msgPw").html("사용가능합니다");
	    	   }
	    	   
	       }else{
	    	   $("#msgPw").html("비밀번호는 4~12자리로 입력해주세요");
	       }
	       
	   }
		
		var pwConfirm = document.getElementById("pwConfirm");
		pwConfirm.onkeyup = function(){
			if($("#userPw").val()!=$("#pwConfirm").val()){
				$("#msgPwc").css("border-Color", "red");
				$("#msgPwc").html("비밀번호가 틀렸습니다");
			}else if($("#userPw").val()==$("#pwConfirm").val()){
				$("#msgPwc").html("비밀번호가 일치합니다");
				$("#msgPwc").css("borderColor", "green");
			}else{
				$("#msgPwc").html("");
			}
	   	}
		
		
		var email = document.getElementById("userEmail");
		
		email.onkeyup = function(){
			
			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		
			if( regex.test( document.getElementById("userEmail").value ) ) {
				$("#msgEmail").html("");
			}else{
				$("#msgEmail").html("올바른 이메일 주소를 입력하세요");
			}
		}


   
	   	var joinBtn = document.getElementById("joinBtn");
	   	
	   	joinBtn.onclick = function(){
		   		var regexPw1 = /^[A-Za-z0-9~!@#$%^&*()_+|<>?:{}+]{4,12}$/; 
			    var regexPw2 = /[~!@#$%^&*()_+|<>?:{}]/;
			    var regexEmail=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
			    
			   	if($("#userId").val()==''||$("#userId").attr("readonly")!='readonly'){
			   		alert("아이디 중복체크를 확인하세요");
			   		return false;
			   	}else if($("#userPw").val()==''){
			   		alert("비밀번호를 확인하세요.");
			   		$("#userPw").focus();
			   		return false;
			   	}else if( !(regexPw1.test($("#userPw").val())) || !(regexPw2.test($("#userPw").val())) ){
			   		alert("비밀번호 형식을 확인하세요.");
			   		$("#userPw").focus();
			   		return false;
			   	}else if($("#pwConfirm").val()=='' || $("#userPw").val()!=$("#pwConfirm").val()){
			   		alert("비밀번호확인란을 확인하세요");
			   		$("#pwConfirm").focus();
			   		return false;
			   	}else if($("#userBirYear").val() == ''){
			   		alert("생년월일을 입력하세요");
			   		$("#userBirYear").focus();
			   		return false;
			   	}else if($("#userBirMon").val() == ''){
			   		alert("생년월일을 입력하세요");
			   		$("#userBirMon").focus();
			   		return false;
			   	}else if($("#userBirDay").val() == ''){
			   		alert("생년월일을 입력하세요");
			   		$("#userBirDay").focus();
			   		return false;
			   	}else if($("#userName").val() == ''){
			   		alert("이름을 입력하세요");
			   		$("#userName").focus();
			   		return false;
			   	}else if($("#userPhone1").val()==''){
			   		alert("번호를 입력하세요");
			   		$("#userPhone1").focus();
			   		return false;
			   	}else if($("#userPhone2").val()==''){
			   		alert("번호를 입력하세요");
			   		$("#userPhone2").focus();
			   		return false;
			   	}else if($("#userPhone3").val()==''){
			   		alert("번호를 입력하세요");
			   		$("#userPhone3").focus();
			   		return false;
			   	}else if($("#userEmail").val()==''){
			   		alert("이메일을 입력하세요");
			   		$("#userEmail").focus();
			   		return false;
			   	}else if( !(regexEmail.test($("#userEmail").val())) ){
			   		alert("이메일 형식을 확인하세요");
			   		$("#userEmail").focus();
			   		return false;
			   	}else if($("#addrBasic").val()==''||$("#addrZipNum").val()==''||$("#addrDetail").val()==''){
			   		alert("주소를 입력하세요");
			   		$("#addrBasic").focus();
			   		return false;
			   	}else if(confirm("가입하시겠습니까?")){
			   		document.getElementById("regForm").submit();
			   	}
			}
		
	   	//주소
        var addBtn = document.getElementById("addBtn");
        addBtn.onclick = goPopup;
        function goPopup(){
        	var pop = window.open("${pageContext.request.contextPath}/resources/popup/jusoPopup.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes");         	
        }

        function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn,detBdNmList,bdNm,bdKdcd,siNm,sggNm,emdNm,liNm,rn,udrtYn,buldMnnm,buldSlno,mtYn,lnbrMnnm,lnbrSlno,emdNo){
        		document.getElementById("addrBasic").value = roadAddrPart1;
        		document.getElementById("addrDetail").value = addrDetail + roadAddrPart2;
        		document.getElementById("addrZipNum").value = zipNo;
        }	
   
   
   </script>
   
</body>
</html>