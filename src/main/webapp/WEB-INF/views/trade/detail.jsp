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
 <c:import url="../template/trade/header.jsp"></c:import>
 <link rel="stylesheet" href="../../../resources/css/itemdetail.css">
 


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
                    <label for="id" class="form-label"> id </label>
                    <input type="text" name="id" class="form-control" id="id">
                  </div>
          
                  <div class="mb-3">
                    <label for="reviewContents" class="form-label">contents</label>
                    <textarea  name="reviewContents" class="form-control" id="reviewContents"></textarea>
                  </div>
   
                    <div id="addFiles">
                        <button type="button" class="btn btn-danger" id="fileAdd">추가</button>
                
                        </div>
                
                 
                <div class="modal-footer">
                  <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>                  
                  <button type="button" id="rvsubmit" class="btn btn-secondary"  data-bs-dismiss="modal" >전송</button>
                  
                  
                  
                  
                </div>
              </div>
            </div>
          </div>
        </div>  

        
        <!-- wrap -->
        <div id="wrap">
        
        <div class="top_menu">
                <div class="layout_inner">
                    <div class="right_menu">
                        <span class="line"></span>
                        
                        
            <!-- header -->
            <div id="header">

        <!-- 리뷰어신청하기 -->
       
        <div class="sub_container">
            <div class="sub_item_wrap">
                         

                <div class="item_thum">

                 <img id="it_img_m" src="/resources/upload/item/${fileDTO.fileName}">
                    
                    <ul class="it_img_thumb">
 
                                    
                    <c:forEach items="${dto.itemImageDTOs}" var="fileDTO">
                      <li><img src="/resources/upload/item/${fileDTO.fileName}" class="it_img_s it_img_s_on"></li>
					</c:forEach>
                                    
                    </ul>
	           
                </div>
               
                
                <div class="item_info">
                    <div class="sns blog"></div>
                    <div class="itname fotr"> <span style="color:#55caca">${dto.itemCategory} </span>${dto.itemTitle}</div>
                    <span class="itdes">#남녀노소 #모두가 좋아하는 #건강 간식 </span>
        

                            <div class="btn_wrap">
                                <ul>
                                     <li>
                                        <div class="review_req">
                
                                       <span class="text">상품 정보 </span>
                                        ${dto.itemContents}
                                        
                                        
                                            </div>
                                      </div>
                                        
                                    </li>
                                    
                                </ul>
                            </div>


                    <div class="review_wrap">
        
        
                            
                            <div class="box">
                                <span class="icon pro1"></span>
                                <span class="text">
                                    <em>상품 상태</em> 
                                    <b> 새상품 </b>
                                </span>
                            </div>
        
                            <span class="next"></span>
        
                            <div class="box">
                                <span class="icon pro2"></span>
                                <span class="text">
                                 <em> 상품가격 </em>

                                 <b>${dto.itemPrice}</b>


                                </span>
                            </div>
                           
        
                            <span class="next"></span>
        
                            <div class="box">
                                <span class="icon pro3"></span>
                                <span class="text">
                                <em>후기글 작성</em> 
                                <b><button type="button" class="itemreview_tit" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                    상품 후기
                                   </button></b>
                            </span></div>
        
                            
                    </div>
                    <div class="time_wrap">
                        <div class="left">
                            <span ><a href= "./update?num=${dto.itemNum}" class="btn btn-primary">상품 수정</a></span>
                            <span ><a href="./delete?num=${dto.itemNum}" class="btn btn-danger">상품 삭제</a></span>
                        </div>
                        <div class="right">
        
                        </div>
        
                    </div>

                    

       
                </div>    
                <div style="clear:both;"></div>
                </div>
            </div>
    
        
        <!-- item_detail -->
        <div class="item_detail">
            <ul class="teb_menu">
                <li class=""><a href="#tab1">답글</a></li>
                <li class="active"><a href="#tab2">이전 상품 정보</a></li>	</ul>
            <hr class="teb_line">
            
            <div id="tab2" class="tab-cont" style="display: block;">
                
        <div class="cpa">
           

            <ul>
                        <li>
                                                          
                              <c:forEach items="${dto.itemImageDTOs}" var="itemimage">          
                    <img src="/resources/upload/item/${itemimage.fileName}" class="avatar" style="background-color: transparent; opacity: 1; transition: opacity 0.1s;">
                </c:forEach>        


                            <a href="./detail?num=${dto.itemNum}">
                                <strong>${dto.itemTitle}</strong>
                                <p>${dto.itemPrice}</p> </a>
        
                </li>
                       
                    </ul>


        </div>
      
        </div>

        
        
        <div id="left_banner_top" style="display:none;">
        
            <ul>
             
            </ul>
        
        </div>
        
        <div id="left_banner">
        
            <ul>
             
            </ul>
        
        </div>
    
       

