<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.vo.*" %>
<%@ include file="/encoding.jsp"%>
<%
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    int qno = Integer.parseInt(request.getParameter("qno"));

    // 2. DB 연결하기
    DBC conn = new MariaDBCon();
    con = conn.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }

    //3. SQL을 실행하여 Result(공지사항 한 레코드)을 가져오기
    String sql = "SELECT * FROM qnalist WHERE qno=? ";
    pstmt = con.prepareStatement(sql);
    pstmt.setInt(1, qno);

    rs = pstmt.executeQuery();

    //4. 가져온 한 레코드를 하나의 Board 객체에 담기
    Qna q = new Qna();
    if(rs.next()){
        q.setQno(rs.getInt("qno"));
        q.setTitle(rs.getString("title"));
        q.setContent(rs.getString("content"));
        q.setAuthor(rs.getString("author"));
        q.setName(rs.getString("name"));
        q.setResdate(rs.getString("resdate"));
        q.setCnt(rs.getInt("cnt"));
        q.setLev(rs.getInt("lev"));
        q.setPar(rs.getInt("par"));

    }
    conn.close(rs, pstmt, con);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>QaA 상세보기</title>

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

        .indata { display:inline-block; width:300px; height: 48px; line-height: 48px;
            text-indent:14px; font-size:18px; }
        .inbtn { display:block;  border-radius:100px;
            min-width:100px; padding-left: 24px; padding-right: 24px; text-align: center;
            line-height: 48px; background-color: #333; color:#fff; font-size: 18px;
            float:left; margin-right: 20px; }
        .inbtn:last-child { float:right; }
    </style>

    <link rel="stylesheet" href="../css/ft.css">
    <style>

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
                <h2 class="page_tit">질문 및 답변 목록</h2>
                <hr>
                <!-- 5. Board 객체의 내용을 출력 -->
                <table class="tb1" id="myTable">
                    <tbody>

                    <th> 유형</th>
                    <td>

                        <% if(q.getLev()==0){%>
                        <span>질문</span>
                        <%} else  {%>
                        <span>답변</span>
                        <%}%>

                    </td>

                    <tr>
                        <th>글 번호</th>
                        <td><%=q.getQno()%></td>
                    </tr>
                    <tr>
                        <th>글 제목</th>
                        <td><%=q.getTitle() %></td>
                    </tr>
                    <tr>
                        <th>글 내용</th>
                        <td>
                            <%=q.getContent() %>
                        </td>
                    </tr>
                    <tr>
                        <th>작성자</th>
                        <td>
                            <% if(sid!=null && sid.equals("admin")) {%>
                              <span title="<%=q.getAuthor()%>"><%=q.getName()%></span>
                            <% } %>
                    </tr>
                    <tr>
                        <th>작성일시</th>
                        <td><%=q.getResdate() %></td>
                    </tr>
                    <tr>
                        <th>조회수</th>
                        <td><%=q.getCnt() %></td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <%--
                            * 용도별 버튼 링크 추가
                            현재 글이 질문 글 -> 로그인 한 사람만 답변하기,
                            질문한 사람만 질문글 수정, 질문글 삭제
                            답변을 등록한 사람(관리자 포함) 답변 글 삭제, 답변 글 수정
                            --%>
                            <%--모든 사용자 -> 목록 버튼 추가--%>



                            <% if(q.getLev() == 0){%>
                                <% if(sid != null ) {%>
                                <a href="/qna/addQuestion.jsp?lev=1&&par=<%=q.getQno()%>" class="inbtn">답변하기</a>
                            <% } %>


                                <% if(sid != null && (sid.equals("admin") || sid.equals(q.getAuthor()))) {%>
                                     <a href="/qna/updateQna.jsp?qno=<%=q.getQno()%>" class="inbtn">질문수정</a>
                                     <a href="/qna/delQna.jsp?qno=<%=q.getQno()%>" class="inbtn">질문삭제</a>
                                <%} %>

                            <%} else {%>
                                <% if(sid != null && (sid.equals("admin") || sid.equals(q.getAuthor()))) {%>
                                <a href="/qna/updateQna.jsp?qno=<%=q.getQno()%>" class="inbtn">답변수정</a>
                                <a href="/qna/delQna.jsp?qno=<%=q.getQno()%>" class="inbtn">답변삭제</a>
                                <%} %>
                            <% } %>

                            <a href="/qna/qnaList.jsp" class="inbtn">글 목록</a>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </div>
    <footer class="ft" id="ft">
        <%@ include file="../footer.jsp" %>
    </footer>
</div>
</body>
</html>