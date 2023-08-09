<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="com.chunjae.dto.Faq" %>
<%@ include file="../encoding.jsp"%>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. SQL을 실행하여 Result(공지사항목록)을 가져오기
    String sql = "SELECT * FROM faq";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4.가져온 목록을 boardList(공지사항목록)에 하나 씩 담기
    List<Faq> faqList = new ArrayList<>();
    while(rs.next()){
        Faq f = new Faq();
        f.setFno(rs.getInt("fno"));
        f.setQuestion(rs.getString("question"));
        f.setAnswer(rs.getString("answer"));
        f.setCnt(rs.getInt("cnt"));


        faqList.add(f);
    }
    conn.close(rs, pstmt, con);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주하는 질문과 답변</title>
    <%@ include file="../head.jsp" %>

    <!-- 스타일 초기화 : reset.css 또는 normalize.css -->
    <link href="https://cdn.jsdelivr.net/npm/reset-css@5.0.1/reset.min.css" rel="stylesheet">

    <!-- 필요한 폰트를 로딩 : 구글 웹 폰트에서 폰트를 선택하여 해당 내용을 붙여 넣기 -->
    <link rel="stylesheet" href="../css/google.css">
    <link rel="stylesheet" href="../css/fonts.css">

    <!-- 필요한 플러그인 연결 -->
    <script src="https://code.jquery.com/jquery-latest.js"></script>
    <link rel="stylesheet" href="../css/common.css">
    <link rel="stylesheet" href="../css/hd.css">
    <%--페이징 처리--%>
    <link rel="stylesheet" href="../jquery.dataTables.css">
    <script src="../jquery.dataTables.js"></script>



    <style>
        /* 본문 영역 스타일 */
        .contents { clear:both; min-height:100vh;
            background-image: url("../images/bg_visual_overview.jpg");
            background-repeat: no-repeat; background-position:center -250px; }
        .contents::after { content:""; clear:both; display:block; width:100%; }

        .page { clear:both; width: 100vw; height: 100vh; position:relative; }
        .page::after { content:""; display:block; width: 100%; clear:both; }

        .page_wrap { clear:both; width: 1200px; height: auto; margin:0 auto; }
        .page_tit { font-size:48px; text-align: center; padding-top:1em; color:#fff;
            padding-bottom: 2.4rem; }

        .breadcrumb { clear:both;
            width:1200px; margin: 0 auto; text-align: right; color:#fff;
            padding-top: 28px; padding-bottom: 28px; }
        .breadcrumb a { color:#fff; }
        .frm { clear:both; width:1200px; margin:0 auto; padding-top: 80px; }


        .tb1 { width:800px; margin:50px auto; }
        .tb1 th { line-height:32px; padding-top:8px; padding-bottom:8px;
            border-top:1px solid #333; border-bottom:1px solid #333;
            background-color:deepskyblue; color:#fff; }
        .tb1 td {line-height:32px; padding-top:8px; padding-bottom:8px;
            border-bottom:1px solid #333;
            padding-left: 14px; border-top:1px solid #333; }

        .tb1 .item1 { width:10%; text-align: center; }
        .tb1 .item2 { width:65%; }
        .tb1 .item3 { width:10%; text-align: center; }
        .tb1 .item4 { width:15%; text-align: center; }

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:140px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px; }
        .inbtn:first-child { float:left; }
        .inbtn:last-child { float:right; }

        .inbtn2 { display:block;  border-radius:100px; float: left;
            width:60px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 24px; background-color: #333; color:#fff; font-size: 10px; }


        /*--------------------------------------------*/

        .faqlist{
            text-align: center;
            border:2px solid black;
            background-color:#fff;
            color:inherit;
            padding:30px;
            margin:50px auto;
            width: 500px;
        }

        .faqlist li{
            line-height:32px;
        }

        .ans{display: none;}


        .que::after { /* 제목 앞 화살표 */
            content: "▼";
            display: block;
            color: #a00;
            margin-right: 8px;
            float: right;
        }


    </style>

    <link rel="stylesheet" href="../css/ft.css">
    <style>
        .btn_group { clear:both; width:800px; margin:20px auto; }
        .btn_group:after { content:""; display:block; width:100%; clear: both; }
        .btn_group p {text-align: center;   line-height:3.6; }
    </style>

</head>
<body>

    <div class="container">
        <header class="hd" id="hd">
            <%@ include file="../header.jsp" %>
        </header>


        <div class="contents" id="contents">
            <div class="breadcrumb">
                <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">자주하는 질문&답변</a> &gt; <span>자주하는 질문&답변 목록</span></p>
            </div>

            <section class="page" id="page1">

                <div class="page_wrap">
                    <h2 class="page_tit">FAQ 목록</h2>
                    <hr>


                    <ul class="faqlist">
                        <%
                            for(Faq f2 : faqList){
                        %>

                        <li>

                            <div class="que" style="font-weight: bold"><%=f2.getQuestion() %></div>

                            <div class="ans"><%=f2.getAnswer() %><br><br>




                                <% if(sid.equals("admin")) {%>
                                <a href="/faq/updateFaq.jsp?qno=<%=f2.getFno()%>" class="inbtn2">질문수정</a>
                                <a href="/faq/delFaq.jsp?qno=<%=f2.getFno()%>" class="inbtn2">질문삭제</a><br>
                            <%} %>


                            </div>

                        </li>


                        <%
                            }
                        %>
                    </ul>



                    <script>

                        $(document).ready( function () {
                            $(".faqlist li").click( function () {
                                $(this).find(".ans").slideToggle(300);
                            });
                        });

                       /* $("faqlist li").click( function () {
                            $(this).find(".ans").slideToggle(500);
                        });*/
                    </script>

                    <% if(sid.equals("admin")) {%>
                    <div class="btn_group">
                        <%--질문할 때 lev = 0 , par = 0 으로 보내진다.--%>
                        <a href="/faq/addFaq.jsp" class="inbtn">추가하기</a>
                    </div>
                    <% } %>




                </div>
            </section>

        </div>


        <footer class="ft" id="ft">
            <%@ include file="../footer.jsp" %>
        </footer>
    </div>


</body>
</html>