<!-- bootStrap -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
<script type="text/javascript"></script>
<script src="/resources/js/itemreview.js"></script> 

<script type="text/javascript">
    function review_delete(rv_id){
        
        if(confirm("신청을 취소하시겠습니까?")){
    
            $.ajax({
                type: "post",
                url: "item.php",
                data: {
                    "mode":"review_delete",
                    "rv_id":rv_id
                },
                cache: false,
                async: false,
                success: function(response){
                    var json = $.parseJSON(response); 
                    if(json["result"]=="ok"){				
                        alert(json["msg"]);
                        document.location.reload();
                    } else{
                        alert(json["msg"]);
                    }
                }
            });
    
        }
    
    }
    //-->
    </script>    </div>
        <br><br><br>
    </div>
    <!-- //item_detail -->
    
    
    
    <script type="text/javascript">
    
    var it_buy_qty = parseInt("1");
    var it_opt_depth = parseInt("0");
    var cf_name = "스토리앤미디어";
    var it_url = location.href;	
    var it_img = "https://www.storyn.kr/data/main/166442514316618321651659068648991816278_4nD59N2A_5BED81ACEAB8B0EBB380ED99985D1.png";
    var it_name = "투르크와즈";
    var it_description = "#터키도자기 #이국적 #실물깡패";
    var it_id = "1664425131";
    var app_schema = "net.nfor.demo";
    var app_name = "nfor";
    var kakao_key = "eb2b85038c91eacb325347827375f553";
    
        
    $(".review_order_popup_bg").on("click", function(){	
        $('.review_order_popup').hide();
    });
    
        
    $("#review_close_btn").on("click", function(){	
        $('.review_order_popup').hide();
    });
    
    
    var storyn_wr_id = "";
    
    function storyn_insert(){
        $.ajax({
            type: "post",
            data : "mode=storyn&it_id="+it_id,
            url: "item.php",
            success: function(response){
                var json = $.parseJSON(response); 
                
                if(json["result"]=="login"){
                    alert("로그인하셔야 이용가능합니다");
                    location.replace("login.php?url=item.php?it_id="+it_id);				
                } else if(json["result"]=="delete"){
                    alert(json["msg"]);
                    window.location.reload();
                } else if(json["result"]=="insert"){
                    alert(json["msg"]);
                    window.location.reload();
                } else{
                    alert(json["msg"]);
                }
    
                $("#review_btn_cnt").html(json["it_storyn_cnt"]);
            }
        });
    }
    
    function free365_insert(){
        $.ajax({
            type: "post",
            data : "mode=free365&it_id="+it_id,
            url: "item.php",
            success: function(response){
                var json = $.parseJSON(response); 
                
                if(json["result"]=="login"){
                    alert("로그인하셔야 이용가능합니다");
                    location.replace("login.php?url=item.php?it_id="+it_id);				
                } else if(json["result"]=="delete"){
                    alert(json["msg"]);
                    window.location.reload();
                } else if(json["result"]=="insert"){
                    alert(json["msg"]);
                    window.location.reload();
                } else{
                    alert(json["msg"]);
                    window.location.reload();
                }
    
                $("#review_btn_cnt").html(json["it_storyn_cnt"]);
            }
        });
    }
        
    $("#btn_order").on("click", function(){	
        if(is_member=="1"){
    
    
                    alert("본 캠페인은 일반 인플루언서 전용 캠페인입니다.");
            return;
            
                    $("html, body").animate({scrollTop:0},'slow');
            $('.review_order_popup').show();
            
    
    
    
    
    
        } else{
            alert("로그인하셔야 이용가능합니다");
            location.href="login.php?url=item.php?it_id="+it_id;
        }
    });
    
    $(document).ready(function() {
        $(".teb_menu li").click(function(){
            $(".teb_menu li").removeClass("active");
            $(this).addClass("active");
            $(".tab-cont").hide();
            $($(this).find("a").attr("href")).show();
            return false;
        });
    
    });
    
    $("#btn_zzim").on("click", function(){	
    
        $.ajax({
            type: "post",
            data : "mode=zzim&it_id="+it_id,
            url: "item.php",
            success: function(response){
                var json = $.parseJSON(response); 
                
                if(json["result"]=="login"){
                    alert("로그인하셔야 이용가능합니다");
                    location.replace("login.php?url=item.php?it_id="+it_id);				
                } else if(json["result"]=="delete"){
                    
                    $("#btn_zzim").removeClass("scrap_btn").removeClass("scrap_btn_on");
                    $("#btn_zzim").addClass("scrap_btn");
                } else if(json["result"]=="insert"){
                    $("#btn_zzim").removeClass("scrap_btn").removeClass("scrap_btn_on");
                    $("#btn_zzim").addClass("scrap_btn_on");
                } else{
                    alert(json["msg"]);
                }
    
                $("#btn_zzim strong").html(json["it_zzim_cnt"]);
            }
        });
    
    });
    //-->
    </script>
