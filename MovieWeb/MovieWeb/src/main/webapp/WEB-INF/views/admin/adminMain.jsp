<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
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
        <div class="container" style="text-align: center;">
           <br><br><br><br><br>
            <h2>관리자님 환영합니다.</h2>
        </div>
        
    </section>
</body>
</html>