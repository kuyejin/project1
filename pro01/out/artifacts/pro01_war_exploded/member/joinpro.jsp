<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page import="com.chunjae.db.*" %>
<%@ page import="com.chunjae.dto.*" %>
<%@ include file="../encoding.jsp"%>

<%

    String id = request.getParameter("id");
    String pw = request.getParameter("pw");
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String tel = request.getParameter("tel");

    Connection conn = null;
    PreparedStatement pstmt = null;

    DBC con = new MariaDBCon();
    conn = con.connect();
    if(conn != null){
        System.out.println("DB 연결 성공");
    }
    int cnt = 0;

    try {
        String sql = "insert into member(id,pw,name,email,tel) values (?,?,?,?,?)";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, id);
        pstmt.setString(2, pw);
        pstmt.setString(3, pw);
        pstmt.setString(4, email);
        pstmt.setString(5, tel);

        cnt = pstmt.executeUpdate();

        if(cnt > 0){

            System.out.println("회원등록 완료!");
            //response.sendRedirect("/");
            out.println("<script>alert('회원 가입이 완료되었습니다');</script>");
            out.println("<script>location.href='/'</script>");

        } else {
            System.out.println("회원가입 실패");
            response.sendRedirect("/member/join.jsp");
        }
    } catch(SQLException e) {
        System.out.println("SQL 구문이 처리되지 못했습니다.");
    } finally {
        con.close(pstmt, conn);
    }
%>