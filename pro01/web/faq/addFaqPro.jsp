<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>

<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="com.chunjae.dto.Board" %>
<%@ page import="com.chunjae.db.*" %>
<%@ include file="/encoding.jsp" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    String question = request.getParameter("question");
    String answer = request.getParameter("answer");



    Connection conn = null;
    PreparedStatement pstmt = null;
    DBC dbcon = new MariaDBCon();
    conn = dbcon.connect();
    if (conn != null) {
        System.out.println("DB 연결 성공");
    }


    String sql = "insert into faq(question, answer) values (?, ?)";

    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, question);
    pstmt.setString(2, answer);


    int cnt = pstmt.executeUpdate();


    if(cnt > 0){
        out.println("<script>alert('질문 글 등록되었습니다');</script>");
        System.out.println("질문 글이 등록되었습니다.");
        // response.sendRedirect("/faq/faqList.jsp"); //바로 넘어가기 때문에 얼럿창xx
        out.println("<script>location.href='faqList.jsp'</script>");
    }  else {
        System.out.println("질문 및 답변 등록이 실패되었습니다.");
        //response.sendRedirect("/qna/addFaqPro.jsp?lev="+lev+"&par="+par);
        out.println("<script>history.go(-1)</script>");

    }

    dbcon.close(pstmt, conn);




%>