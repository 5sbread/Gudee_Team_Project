
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>

<html>
<head>
    <meta charset="UTF-8">
    <title> 상품페이지 </title>
    
    <!--summernote jquery  -->
    <script type="text/javascript" src="//code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- bootStrap -->	
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">
    
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');

    </style>
    
    <c:import url="../template/trade/header.jsp"></c:import>
    <link rel="stylesheet" href="/resources/css/trade/header.css" />
    <link rel="stylesheet" href="/resources/css/trade/footer.css" />
    <link rel="stylesheet" href="../../../resources/css/itemdetail.css" />

</head>
<body>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
              <div class="modal-content">
                <div class="modal-header">
                  <h1 class="modal-title fs-5" id="exampleModalLabel">${dto.itemTitle}</h1>
                  <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
          
                    <input type="hidden" id="reviewNum">
                  <div class="mb-3">
                    <label for="user" class="form-label"> user </label>
                    <input type="text" value="${sessionScope.member.nickname}" name="id" class="form-control" id="user">
                  </div>
          
         			 <div class="mb-3">
                    <label for="reviewScore" class="form-label">별점</label>
                    <input type="text" name="reviewStar" class="form-control" id="reviewScore">
                  </div>
                  
                  <div class="mb-3">
                    <label for="contents" class="form-label">contents</label>
                    <textarea  name="reviewContents" class="form-control" id="contents"></textarea>
                  </div>
                  
   
                    <div id="addFiles">
                        <button type="button" class="btn btn-danger" id="fileAdd">추가</button>
                    </div>
                
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>                  
                  <button type="submit" name="review" class="btn btn-secondary" data-bs-dismiss="modal" id="review" >전송</button>
                </div>
              </div>
            </div>
          </div>
        </div>  



<div class="sub_container">
    <div class="sub_item_wrap">
            <div class="item_thum carousel slide" id="carouselExample" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
                    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    <!-- 이미지 아래 ㅡ 자 모양 -->
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="5000">
                      <c:forEach items="${dto.itemImageDTOs}" var="list" end="0">
                        <img src="../../../resources/upload/item/${list.fileName}" class="d-block w-100" alt="...">
                      </c:forEach>
                    </div>
                    <c:forEach items="${dto.itemImageDTOs}" var="list" begin="1">
                      <div class="carousel-item" data-bs-interval="5000">
                        <img src="../../../resources/upload/item/${list.fileName}" class="d-block w-100" alt="...">
                      </div>
                    </c:forEach>
                </div>
              <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Previous</span>
              </button>
              <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="visually-hidden">Next</span>
              </button>
            </div>
        



        <div class="item_info">
			<div class="sns insta"></div>
			<div class="itname fotr"> <span style="color:#55caca">[${dto.itemCategory}] </span>${dto.itemTitle}</div>



            <span class="campain_tit">상품 정보</span>
            <div class="campain_wrap">
            	<p>&nbsp;</p>
                <p>${dto.itemContents}</p>		
            
            	<input type="hidden" id="memberNum" value="${sessionScope.member.memberNum}">
                <input type="hidden" id="itemNum" value="${dto.itemNum}">
                            
                <c:if test="${isLikeExist eq false}">
					<button type="button" id="likeBtn">좋아요</button>
				</c:if>
				<c:if test="${isLikeExist}">
					<button type="button" id="unlikeBtn">좋아요 취소</button>
				</c:if>
				<span>💚 ${like}</span>
            </div>



			<div class="review_wrap">

					<div class="box">
						<span class="icon pro1"></span>
						<span class="text">
							<em>상품 게시일</em> 
							<b>${dto.itemDueDate}</b>
						</span>
					</div>

					<span class="next"></span>

					<div class="box">
						<span class="icon pro2"></span>
						<span class="text">
							<em>상품 가격</em> 
							<b>${dto.itemPrice}</b>
						</span>
					</div>

				

                            <span class="next"></span>
                                    
                            <div class="box">
                                <span class="icon pro3"></span>
                                <span class="text">
                                <em>후기글 작성</em> 
                                <b><button type="button" class="itemreview_tit" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    상품 후기 </button></b>
                            </span></div>

                            </div>



		
    

                        <div class="time_wrap">
                            <div class="left">
	                            <span class="title">
	                            	<a href= "./update?num=${dto.itemNum}" class="btn btn-primary">상품 수정</a>
	                            </span>
                            </div>
                            <div class="right">
                            	<span class="title">
                            		<a href="./delete?num=${dto.itemNum}" class="btn btn-danger">상품 삭제</a>
                            	</span>
                            </div>
			</div>
            
        </div>    
        <div style="clear:both;"></div>
        </div>
    </div>





            <div class="item_detail">
                <div class="item_wrap">
            
                <ul class="teb_menu">
                    <li class="active"><a href="#tab1">댓글</a></li>
                    <li><a href="#tab2">이전 상품 보기</a></li>	
                </ul>
            
                    <hr class="teb_line">
                <div id="tab1" class="tab-cont">
                
                    <!-- comment -->
                    <!-- list 출력 -->
                  <div >

                    <table id="commentList" class="table table-danger">
			

                    </table>


                  </div>

                <!--comment 작성  -->
                  <div class="row">
                     <div class="mb-3">
                        <label for="writer" class="form-label">사용자이름</label>
                        <input type="text" name="writer"  class="form-control" id="writer" >
                      </div>
                      <div class="mb-3">
                        <label for="contents" class="form-label">댓글</label>
                        <textarea class="form-control" name="contents" id="contents" rows="3"></textarea>
                      </div>

                        <div class="mb-3">
                          <button type="submit" class="btn btn-primary mb-3" id="commentAdd" data-comment-num="${dto.itemNum}">댓글 등록</button>
                        </div>
                      </div>
                      
                     <!-- comment -->


            </div> 


    <div id="tab2" class="tab-cont">
   

            <div class="cpa">
                <ul>
                            <li>
                        <img src="/resources/upload/item/KakaoTalk_2011.jpg" class="avatar" style="background-color: transparent; opacity: 1; transition: opacity 0.1s;">
                        <strong>상품이름</strong>
                                    <p>${dto.itemDueDate}</p>

                        </li>
                        
                        </ul>
            </div>

    </div>
	
    <br><br><br>
</div>  

<script src="../../../resources/js/itemdetail.js"></script>
<script src="../../../resources/js/itemcomment.js"></script>
<c:import url="../template/trade/footer.jsp"></c:import>

<script src="../../../resources/js/trade/itemLike.js"></script>

</body>
</html>