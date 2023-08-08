<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="../encoding.jsp"%>

<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    //2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();

    //3. SQL을 실행하여 Result(공지사항목록)을 가져오기
    String sql = "SELECT q.qno AS qno, q.title AS title, q.content AS content, q.author AS author, \n" +
            "q.resdate AS resdate,q.cnt AS cnt, q.lev AS lev, q.par AS par, m.name AS name\n" +
            "FROM qna q, member m WHERE q.author=m.id order BY q.par DESC, q.lev ASC, q.qno ASC;\n";
    pstmt = con.prepareStatement(sql);
    rs = pstmt.executeQuery();

    //4.가져온 목록을 boardList(공지사항목록)에 하나 씩 담기
    List<Qna> qnaList = new ArrayList<>();
    while(rs.next()){
        Qna qna = new Qna();
        qna.setQno(rs.getInt("qno"));
        qna.setTitle(rs.getString("title"));
        qna.setContent(rs.getString("content"));
        qna.setAuthor(rs.getString("author"));
        qna.setResdate(rs.getString("resdate"));
        qna.setCnt(rs.getInt("cnt"));
        qna.setLev(rs.getInt("lev"));
        qna.setPar(rs.getInt("par"));

        qnaList.add(qna);
    }
    conn.close(rs, pstmt, con);
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>묻고 답하기 목록</title>
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
                <p><a href="/">HOME</a> &gt; <a href="/qna/qnaList.jsp">질문 및 답변</a> &gt; <span>질문 및 답변 목록</span></p>
            </div>
            <section class="page" id="page1">
                <div class="page_wrap">
                    <h2 class="page_tit">QnA 목록</h2>
                    <hr>
                    <table class="tb1" id ="myTable">


                        <thead>
                        <th class="item1">글번호</th>
                        <th class="item2">글제목</th>
                        <th class="item3">작성자</th>
                        <th class="item4">작성일</th>
                        </thead>

                        <tbody>


                        <%
                        SimpleDateFormat ymd = new SimpleDateFormat("yy-MM-dd");
                        int tot = qnaList.size();
                        for(Qna q2:qnaList) {
                            Date d = ymd.parse(q2.getResdate());  //날짜데이터로 변경
                            String date = ymd.format(d);    //형식을 포함한 문자열로 변경
                        %>
                        <tr>
                            <td class="item1"><%=tot%></td>
                            <td class="item2">
                                <%--로그인 안한 -> 클릭 안되게 --%>
                                <% if(q2.getLev() == 0){ %>
                                    <a href="/qna/getQna.jsp?qno=<%=q2.getQno() %>"><%=q2.getTitle() %></a>
                                <% } else { %>
                                    <a style="padding-left: 28px;" href="/qna/getQna.jsp?qno=<%=q2.getQno() %>">[답변]<%=q2.getTitle() %></a>
                                <% } %>

                            </td>
                            <td class="item3"><%= q2.getAuthor()%></td>
                            <td class="item4"><%=date %></td>
                        </tr>
                        <%
                        tot--;
                        }
                        %>

                    </table>
                    <script>
                        $(document).ready( function () {
                            $('#myTable').DataTable({
                                order:[[0, "desc"]]
                            });
                        });
                    </script>


                    <a href="/qna/addQuestion.jsp" class="inbtn">글쓰기</a>

                   <% if(sid != null) {%>
                        <div class="btn_group">
                            <a href="/qna/addQuestion.jsp?lev=0&par=0" class="inbtn">질문하기</a>
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