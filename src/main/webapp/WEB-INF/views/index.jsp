<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ include file="layout/header.jsp" %>

<head>
    <title>Genie Market</title>
    <link rel="stylesheet" href="/css/user.css">

    <link rel="stylesheet" href="http://cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

    <style>
        .container {

        }

        .sidebar {
            text-align: center;
            font-size: 17px;
            line-height: 40px;
            width: 35px;
            padding: 10px 24px 10px 8px;
            position: fixed;
            top: 40%;
            right: 5px;
            background-color: white;
            border: 1px solid dimgray;
            color: white;
        }

        .sidebar a[href] {
            word-break: break-word;
            color: dimgray;
            text-decoration: none;
        }

        h1 {
            text-align: center;
        }

        h3 {
            font-size: 20px;
        }

        #sbtn {
            background-color: #9AA4FF;
            border: none;
            margin-bottom: 10px;
        }

        #item-img {
            height: 200px;
            border-radius: 100%;
            overflow: hidden;
            margin-bottom: 10px;
        }

        .border {
            width: 240px;
            border-color: dimgrey;
            border-style: outset;
            border-radius: 5%;
            margin: 10px 50px 10px 0px;
            padding: 15px 20px 15px 20px;
            text-align: left;
            flex: none;
        }

        #slide {
            margin-left: -210px;
            width: 1530px;
        }

        .slide-img {
            width: 1530px;
        }

        #shopitem1, #shopitem2 {
            display: flex;
            flex-direction: row;
        }

        .ad {
            width: 1110px;
            margin-bottom: 30px;
        }

        #center {
            text-align: center;
        }
    </style>
</head>

<div class="container">
    <br>
    <h1>Genie Market Shop</h1>
    <br><br>

    <%-- Slide --%>
    <div id="slide">
        <div id="slideWrap" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <a href="/"><img src="/images/img1.png" class="slide-img"></a>
                </div>
                <div class="carousel-item">
                    <a href="/"><img src="/images/img2.png" class="slide-img"></a>
                </div>
                <div class="carousel-item">
                    <a href="/"><img src="/images/img3.png" class="slide-img"></a>
                </div>
                <a class="carousel-control-prev" href="#slideWrap" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                </a>
                <a class="carousel-control-next" href="#slideWrap" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                </a>
            </div>
        </div>
    </div>
    <br><br>


    <br><br>

    <%-- ad1 --%>
    <div id="ad1">
        <a href="/"><img src="/images/img4.png" class="ad"></a>
    </div>
    <br>

    <h2 style="text-align: center; font-weight: bold">BEST</h2>
    <hr>

    <div id="slideBestItem" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active">
                <div id="shopitem1">
                    <c:forEach var="item" items="${items}" begin="0" end="3">
                        <div class="border">
                            <div id="item-img">${item.img}</div>
                            <h5 id="center">${item.name}</h5>
                            <h6 id="center">가격 : ${item.price}원</h6>
                            <div class="item-sbtn" style="text-align: center;">
                                <a id="sbtn" href="/shop/${item.id}" class="btn btn-info">상세상품보기</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="carousel-item">
                <div id="shopitem2">
                    <c:forEach var="item" items="${items}" begin="4" end="7">
                        <div class="border">
                            <div id="item-img">${item.img}</div>
                            <h4>${item.name}</h4>
                            <h6>가격 : ${item.price}원</h6>
                            <div class="item-sbtn" style="text-align: center;">
                                <a id="sbtn" href="/shop/${item.id}" class="btn btn-info">상세상품보기</a>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <a class="carousel-control-prev" href="#slideBestItem" data-slide="prev">
                <span class="carousel-control-prev-icon"></span>
            </a>
            <a class="carousel-control-next" href="#slideBestItem" data-slide="next">
                <span class="carousel-control-next-icon"></span>
            </a>
        </div>
    </div>
    <br><br>

    <%-- ad2 --%>
    <div id="ad2">
        <a href="/"><img src="/images/img5.png" class="ad"></a>
    </div>

    <%-- Sidebar --%>
    <div class="sidebar">
        <a href="/"><i class="xi-home-o"></i></a>
        <a href="/shop/cart"><i class="xi-cart-o"></i></a>
        <a href="#top"><i class="xi-arrow-top"></i></a>
    </div>

</div>
<%@ include file="layout/footer.jsp" %>