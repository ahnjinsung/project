<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<footer>
        <div id="footer1" class="footer_theater">
           <div class="container">
                <div class="wrap">
                       <h4>영화관 찾기</h4>
                    <dl >
                        <dt id="footer_inner">서울</dt>
                        <dd><a href="#">강남</a></dd>
                        <dd><a href="#">강남대로</a></dd>
                        <dd><a href="#">강동</a></dd>
                        <dd><a href="#">동대문</a></dd>
                        <dd><a href="#">마곡</a></dd>
                        <dd><a href="#">목동</a></dd>
                        <dd><a href="#">상봉</a></dd>
                        <dd><a href="#">상암월드컵경기장</a></dd>
                        <dd><a href="#">성수</a></dd>
                        <dd><a href="#">센트럴</a></dd>
                        <dd><a href="#">송파파크하비오</a></dd>
                        <dd><a href="#">신촌</a></dd>
                        <dd><a href="#">화곡</a></dd>  
                    </dl>
                    <dl >
                        <dt id="footer_inner">경기</dt>
                        <dd ><a href="#">고양스타필드</a></dd>
                        <dd><a href="#">김포한강신도시</a></dd>
                        <dd><a href="#">남양주</a></dd>
                        <dd><a href="#">동탄</a></dd>
                        <dd><a href="#">미사강변</a></dd>
                        <dd><a href="#">백석</a></dd>
                        <dd><a href="#">별내</a></dd>
                        <dd><a href="#">부천스타필드시티</a></dd>
                        <dd><a href="#">분당</a></dd>   
                        <dd><a href="#">수원</a></dd>   
                        <dd><a href="#">시흥</a></dd>   
                        <dd><a href="#">용인테크노밸리</a></dd>   
                        <dd><a href="#">의정부</a></dd>   
                        <dd><a href="#">일산</a></dd>   
                        <dd><a href="#">파주</a></dd>   
                        <dd><a href="#">평택</a></dd>   
                        <dd><a href="#">하남스타필드</a></dd>   
                    </dl>
                    <dl id="footer_inner">
                        <dt>대전|세종|충청</dt>
                        <dd><a href="#">공주</a></dd>
                        <dd><a href="#">대전</a></dd>
                        <dd><a href="#">대전중앙로</a></dd>
                        <dd><a href="#">세종</a></dd>
                        <dd><a href="#">오창</a></dd>
                        <dd><a href="#">제천</a></dd>
                        <dd><a href="#">진천</a></dd>
                        <dd><a href="#">천안</a></dd>
                        <dd><a href="#">청주충북대</a></dd> 
                        <dd><a href="#">충주</a></dd> 
                        <dd><a href="#">홍성내포</a></dd> 
                    </dl>
                    <dl id="footer_inner">
                        <dt>부산/경상</dt>
                        <dd><a href="#">거창</a></dd>
                        <dd><a href="#">경북도청</a></dd>
                        <dd><a href="#">경산하양</a></dd>
                        <dd><a href="#">경주</a></dd>
                        <dd><a href="#">구미강동</a></dd>
                        <dd><a href="#">김천</a></dd>
                        <dd><a href="#">대구</a></dd>
                        <dd><a href="#">대구신세계</a></dd>
                        <dd><a href="#">대구이시아</a></dd> 
                        <dd><a href="#">덕천</a></dd> 
                        <dd><a href="#">마산</a></dd> 
                        <dd><a href="#">문경</a></dd> 
                        <dd><a href="#">삼천포</a></dd> 
                        <dd><a href="#">울산</a></dd> 
                        <dd><a href="#">창원</a></dd> 
                    </dl> 
                    <dl id="footer_inner">
                        <dt>광주/전라</dt>
                        <dd><a href="#">광주상무</a></dd>
                        <dd><a href="#">광주하남</a></dd>
                        <dd><a href="#">남원</a></dd>
                        <dd><a href="#">목포</a></dd>
                        <dd><a href="#">순천</a></dd>
                        <dd><a href="#">여수</a></dd>
                        <dd><a href="#">전주</a></dd> 
                    </dl>
                    <dl>
                        <dt id="footer_inner">강원</dt>
                        <dd><a href="#">남춘천</a></dd>
                        <dd><a href="#">속초</a></dd>
                        <dd><a href="#">원주</a></dd>
                        <dd><a href="#">원주센트럴</a></dd>
                    </dl>
                    
                </div>
            </div>
        </div>
       
        <div class="container" id="footer2">
            <div class="row">
                <div class="col-sm-12 col-md-7">
                    <div class="copyright">
                        <img src="${pageContext.request.contextPath }/resources/img/logo2.png" width="150"><br>
                        KGMOVIE | 대표이사:이승수<br>
                        서울시 송파구 송파대로 570<br>
                        사업자 등록번호 : 120-88-00767<br>
                        통신판매업신고 : 2017-서울송파-0680<br>    
                    </div>
               </div>
               <!--text-right는 부트스트랩에 미리정의되어 있는 클래스로 글자 오른쪽 정렬-->
               <div class="col-sm-12 col-md-5 text-right">
                   <ul class="footer-menu">
                   	   <li><a href="#" id="AdminLoginGo">Admin</a></li>
                       <li><a href="#">고객센터</a></li>
                       <li><a href="#">이용약관</a></li>
                       <li><a href="#">개인정보취급</a></li>
                   </ul>
               </div>
            </div>
        </div>
        <script>
        $("#AdminLoginGo").click(function(){
        	window.open("${pageContext.request.contextPath }/admin/adminLoginPage", "관리자페이지", "width=1000, height=700, left=400"
        			+"toolbar=no, menubar=no, scrollbars=no" );
        });
        </script>
    </footer>
</body>
</html>