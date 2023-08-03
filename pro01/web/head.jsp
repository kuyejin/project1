<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
%>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Author" content="천재교육 콘텐츠 제작팀">
<meta http-equiv="Publisher" content="천재교육 김기태">
<meta http-equiv="Copyright" content="copyright@chunjae.co.kr">
<title>천재교육</title>

<!-- 검색엔진 최적화(SEO) -->
<meta name="Subject" content="천재교육, 천재IT교육센터">
<meta name="Keywords" content="천재교육, 천재 IT, 교육 교재, 교과서, 스마트 교육">
<meta name="Description" content="천재교육은 교과서 제작, 교육 교재 제작, 초등, 중등, 고등 교육에 대한 교재와 교육을 실시하는 기관입니다.">
<!-- <meta name="Robots" content="noindex, nofllow"> -->
<meta name="robots" content="index,follow">

<!-- 오픈 그래프(Open graph)-->
<meta property="og:type" content="website">
<meta property="og:title" content="천재교육">
<meta property="og:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta property="og:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">
<meta property="og:url" content="https://kktlove.github.io/web01">

<!-- 트위터 -->
<meta name="twitter:card" content="picture">
<meta name="twitter:title" content="천재교육">
<meta name="twitter:description" content="앞선 생각으로 더 큰 미래의 교육을 준비하는 기업">
<meta name="twitter:image" content="https://kktlove.github.io/web01/images/chunjae_logo.png">

<!-- 모바일 앱의 iOS 인 경우
<meta property="al:ios:url" content="ios 앱 url">
<meta property="al:ios:app_store_id" content="ios 앱스토어 ID" />
<meta property="al:ios:app_name" content="ios 앱 이름" />
-->

<!-- 모바일 앱의 Android 인 경우
<meta property="al:android:url" content="안드로이드 앱 URL" />
<meta property="al:android:app_name" content="안드로이드 앱 이름" />
<meta property="al:android:package" content="안드로이드 패키지 이름" />
<meta property="al:web:url" content="안드로이드 앱 URL" />
-->

<!-- 파비콘 설정 -->
<!-- 16x16, 24x24, 32x32, 48x48, 64x64, 96x96, 114x114, 128x128, 256x256 등을 활용-->
<!-- 표준 파비콘 -->
<link rel="shortcut icon" href="<%=path%>/images/logo.ico">
<!-- 애플 계열 모바일 -->
<link rel="apple-touch-icon-precomposed" href="<%=path%>/images/logo_64.png">
<!-- IE 계열 브라우저 -->
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="./images/logo_48.png">
<!-- 파이어폭스, 오페라, 또는 구형 크롬/사파리 -->
<link rel="icon" href="<%=path%>/images/logo_16.png" sizes="16x16">
<link rel="icon" href="<%=path%>/images/logo_32.png" sizes="32x32">
<link rel="icon" href="<%=path%>/images/logo_48.png" sizes="48x48">
<link rel="icon" href="<%=path%>/images/logo_64.png" sizes="64x64">

<!-- 스타일 초기화 : reset.css 또는 normalize.css -->
<link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

<!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
<link rel="stylesheet" href="google.css">
<link rel="stylesheet" href="fonts.css">

<!-- 필요한 플러그인 연결 -->
<script src="https://code.jquery.com/jquery-latest.js"></script>
<style>
    /* 스타일 사용자 정의 초기화 */
    * {
        margin: 0;
        padding: 0;
    }

    body, html {
        width: 100%;
        font-family: 'Noto Sans KR';
        overflow-x: hidden;
    }

    ul {
        list-style: none;
    }

    a {
        text-decoration: none;
        color: #333;
    }

    img {
        border: 0;
    }

    .wrap {
        clear: both;
        width: 100%;
    }

    .wrap::after {
        content: "";
        display: block;
        width: 100%;
        clear: both;
    }

</style>

