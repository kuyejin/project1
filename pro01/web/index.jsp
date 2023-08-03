<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Main Page</title>

    <%@ include file="head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="google.css">
    <link rel="stylesheet" href="fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>

    <link rel="stylesheet" href="common.css">
    <link rel="stylesheet" href="hd.css">
    <link rel="stylesheet" href="contents.css">
    <link rel="stylesheet" href="ft.css">
</head>


<body>
<div class="wrap">

    <header class="hd" id="hd">
        <%@ include file="header.jsp" %>
    </header>

    <div class="contents" id="contents">
        <figure class="vs">
            <ul class="img_box">
                <li class="item1 active">
                    <input type="radio" name="vs_ra" id="vs_ra1" class="vs_ra" checked>
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">교육에 대한 끊임없는 도전<br>
                        <strong>행복한 내일을 함께 합니다</strong></h2>
                </li>
                <li class="item2">
                    <input type="radio" name="vs_ra" id="vs_ra2" class="vs_ra">
                    <div class="bg_box"></div>
                    <h2 class="vs_tit">“나눔의 힘! 실천의 힘!”<br>
                        <strong>작은 따뜻함으로 세상을 <br>바꿉니다</strong>
                    </h2>
                </li>
            </ul>
            <ul class="btn_box">
                <li class="item1 active"><label for="vs_ra1" class="vs_btn"></label></li>
                <li class="item2"><label for="vs_ra2" class="vs_btn"></label></li>
            </ul>
            <button type="button" class="play_btn"></button>
        </figure>
        <script>
            $(function () {
                $(".btn_box li .vs_btn").click(function () {
                    var par = $(this).parents("li").index();
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(par).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(par).addClass("active");
                });
                var sw = 1;
                var int1 = setInterval(function () {
                    if (sw == 1) {
                        autoplay(1);
                        sw = 0;
                    } else {
                        autoplay(0);
                        sw = 1;
                    }
                }, 3500);

                function autoplay(n) {
                    $(".img_box li").removeClass("active");
                    $(".img_box li").eq(n).addClass("active");
                    $(".btn_box li").removeClass("active");
                    $(".btn_box li").eq(n).addClass("active");
                }

                $(".play_btn").click(function () {
                    if ($(this).hasClass("active")) {
                        $(this).removeClass("active");
                        sw = 1;
                        int1 = setInterval(function () {
                            if (sw == 1) {
                                autoplay(1);
                                sw = 0;
                            } else {
                                autoplay(0);
                                sw = 1;
                            }
                        }, 3500);
                    } else {
                        $(this).addClass("active");
                        sw = 0;
                        clearInterval(int1);
                    }
                });
            });
        </script>
        <section class="page" id="page1">
            <div class="page_wrap">
                <h2 class="page_tit">페이지 제목1</h2>
                <ul class="pic_lst">
                    <li class="item1">
                        <a href="">
                            <p class="pic_com">설명</p>
                            <h3 class="pic_tit">제목</h3>
                            <span class="pic_arrow"></span>
                        </a>
                    </li>
                    <li class="item2">
                        <a href="">
                            <p class="pic_com">설명</p>
                            <h3 class="pic_tit">제목</h3>
                            <span class="pic_arrow"></span>
                        </a>
                    </li>
                    <li class="item3">
                        <a href="">
                            <p class="pic_com">설명</p>
                            <h3 class="pic_tit">제목</h3>
                            <span class="pic_arrow"></span>
                        </a>
                    </li>
                    <li class="item4">
                        <a href="">
                            <p class="pic_com">설명</p>
                            <h3 class="pic_tit">제목</h3>
                            <span class="pic_arrow"></span>
                        </a>
                    </li>
                </ul>
            </div>
        </section>
        <section class="page" id="page2">
            <div class="page_wrap">
                <h2 class="page_tit">미디어</h2>
                <p class="page_com">천재교육의 보도자료와 SNS 콘텐츠를 소개합니다.</p>
                <div class="sl-btn-box">
                    <button type="button" class="btn next">&gt;</button>
                    <button type="button" class="btn prev">&lt;</button>
                </div>
                <!-- div.slide_box>ul.card_lst>li.item$*7>a>div.thumb_box+p.thumb_tit{썸네일제목$}+(div.ico_box>span.ico_item+span{아이콘$}.thumb_date{2023-07-18}) -->
                <div class="slide_box">
                    <ul class="card_lst">
                        <li class="item1">
                            <h3 class="cate_tit">언론보도</h3>
                            <ul class="cate_lst">
                                <li>
                                    <a href="">
                                        <p class="bd_content">운필력 키우는 한글 글쓰기, 유아학습지로 창의력과 표현력을 기른다.</p>
                                        <p class="bd_date">2023-07-17</p>
                                    </a>
                                </li>
                                <li>
                                    <a href="">
                                        <p class="bd_content">천재교과서, 스마트해법-밀크T 온·오프라인 결합 상품 더블케어 천재패스 출시</p>
                                        <p class="bd_date">2023-07-17</p>
                                    </a>
                                </li>
                            </ul>
                        </li>
                        <li class="item2">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2 썸네일제목2썸네일제목2 썸네일제목2
                                    썸네일제목2
                                    썸네일제목2썸네일제목2썸네일제목2 썸네일제목2 </p>
                                <div class="ico_box"><span class="ico item1"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                        <li class="item3">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목3</p>
                                <div class="ico_box"><span class="ico item1"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                        <li class="item4">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목4</p>
                                <div class="ico_box"><span class="ico item2"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                        <li class="item5">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목5</p>
                                <div class="ico_box"><span class="ico item1"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                        <li class="item6">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목6</p>
                                <div class="ico_box"><span class="ico item2"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                        <li class="item7">
                            <a href="">
                                <div class="thumb_box"></div>
                                <p class="thumb_tit">썸네일제목7</p>
                                <div class="ico_box"><span class="ico item1"></span><span
                                        class="thumb_date">2023-07-18</span></div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </section>
        <script>
            $(function () {
                $(".sl-btn-box .btn.next").click(function () {
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if (ln > -1110) {
                        var mv = ln - 370;
                        $(".card_lst").not(":animated").animate({"margin-left": mv + "px"});
                    }
                });
                $(".sl-btn-box .btn.prev").click(function () {
                    var ln = parseInt($(".card_lst").css("margin-left"));
                    if (ln < 0) {
                        var mv = ln + 370;
                        $(".card_lst").not(":animated").animate({"margin-left": mv + "px"});
                    }
                });
            });
        </script>


    </div>

    <footer class="ft" id="ft">
        <%@ include file="footer.jsp" %>
    </footer>

</div>
</body>
</html>