<script type="text/javascript">
        
        
    function scrollDown(){
        if( $('div.dealInfo').length > 0 ) {
            var positionObj = $("#scrolldownPosition");
            var offset = positionObj.offset()
            var top = offset.top - document.documentElement.clientHeight + positionObj.height();
            window.scrollTo(0,top);
        }else{
            window.scrollTo(0,document.body.scrollHeight);
        }
    }
    
    $(window).scroll( function(){
        var scrollTop = $(document).scrollTop();
        var topprefix = 700;
        var rightbannerBottom = $('#tb2').position().top + topprefix + $('#tb2').height();
    
        if (scrollTop >= rightbannerBottom)
        {
            $('.today_view').attr('class','today_view flow');
        }
        else if (scrollTop < rightbannerBottom)
        {
            $('.today_view').attr('class','today_view');
        }
    });

    </script>
     <script type="text/javascript">
                 
        $(document).ready(function() {
            $('#msgboxwrap').mouseover(function() {
                $("#msgbox").show();  
            });
            $('#msgboxwrap').mouseout(function() {
                $("#msgbox").hide();  
            });

            $('#msgbox').mouseover(function() {
                $("#msgbox").show();
            });

            $('#msgbox').mouseout(function() {
                $("#msgbox").hide();
            });
        });
        
        </script>	
    

<script type="text/javascript">
                       
    function today_pn(ty){
    var nownum = Number($("#nownum").val());
    var max_pg = Number("1");

    if(ty=="p"){
        nownum = nownum - 1;
    } else{
        nownum = nownum + 1;
    }

    if(nownum > max_pg){
        nownum = 1;
    }

    if(nownum < 1){
        nownum = max_pg;
    }

    $("#nowviewid").html(nownum);
    $("#nownum").val(nownum)

    $(".li_cl").hide();
    $(".li_cl_"+nownum).show();
    }
    </script>
<script type="text/javascript">
                 
    $(document).ready(function() {
        $('#msgboxwrap').mouseover(function() {
            $("#msgbox").show();  
        });
        $('#msgboxwrap').mouseout(function() {
            $("#msgbox").hide();  
        });

        $('#msgbox').mouseover(function() {
            $("#msgbox").show();
        });

        $('#msgbox').mouseout(function() {
            $("#msgbox").hide();
        });
    });
    </script>	

        
<script type="text/javascript">
        
    $(function(){

        $(".it_img_s").click(function () {
            $(".it_img_s").removeClass("it_img_s_on");
            $(this).addClass("it_img_s_on");
            $("#it_img_m").attr("src",$(this).attr("src"));
        });

    })
</script>
<c:import url="../template/trade/footer.jsp"></c:import>

</body>
</html>