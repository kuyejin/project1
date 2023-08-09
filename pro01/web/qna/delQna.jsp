<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="java.util.Date" %>
<%@ include file="/encoding.jsp"%>
<%

    request.setCharacterEncoding("utf-8");
    response.setCharacterEncoding("utf-8");
    response.setContentType("text/html; charset=utf-8");
    /*getQna에서 qno='현재글번호', lev=0(질문) or lev=1(답변)을 보낸 것을 받는다*/
    int qno = Integer.parseInt(request.getParameter("qno"));
    int lev = Integer.parseInt(request.getParameter("lev"));

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC dbcon = new MariaDBCon(); // 마리아db 생성자 생성

    conn = dbcon.connect();  // 마리아db와 연결
    if (conn != null) {
        System.out.println("DB연결 성공");
    }


    String sql = "";

    if (lev == 0) {
        sql = "delete from qna where par=? "; // 질문과 답변 같이 삭제할 때(삭제대상 : 질문글)

    }else {
        sql = "delete from qna where qno=? "; // 답변만 삭제 할때 (삭제 대상 : 답변글)
    }

    pstmt = conn.prepareStatement(sql); //연결한 곳에 sql을 담는다.
    pstmt.setInt(1, qno);

    int cnt = pstmt.executeUpdate();

    if(cnt > 0){
        System.out.println("삭제 완료!");
        //response.sendRedirect("/qna/qnaList.jsp");
        out.println("<script>alert('삭제 되었습니다');</script>");
        out.println("<script>location.href='qnaList.jsp'</script>");


    }else {
        System.out.println("삭제 실패");
        //response.sendRedirect("/qna/getQna.jsp?qno=" + qno);
        out.println("<script>history.go(-1)</script>");
        out.println("<script>alert('삭제가 실패되었습니다.');</script>");
    }

    dbcon.close(pstmt, conn);

%>