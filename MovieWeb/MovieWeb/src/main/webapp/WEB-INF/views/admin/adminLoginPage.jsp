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
    
    <section>
        <div class="container" style="text-align: center;">
           <br><br>
           <h2>Admin 로그인창</h2>
           <br><br><br>
           <form action="adminLogin" method="post">
            <input type="text" class="form-control" placeholder="ID" name="adminId">
            <input type="password" class="form-control" placeholder="PassWord" name="adminPw"><br>
            <input type="submit" class="btn btn-info btn-lg" value="로그인">
            </form>
        </div>
        
    </section>
</body>
</html>