<style>
    /*
    font-family: 'Noto Sans KR';
    font-family: 'Happy';
    font-family: 'Handon';
    font-family: 'iceSotong';
    */
    /* 헤더 구역 스타일 */
    .hd {
        clear: both;
        position: relative;
        width: 100%;
        height: 90px;
    }

    .hd_wrap {
        clear: both;
        width: 100%;
    }

    .hd_wrap:first-child {
        background-color: deepskyblue;
        border-bottom: 1px solid #333;
    }

    .hd_wrap:last-child {
        background-color: #fff;
        width: 1200px;
        margin: 0 auto;
    }

    .tnb {
        width: 1200px;
        margin: 0 auto;
    }

    .tnb::after {
        content: "";
        clear: both;
        display: block;
        width: 100%;
    }

    .tnb .menu {
        float: right;
        height: 40px;
        margin: auto;
        line-height: 40px;
    }

    .tnb .menu li {
        float: left;
        padding-left: 40px;
    }

    .logo {
        display: block;
        width: auto;
        height: 50px;
        float: left;
    }

    .logo img {
        display: block;
        width: auto;
        height: 100%;
    }

    .gnb {
        width: 900px;
        margin: 0 auto;
        float: right;
        height: 50px;
    }

    .gnb::before {
        content: "";
        display: block;
        width: 100vw;
        height: 210px;
        background-color: rgba(255, 255, 255, 0.75);
        position: absolute;
        left: 0;
        top: 90px;
        z-index: 15;
        display: none;
    }

    .gnb:hover::before {
        display: block;
    }

    .gnb .menu {
        clear: both;
        height: 50px;
        position: relative;
    }

    .gnb .menu::after {
        content: "";
        clear: both;
        width: 100%;
        display: block;
    }

    .gnb .menu li {
        float: left;
        width: 20%;
        position: relative;
        height: 50px;
    }

    .gnb .menu li .sub {
        visibility: hidden;
        opacity: 0;
        position: absolute;
        width: 180px;
        height: 200px;
        top: 48px;
        left: 0;
        z-index: 999;
        transition: 0.3s;
    }

    .gnb .menu li a.dp1 {
        display: block;
        width: 100%;
        line-height: 50px;
        border-bottom: 2px solid #fff;
        text-align: center;
        background-color: #fff;
        color: #333;
    }

    .gnb .menu li:hover a.dp1 {
        border-bottom: 2px solid deepskyblue;
        background-color: deepskyblue;
        color: #fff;
    }

    .gnb .menu:hover li .sub {
        visibility: visible;
        height: 240px;
        opacity: 1;
    }

    .gnb .menu li .sub li {
        padding-left: 0px;
        line-height: 34px;
        clear: both;
        width: 180px;
    }

    .gnb .menu li .sub li a {
        display: block;
        width: 180px;
        text-align: center;
        line-height: 34px;
        white-space: nowrap;
        text-overflow: ellipsis;
        overflow: hidden;
        padding-left: 8px;
        padding-right: 8px;
        box-sizing: border-box;
    }

    .gnb .menu li .sub li:hover a {
        background-color: rgba(200, 200, 200, 0.9);
    }
</style>

