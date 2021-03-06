<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SHOP</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/normalize.css'/>">
     <link rel="stylesheet" href="<c:url value='/_00_util/allUtil/css/background.css'/>">
<!--     <link rel="stylesheet" href="slick/slick.css"/> -->
<!-- 		Add the new slick-theme.css if you want the default styling -->
<!--     <link rel="stylesheet" href="slick/slick-theme.css"/> -->
    <link rel="stylesheet" href="<c:url value='/_00_util/nightShopUtil/css/1_shop.css'/>"/>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.min.js" integrity="sha384-+YQ4JLhjyBLPDQt//I+STsc9iw4uQqACwlvpslubQzn4u2UU2UFM80nGisd026JF" crossorigin="anonymous"></script>
<!--     <script type="text/javascript" src="js/slick_jquery1.11.0.min.js"></script> -->
<!--     <script type="text/javascript" src="js/slick_jq_migrate1.2.1.min.js"></script> -->
<!--     <script type="text/javascript" src="slick/slick.js"></script> -->
</head>
<body>
	<jsp:include page="/WEB-INF/views/_00_util/allUtil/jsp/header.jsp" />
	<h1>${store }</h1>
	 <!-- slider -->
	 <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
		  <ol class="carousel-indicators">
		    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
		    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		  </ol>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="<c:url value='/data/images/slidePic/?????????????????????1.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="<c:url value='/data/images/slidePic/?????????????????????2.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		    <div class="carousel-item">
		      <img src="<c:url value='/data/images/slidePic/?????????????????????3.jpg'/>" class="d-block w-100" alt="...">
		    </div>
		  </div>
		  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
		    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
		    <span class="sr-only">Previous</span>
		  </a>
		  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
		    <span class="carousel-control-next-icon" aria-hidden="true"></span>
		    <span class="sr-only">Next</span>
		  </a>
	</div>
	 
	 
	 
	 
	 
