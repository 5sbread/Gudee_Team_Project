<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title> 구디마켓 중고거래 </title>

	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="/resources/css/trade/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/css/trade/style.css" type="text/css">
</head>

<body>   
    <c:import url="./common/header.jsp"></c:import>
	
	<section class="container-fluid col-lg-8 mt-5">
		<div id="carouselExampleDark" class="carousel carousel-dark slide"
			data-bs-ride="carousel">
			<div class="carousel-indicators">
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="0" class="active" aria-current="true"
					aria-label="Slide 1"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="1" aria-label="Slide 2"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="2" aria-label="Slide 3"></button>
				<button type="button" data-bs-target="#carouselExampleDark"
					data-bs-slide-to="3" aria-label="Slide 4"></button>	
			</div>
			<div class="carousel-inner">
				<div class="carousel-item active" data-bs-interval="2000">
					<img src="/resources/images/trade/banner_1.png" class="d-block w-100"
						alt="ìì´ë1">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="/resources/images/trade/banner_2.png" class="d-block w-100"
						alt="ìì´ë2">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="/resources/images/trade/banner_3.png" class="d-block w-100"
						alt="ìì´ë2">
				</div>
				<div class="carousel-item" data-bs-interval="2000">
					<img src="/resources/images/trade/banner_4.png" class="d-block w-100"
						alt="ìì´ë2">
				</div>
			</div>	
				
			<button class="carousel-control-prev" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="prev">
				<span class="carousel-control-prev-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Previous</span>
			</button>
			<button class="carousel-control-next" type="button"
				data-bs-target="#carouselExampleDark" data-bs-slide="next">
				<span class="carousel-control-next-icon" aria-hidden="true"></span>
				<span class="visually-hidden">Next</span>
			</button>
		</div>
	</section>
    
    
    <section class="featured spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h2>인기 상품</h2>
                    <h6>다른 사람들은 이 상품을 보고 있어요!</h6>
                </div>
            </div>
            <div class="row featured__filter" id="MixItUp2D9833">
            <c:forEach var="item" items="${list}">
                <div class="col-lg-3 col-md-4 col-sm-6 mix oranges fresh-meat">
                    <div class="featured__item">
                        <div class="featured__item__pic set-bg" data-setbg="/resources/images/trade/1_knit.jpg" style="background-image: url(&quot;/resources/images/trade/1_knit.jpg&quot;);">
                            <ul class="featured__item__pic__hover">
                                <li><a href="#"><i class="fa fa-heart"></i></a></li>
                            </ul>
                        </div>
                        <div class="featured__item__text">
                            <h6><a href="../item/detail?num=${item.itemNum}">${item.itemTitle}</a></h6>
                            <h5>${item.itemPrice}</h5>
                        </div>
                    </div>
                </div>
            </c:forEach>    
            </div>
        </div>
    </section>
    
	<c:import url="./common/footer.jsp"></c:import>
	
	<!-- Js Plugins -->
    <script src="/resources/js/trade/bootstrap.min.js"></script>
    <script src="/resources/js/trade/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/trade/jquery-ui.min.js"></script>
    <script src="/resources/js/trade/jquery.nice-select.min.js"></script>
    <script src="/resources/js/trade/jquery.slicknav.js"></script>
    <script src="/resources/js/trade/main.js"></script>
    <script src="/resources/js/trade/mixitup.min.js"></script>
    <script src="/resources/js/trade/owl.carousel.min.js"></script>

</body>

</html>