<style>
    /* 본문 영역 스타일 */
    .contents {
        clear: both;
    }

    .contents::after {
        content: "";
        clear: both;
        display: block;
        width: 100%;
    }

    .vs {
        clear: both;
        width: 100%;
        min-height: 600px;
        background-color: deeppink;
        position: relative;
        overflow: hidden;
    }

    .img_box {
        position: relative;
        width: 100%;
        height: 600px;
        overflow: hidden;
    }

    .img_box li {
        visibility: hidden;
        opacity: 0;
        transition-duration: 0.7s;
        transition-delay: 0.1s;
        width: 100%;
        height: 600px;
    }

    .img_box li .bg_box {
        width: 100vw;
        height: 600px;
        background-repeat: no-repeat;
        background-position: center center;
        background-size: cover;
        position: absolute;
        left: 0;
        top: 0;
        z-index: 5;
    }

    .img_box li.active .bg_box {
        z-index: 6;
    }

    .img_box li.item1 .bg_box {
        background-image: url("./images/img_main_keyVisual01_summer.jpg");
    }

    .img_box li.item2 .bg_box {
        background-image: url("./images/img_main_keyVisual03.jpg");
    }

    .img_box li .vs_tit {
        position: absolute;
        top: 180px;
        left: 100px;
        z-index: 10;
        font-weight: 300;
        font-size: 60px;
        line-height: 1.3;
    }

    .img_box li .vs_tit strong {
        font-weight: 500;
    }

    .img_box li.active {
        visibility: visible;
        opacity: 1;
    }

    .vs_tit {
        font-size: 60px;
        color: #fff;
    }

    .btn_box li .vs_btn {
        display: block;
        width: 12px;
        height: 12px;
        background-color: rgba(255, 255, 255, 0.8);
        border: 2px solid #fff;
        position: absolute;
        top: 100px;
        left: 100px;
        z-index: 14;
        cursor: pointer;
        border-radius: 50%;
    }

    .btn_box li.item2 .vs_btn {
        left: 132px;
    }

    .btn_box li.active .vs_btn {
        background-color: #fff;
        border: 2px solid #333;
    }

    .vs_ra {
        display: none;
    }

    .play_btn {
        display: block;
        width: 12px;
        height: 12px;
        position: absolute;
        top: 98px;
        left: 164px;
        z-index: 14;
        cursor: pointer;
        color: #fff;
        border: 0;
        background-color: transparent;
        font-weight: 900;
    }

    .play_btn:after {
        content: "| |";
    }

    .play_btn.active:after {
        content: "▶";
    }

    .page {
        clear: both;
        width: 100vw;
        height: 100vh;
        position: relative;
    }

    .page::after {
        content: "";
        display: block;
        width: 100%;
        clear: both;
    }

    .page_wrap {
        clear: both;
        width: 1200px;
        height: auto;
        margin: 0 auto;
    }

    .page_tit {
        font-size: 48px;
        text-align: center;
        padding-top: 1.75em;
    }

    #page1 {
        background-color: #f1f2f1;
        background-image: url("./images/bg_social_ptn01.png");
        background-position: 15vw 63vh;
        background-repeat: no-repeat;
    }

    .pic_lst {
        clear: both;
        width: 1200px;
        margin: 60px auto;
    }

    .pic_lst li {
        width: 280px;
        margin-right: 26px;
        height: 400px;
        float: left;
        background-repeat: no-repeat;
        background-position: center center;
        filter: brightness(90%);
        margin-top: 30px;
        transition: 0.4s;
        box-shadow: 12px 12px 12px #999;
        overflow: hidden;
    }

    .pic_lst li:hover {
        filter: brightness(140%);
        margin-top: -10px;
    }

    .pic_lst li a {
        display: block;
        width: 256px;
        height: 376px;
        margin: 11px;
        border: 1px solid #fff;
        color: #fff;
    }

    .pic_lst li:last-child {
        margin-right: 0;
    }

    .pic_lst li.item1 {
        background-image: url("./images/img_social_main01.jpg");
    }

    .pic_lst li.item2 {
        background-image: url("./images/img_social_main02.jpg");
    }

    .pic_lst li.item3 {
        background-image: url("./images/img_social_main03.jpg");
    }

    .pic_lst li.item4 {
        background-image: url("./images/img_social_main04.jpg");
    }

    .pic_com {
        padding-left: 20px;
        padding-top: 20px;
        font-size: 14px;
    }

    .pic_tit {
        padding-left: 20px;
        padding-top: 20px;
        font-size: 18px;
    }

    .pic_arrow {
        display: block;
        width: 110px;
        height: 10px;
        border-bottom: 1px solid #fff;
        margin-top: 20px;
        margin-left: -12px;
        transition: 0.4s;
        position: relative;
    }

    .pic_lst li:hover a .pic_arrow {
        margin-left: 20px;
    }

    .pic_arrow::after {
        content: "";
        display: block;
        width: 10px;
        height: 10px;
        position: absolute;
        right: 0;
        top: 0;
        border-bottom: 1px solid #fff;
        transform-origin: 100% 100%;
        transform: rotate(45deg);
        display: none;
    }

    .pic_lst li:hover a .pic_arrow::after {
        display: block;
    }

    #page2 .page_wrap {
        width: 100%;
    }

</style>

<style>
    /* 푸터 구역 스타일 */
</style>
