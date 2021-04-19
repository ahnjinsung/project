<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
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
  
   
   <section style="margin-top: 0px">
       <div class="userform">
           <div class="container toggle">
             <div class="userPage btn-group btn-group-lg" role="group" aria-label="">
                 <a href="#menu1" data-toggle="tab" id="userPage"><button class="btn btn-default"><span class="glyphicon glyphicon-cog"></span><span><br>내정보수정</span></button></a>
                 <a href="#menu2" data-toggle="tab" id="userHelp"><button class="btn btn-default" ><span class="glyphicon glyphicon-user"></span><br><span>문의내역</span></button></a>
                 <a href="#menu3" data-toggle="tab" id="userMoivePre"><button class="btn btn-default"><span class="glyphicon glyphicon-film"></span><br><span>예매내역</span></button></a>
             </div>
             <div class="tab-content">
                 <div id="menu1" class="tab-pane fade">
                  <br>
                   <h2>개인정보 수정란<span class="glyphicon glyphicon-cog"></span></h2>
                    <br>
                      
                           <table class="table">
                                <thead>
                                    <tr>
                                        <th>기본정보</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                       <td class="col-sm-2" bgcolor="#eae9e9">아이디</td>

                                       <td class="col-sm-8"><input type="text" readonly value="${movieUserVO.userId }" id="userId">
                                       </td>
                                  </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">이름</td>
                                        <td class=""><input type="text" readonly value="${movieUserVO.userName }" id="userName"></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">생년월일</td>
                                        <td class="">
                                        	<input type="text" size="3" value="${movieUserVO.userBirYear }" id="userBirYear">년
                                        	<input type="text" size="1" value="${movieUserVO.userBirMon }" id="userBirMon">월
                                        	<input type="text" size="1" value="${movieUserVO.userBirDay }" id="userBirDay">일
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">휴대폰</td>
                                        <td class="">
	                                        <input type="text" size="2" placeholder="010" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${movieUserVO.userPhone1 }" id="userPhone1">-
	                                        <input type="text" size="2" placeholder="0000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${movieUserVO.userPhone2 }" id="userPhone2">-
	                                        <input type="text" size="2" placeholder="0000" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');" value="${movieUserVO.userPhone3 }" id="userPhone3">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">이메일</td>
                                        <td><input type="text" placeholder="admin@naver.com" value="${movieUserVO.userEmail }" id="userEmail"></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">주소</td>
                                        <td><input type="text" readonly size="7" value="${movieUserVO.addrZipNum }" id="addrZipNum">
                                        <button class="btn btn-default" id="addBtn">주소찾기</button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">전체주소</td>
                                        <td><input type="text" class="col-sm-5" value="${movieUserVO.addrBasic }" id="addrBasic"></td>
                                    </tr>
                                    <tr>
                                        <td class="col-sm-2" bgcolor="#eae9e9">상세주소</td>
                                        <td><input type="text" class="col-sm-5" value="${movieUserVO.addrDetail }" id="addrDetail"></td>
                                    </tr>
                                </tbody>

                           </table>
                           <div class="userjoin">
                           		<button type="button" class="btn btn-default" id="updateBtn">수정</button>
                           </div>
                   </div>
                   <div id="menu2" class="tab-pane fade">
                     <br>
                      <h2>문의내역<span class="glyphicon glyphicon-user"></span></h2><br>
                      <small><span class="glyphicon glyphicon-chevron-right"></span>
                         고객센터에서 남겨주신 문의내역을 모두 확인하실 수 있습니다.<br>
                          <span class="glyphicon glyphicon-chevron-right"></span>
                          문의하시기 전 FAQ를 확인하시면 궁금증을 더욱 빠르게 해결하실 수 있습니다.</small>
                          <br><br>
                       <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="4">나의 문의 내역</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                       <th class="col-sm-2">NO</th>
                                       <th class="col-sm-4">제목</th>
                                       <th class="col-sm-2">답변상태</th>
                                       <th class="col-sm-2">등록일</th>
                                  </tr>
                      <c:forEach var="helpVO" items="${helpVO}">            
                                  <tr>
                                      <td>${helpVO.uhNo}</td>
                                      <td><a href="../userHelp/userHelpDetail?uhNo=${helpVO.uhNo }">${helpVO.uhTitle }</a></td>
                                      <td>${helpVO.uhCheck }</td>
                                      <td>${helpVO.uhDate}</td>
                                  </tr>
                      </c:forEach>
                                </tbody>
                           </table>
                   </div>
                   <div id="menu3" class="tab-pane fade">
                       <br>
                      <h2>예매내역<span class="glyphicon glyphicon-film"></span></h2><br>
                      <small><span class="glyphicon glyphicon-chevron-right"></span>
                         예매하신 영화 내역과 취소 내역을 확인할 수 있습니다.</small><br>
                          <br><br>
                       <table class="table">
                                <thead>
                                    <tr>
                                        <th colspan="8">나의 문의 내역</th>
                                    </tr>
                                </thead>
                                <tbody>
                                   <tr>
                                       <th class="col-sm-1">예매번호</th>
                                       <th class="col-sm-2">영화명</th>
                                       <th class="col-sm-2">상영장소</th>
                                       <th class="col-sm-2">상영시간</th>
                                       <th class="col-sm-1">상영일</th>
                                       <th class="col-sm-2">좌석</th>
                                       <th class="col-sm-1">인원</th>
                                       <th class="col-sm-1">예매취소</th>
                                  </tr>
                         <c:forEach var="preVO" items="${preVO}"> 
                                  <tr>
                                      <td>${preVO.rsvNo }</td>
                                      <td>${preVO.movName }</td>
                                      <td>${preVO.mrPlace }</td>
                                      <td>${preVO.mrTime }</td>
                                      <td>${preVO.mrDate }</td>
                                      <td>${preVO.mrSit }</td>
                                      <td>${preVO.mrPeo }</td>
                                      <td><button class="glyphicon glyphicon-remove" onclick="location.href='../movie/moviePreDelete?rsvNo=${preVO.rsvNo}'"></button></td>
                                  </tr>
                         </c:forEach> 
                                </tbody>
                           </table>
                      
                   </div>
               </div>
           </div>
      </div>
   </section>
   
   <%@ include file="../include/footer.jsp" %>
   
   <script>
   		 $(document).ready(function(){
   			 var att = '${att}';
   			
   			if(att == 'userHelp'){
   				document.getElementById("userHelp").click();
   				return false;
   			}else if(att == 'userPage'){
   				document.getElementById("userPage").click();
   				return false;
   			}else if(att == 'userPre'){
   				document.getElementById("userMoivePre").click();
   				return false;
   			}else{
   				 alert(att);
   				 return false;
   			}
   		})
   		$("#updateBtn").click(function(){
   			var userId = $("#userId").val();
   			var userName = $("#userName").val();
			var userBirYear = $("#userBirYear").val();
			var userBirMon = $("#userBirMon").val();
			var userBirDay = $("#userBirDay").val();
			var userPhone1 = $("#userPhone1").val();
			var userPhone2 = $("#userPhone2").val();
			var userPhone3 = $("#userPhone3").val();
			var userEmail = $("#userEmail").val();
			var addrZipNum = $("#addrZipNum").val();
			var addrBasic = $("#addrBasic").val();
			var addrDetail = $("#addrDetail").val();
			
			if(userBirYear==''||userBirMon==''||userBirDay==''){
				alert("생년월일을 입력하세요");
				return false;
			}else if(userEmail==''){
				alert("이메일을 입력하세요");
				return false;
			}else if(userPhone1==''||userPhone2==''||userPhone3==''){
				alert("휴대폰번호를 입력하세요");
				return false;
			}else if(addrZipNum==''||addrBasic==''||addrDetail==''){
				alert("주소를 입력하세요");
				return false;
			}
			
			var jsonData={'userId':userId,
						'userName':userName,
						'userBirYear':userBirYear, 
						'userBirMon':userBirMon, 
						'userBirDay':userBirDay,
						'userPhone1':userPhone1, 
						'userPhone2':userPhone2, 
						'userPhone3':userPhone3, 
						'userEmail':userEmail, 
						'addrZipNum':addrZipNum, 
						'addrBasic':addrBasic, 
						'addrDetail':addrDetail}
			
			$.ajax({
				type:"PUT",
				url:"userUpdate",
				data:JSON.stringify(jsonData),
				contentType:"application/json; charset=utf-8",
				success:function(result){
					if(result == 1){
						alert("정보가 수정되었습니다");
					}else{
						alert("정보수정에 실패했습니다");
					}
				},
				error:function(status){
					alert("다시 시도해 주세요"+status);
				}
									
			})
   		})
   		
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