<!--     <div id="sliderContainer"> -->
<!--         <div class="slider"> -->
<!--             <div class="slick-slider image"><img src="images_2/?????????????????????1.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/?????????????????????2.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/?????????????????????3jpg.jpg" alt=""></div> -->
<!--             <div class="slick-slider image"><img src="images_2/1_product.jpg" alt=""></div> -->
<!--         </div> -->
<!--     </div> -->
    <!-- End:slider -->

    <div id="secondContainer" class="container">
        <div class="row">
            <!-- Left -->
            <div id="sectionLeft" class="col-8">
                <!-- ???????????? -->
                <div id="shopInfo">
                    <h2 style="color: #f26419;">???????????????</h2>
                    <div>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                        <i class="fas fa-star"></i>
                    </div>
                    <p style="color: #78886f;">???????????????????????????????????????????????????????????????????????????,??????????????????????????????????????????????????????????????????,???????????????????????????;????????????????????????????????????,??????????????????????????????????????????????????????????????????,?????????????????????????????????????????????????????????</p>
                </div>
                <!-- ???????????? -->

                <!-- ??????????????? -->
                <div class="addCoupon">
                    <div><i class="far fa-plus-square fa-2x"></i></div>
                    <div><img src="<c:url value='/data/images/smallPic/coupon2.png'/>" style="width: 50px;"></div>
                    <div class="couponInfo" >
                        <h3>???????????????</h3>
                       ?????????100??????????????????40??????!!!<br>
                        <h4>????????????</h4>
                        ??????????????????????????????????????????????????????????????????????????????!!!
                    </div>
                </div>
                <div class="addCoupon">
                    <div><i class="far fa-plus-square fa-2x"></i></div>
                    <div><img src="<c:url value='/data/images/smallPic/coupon2.png'/>" style="width: 50px;"></div>
                    <div class="couponInfo" >
                        <h3>???????????????</h3>
                        ?????????200??????????????????90??????!!!<br>
                        <h4>????????????</h4>
                        ??????????????????????????????????????????????????????????????????????????????!!!
                    </div>
                </div>
                <!-- ??????????????? -->
                
                <!-- ????????? -->
                <div id="comment">
                    <div class="mt-5">
                        <h2><i class="fas fa-comments"></i>????????????</h2>
                    </div>
                    <div class="container pb-4 my-5 border-bottom">
                        <div class="row" id="flexbox1">

                            <div class="col-12">
                                <div>
                                    ???????????????????????????????????????????????????<span>??????</span>??????
                                </div>
                                <div class="row py-2">
                                    <div class="col-3">????????????????????????~~</div>
                                    <div id="score" class="col-3">
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                        <i class="far fa-thumbs-up"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-12 flexitem" id="flex-item-1">
                                <input type="text" class="form-control" placeholder="????????????...." aria-label="Username" aria-describedby="basic-addon1">
                            </div>

                            <div class="col-12 flexitem" id="flex-item-2">
                                <textarea class="form-control" aria-label="With textarea" placeholder="????????????..."></textarea>
                            </div>

                            <div class="col-12 flexitem" id="flex-item-3">
                                <button type="button" class="btn btn-secondary btn-sm btn-block">????????????</button>
                            </div>

                        </div>

                    </div>
                </div>

                <!-- ???????????? -->
                <div class="commentBox">

                    <div class="memberInfo">
                        <div class="putLeft">
                            <div class="memberImage">
                            
                                <img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
                            </div>
                            <span class="memberId">vickychen0087</span>
                            <span class="nickname">Vicky</span>
                            <div class="comment_score">
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                            </div>
                        </div>
                        
                         <!-- ????????????????????????????????????????????? -->
                         <div class="doMore"><i class="fas fa-ellipsis-v"></i>
                            <!-- ????????????css ??? jq ??? class????????? -->
                            <!-- <ul class="dropdownList jq-dropdown">
                                <li>??????</li>
                                <li>??????</li>
                            </ul> -->
                        </div>
                    </div>
            
                    <div class="comment_content">
                        <span>??????</span>
                    </div>

                </div>
                <div class="commentBox">

                    <div class="memberInfo">
                        <div class="putLeft">
                            <div class="memberImage">
                                <img src="<c:url value='/data/images/mediumPic/noPeople.png'/>">
                            </div>
                            <span class="memberId">vickychen0087</span>
                            <span class="nickname">Vicky</span>
                            <div class="comment_score">
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                                <i class="far fa-thumbs-up"></i>
                            </div>
                        </div>
                        
                         <!-- ????????????????????????????????????????????? -->
                         <div class="doMore"><i class="fas fa-ellipsis-v"></i>
                            <!-- ????????????css ??? jq ??? class????????? -->
                            <!-- <ul class="dropdownList jq-dropdown">
                                <li>??????</li>
                                <li>??????</li>
                            </ul> -->
                        </div>
                    </div>
            
                    <div class="comment_content">
                        <span>??????????????????????????????</span>
                    </div>

                </div>

                <!-- ????????? -->

            </div>
            <!-- End:Left -->
            <!-- Right -->
            <div id="RightBorder" class="col-4">
                <div id="shopPhone">
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-phone-alt"></i>
                        </div>
                        <div class="item-right">
                            09193939938
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-map-marked-alt"></i>
                        </div>
                        <div class="item-right">
                            ?????????????????????
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fab fa-chrome"></i>
                        </div>
                        <div class="item-right">
                            chickenrice.com.tw
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-clock"></i>
                        </div>
                        <div class="item-right">
                            Mon~Fri  : 16~22 <br>
                            Sat~Sun : 16~24
                        </div>
                    </div>
                    <div class="item">
                        <div class="item-left">
                            <i class="fas fa-bars"></i>
                        </div>
                        <div class="item-right">
                            <a href="#">MENU</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- End:Right -->
        </div>    
            
    </div>


<!--     <script> -->
<!-- //         $(document).ready(function(){ -->
<!-- //             $('.slider').slick({ -->
<!-- //                 dots: true, -->
<!-- //                 infinite: true, -->
<!-- //                 speed: 500, -->
<!-- //                 fade: true, -->
<!-- //                 cssEase: 'linear', -->
<!-- //                 autoplay: true, //???????????? -->
<!-- //                 autoplaySpeed: 5000, //?????????????????????????????????????????? -->
<!-- //             }); -->
<!-- //         }); -->
<!--     </script> -->
</body>
</html>