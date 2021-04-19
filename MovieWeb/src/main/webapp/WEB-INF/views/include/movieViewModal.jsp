<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog modal-lg">
      <div class="modal-content">
        <div class="modal_header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal_body">
         
          <div class="modal_body_top">
               <div class="modal_body_inner">
                   <img src="${pageContext.request.contextPath }/resources/img/movie1.jpg"> 
               </div>
               <div class="modal_body_inner2">
                   <div class="modal_body_title">
                       <h1><strong>겨울왕국 2</strong></h1>
                       개봉날짜 : 2019-12-17<br>
                       상영종료 : 2020-01-22
                   </div>
                   <hr>
                   <button type="button" class="btn btn-primary btn-block">예매하기</button>
                   <div class="modal_body_content">
                       <h3>줄거리</h3>
                        내 마법의 힘은 어디서 왔을까?<br>
                        나를 부르는 저 목소리는 누구지?<br>

                        어느 날 부턴가 의문의 목소리가 엘사를 부르고,<br>
                        평화로운 아렌델 왕국을 위협한다.<br>
                        트롤은 모든 것은 과거에서 시작되었음을 알려주며<br>
                        엘사의 힘의 비밀과 진실을 찾아 떠나야한다고 조언한다........

                   </div>
               </div>  
          </div>
          <hr>
        </div>
        
        <!-- 댓글영역 -->
        <div class="modal_footer">
           <!--댓글작성영역-->
            <div class="modal_footer_write">
              <h3>한줄평 ( 33 )</h3>
               <div class="movie_rep_content form-group">
                  <textarea class="form-control" rows="5" id="rep_comment"></textarea>
                </div>
                <div class="movie_rep_content">
                    <button class="btn movie_rep_button">등록</button>
                </div>
            </div>  
            <hr>
            <!-- 댓글리스트 -->
            <div>
                <div class="modal_reply_list">
                      <div class="modal_reply_inner">
                          <div class="modal_reply_id"><h3><strong>hong123</strong></h3></div>
                      </div>
                      <div class="modal_reply_inner">
                          <div class="modal_reply_date">2019-12-19</div>
                      </div>
                      <div class="modal_reply_inner">
                          <div class="modal_reply_del">
                              <button type="button" class="btn btn-default glyphicon glyphicon-pencil">수정</button>
                              <button type="button" class="btn btn-default glyphicon glyphicon-remove">삭제</button>
                          </div>
                      </div>

                </div> 
                <div>
                    재밌어요 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요 재밌어요 
                </div>
                <hr>
            </div>
            
            <div>
                <div class="modal_reply_list">
                      <div class="modal_reply_inner">
                          <div class="modal_reply_id"><h3><strong>abcd1234</strong></h3></div>
                      </div>
                      <div class="modal_reply_inner">
                          <div class="modal_reply_date">2019-12-19</div>
                      </div>
                      <div class="modal_reply_inner">
                          <div class="modal_reply_del">
                              <button type="button" class="btn btn-default glyphicon glyphicon-pencil">수정</button>
                              <button type="button" class="btn btn-default glyphicon glyphicon-remove">삭제</button>
                          </div>
                      </div>

                </div> 
                <div>
                    재미없어요 재미없어요 재미없어요 재미없어요 재미없어요
                </div>
                <hr>
            </div>
            
        </div>
        <!-- 댓글영역끝 -->
      </div>
    </div>
  </div>
</body>
</html>