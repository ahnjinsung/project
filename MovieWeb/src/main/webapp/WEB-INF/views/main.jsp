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
   
   <%@ include file="include/header.jsp" %>
   
   
   <section>
        <div class="container-fluid" id="section_no1">
            <div class="row">
                <!--부트스트랩 캐러셀 부분 적용-->
                <div id="myCarousel" class="carousel slide" data-ride="carousel">
                    <!--자동으로 넘어가게 되는 기능-->
                    <ol class="carousel-indicators">
                        <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                        <li data-target="#myCarousel" data-slide-to="1"></li>
                    </ol>

                    <!--화면에 보여질 이미지를 추가-->
                    <div class="carousel-inner">
                        <div class="item active">
                            <a href="##"><img src="${pageContext.request.contextPath }/resources/img/img1.jpg" alt="Los Angeles"></a>
                        </div>

                        <div class="item">
                            <a href="##"><img src="${pageContext.request.contextPath }/resources/img/img2.jpg" alt="Chicago"></a>
                        </div>
                    </div>
                    <!--좌우 위치 버튼 없애고 싶으면 지우면 됩니다-->
                    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                        <span class="glyphicon glyphicon-chevron-left"></span>
                        <span class="sr-only">Previous</span>
                    </a>
                    <a class="right carousel-control" href="#myCarousel" data-slide="next">
                        <span class="glyphicon glyphicon-chevron-right"></span>
                        <span class="sr-only">Next</span>
                    </a>
                </div>
            </div>
        </div>

   </section>
   <section style="margin-top: 0px">
       <div class="section_no2">
            <div class="toggle">
                <ul class="section2_toggleBox">                    
                        <li class="inner"><a data-toggle="tab" href="#menu1"><h4>인기작</h4></a></li>
                        <li class="inner"><a data-toggle="tab" href="#menu2"><h4>최신개봉작</h4></a></li>
                        <li class="inner"><a data-toggle="tab" href="#menu3"><h4>개봉예정작</h4></a></li>
                </ul>
                
                <!-- 인기,최신,개봉예정작 리스트 -->
                <div class="tab-content">
                   <!-- 인기작 시작지점 -->
                    <div id="menu1" class="tab-pane fade in active">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie1.jpg">
                                        <div class="caption">
                                            <h3>겨울왕국2</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>  

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie2.jpg">
                                        <div class="caption">
                                            <h3>쥬만지 : 넥스트레벨</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie3.jpg">
                                        <div class="caption">
                                            <h3>블랙머니</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie4.jpg">
                                        <div class="caption">
                                            <h3>82년생 김지영</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>                
                    </div>
                    <!-- 인기작 끝 -->
                    <!-- 최신개봉작 시작 -->
                    <div id="menu2" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie5.jpg">
                                        <div class="caption">
                                            <h3>영화로운 나날</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>  

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie6.jpg">
                                        <div class="caption">
                                            <h3>버즈 오브 프레이</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie7.jpg">
                                        <div class="caption">
                                            <h3>캣츠</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie8.jpg">
                                        <div class="caption">
                                            <h3>포드 V 페라리</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <!-- 최신개봉작 끝 -->
                    <!-- 개봉예정작 시작 -->
                    <div id="menu3" class="tab-pane fade">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie9.jpg">
                                        <div class="caption">
                                            <h3>해치지않아</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div>  

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie10.jpg">
                                        <div class="caption">
                                            <h3>닥터 두리틀</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs" >
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie3.jpg">
                                        <div class="caption">
                                            <h3>영화제목</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 

                            <div class="row">
                                <div class="col-xs">
                                    <div class="thumbnail">
                                        <img src="${pageContext.request.contextPath }/resources/img/movie11.jpg">
                                        <div class="caption">
                                            <h3>히트맨</h3>
                                            <a href="#" class="btn btn-default btn-sm btn-block" role="button"
                                            data-toggle="modal" data-target="#myModal">상세보기</a>
                                            <a href="movie/movieList" class="btn btn-primary btn-block" role="button">예매하기</a>
                                        </div>
                                    </div>
                                </div>
                            </div> 
                        </div>
                    </div>
                    <!-- 개봉예정작 끝 -->
                </div>
            </div>
      </div>
      
      
   </section>
   
   <%@ include file="include/footer.jsp" %>
   
    
</body>
</html>