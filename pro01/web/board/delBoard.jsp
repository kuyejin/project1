<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="java.util.Date" %>

<%

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");

    int bno = Integer.parseInt(request.getParameter("bno"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC dbcon = new MariaDBCon(); // 마리아db 생성자 생성

    conn = dbcon.connect();  // 마리아db와 연결
    if (conn != null) {
        System.out.println("DB연결 성공");
    }

    String sql = "delete from board where bno=? "; //사용할 sql구문 작성
    pstmt = conn.prepareStatement(sql); //연결한 곳에 sql을 담는다.

    pstmt.setInt(1, bno);

    int cnt = pstmt.executeUpdate();

    if(cnt > 0){
        System.out.println("삭제 완료!");
        response.sendRedirect("/board/boardList.jsp");
    }else {
        System.out.println("삭제 실패");
        response.sendRedirect("/board/getBoard.jsp?bno=" + bno);
    }

    dbcon.close(pstmt, conn);

%>