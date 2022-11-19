<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>찜바구니🛍️│구디마켓│중고거래📦</title>
	
	<!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <style>
		@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700&display=swap');
	</style>
    
  	<link rel="stylesheet" href="/resources/css/trade/header.css" />
    <link rel="stylesheet" href="/resources/css/trade/footer.css" />
    <link rel="stylesheet" href="/resources/css/trade/heartlist.css" />
    
</head>

<body>
 	<input type="hidden" id="memberNum" value="${sessionScope.member.memberNum}" name="memberNum">
	
	<c:import url="../template/trade/header.jsp"></c:import>

<div class="heartListBody">	
	<section class="heartList spad">
        <div class="hl-container">
            <div class="hl-row">
                <div class="col-lg-12">
                	<div class="contents--sodyd">
						<c:forEach items="${list}" var="item">
							<c:choose>
							<c:when test="${item.itemLikeDTO.likeNum != null}">
							    <div class="store_container">
							        <div class="store_card">
							            <div class="store_content">
							                <!-- 선택 버튼 -->
							                <div class="store_button">
							                    <button class="store_Btn" type="button" role="checkbox">
							                        <span class="checked">
							                            <svg width="16" height="16" viewBox="0 0 16 16" fill="none" xmlns="http://www.w3.org/2000/svg" class="ico_check--3-_9ZRQGKX">
							                                <path d="M12.945 4L14.1 5.154 6.387 12.8 2 8.4l1.155-1.153 3.232 3.246L12.945 4z" fill="#C7CACD"></path>
							                            </svg>
							                        </span>
							                    </button>
							                </div>
							                
							                <div class="store_detail">
							                    <div class="store_img">
							                        <img class="img_real" src="../resources/upload/item/${item.itemImageDTOs[0].fileName}">
							                    </div>
							                    <div class="store_info">
							                        <div class="store_title">${item.itemTitle}</div>
							                        <div class="store_price">${item.itemPrice}</div>
							                        <div class="store_seller">${item.memberNum}</div>
							                    </div>
							                </div>
							
							                <div class="store_delme">
							                    <div class="delme_delete">
							                        <button class="delme_Btn" type="button" role="button">
							                            <span>삭제 ❌</span>
							                        </button>
							                    </div>
							                    <div class="delme_message">
							                        <button class="delme_Btn" type="button" role="button">
							                            <span>메세지 ✉️</span>
							                        </button>
							                    </div>
							                </div>
							            </div>
							        </div>
							    </div>
							</c:when>
							<c:otherwise>
								<h1>NO DATA</h1>
							</c:otherwise>
							</c:choose>
						</c:forEach>
					</div>
  				</div>
            </div>
        </div>
    </section>	
</div>    

    <c:import url="../template/trade/footer.jsp"></c:import>
 
</body>
</html>