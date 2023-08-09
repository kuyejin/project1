<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%-- 1. 필요한 sql, db 패키지 임포트 --%>
<%@ page import="java.sql.*" %>
<%@ page import="com.chunjae.db.*" %>
<%
    /* 2. 인코딩 설정 및 보내온 데이터 받아오기 */
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=UTF-8");
    response.setCharacterEncoding("UTF-8");

    int qno = Integer.parseInt(request.getParameter("qno"));
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    Connection conn = null;
    PreparedStatement pstmt = null;

    /* 3. DB 연결 */
    DBC con = new MariaDBCon();
    conn = con.connect();
    if (conn != null) {
        System.out.println("DB연결 성공");
    }

    /* 4. SQL을 실행하여 처리된 건수 반환받기 */
    String sql = "update qna set title=?, content=? where qno=?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, qno);
    int cnt = pstmt.executeUpdate();

    /* 5. 처리된 건수가 0보다 크면(성공처리가 되었으면) 목록 페이지로 이동하고,
    아니면(실패처리가 되었으면), 수정할 폼 화면으로 이동한다. */
    if(cnt>0){
        //response.sendRedirect("/qna/qnaList.jsp");
        out.println("<script>alert('글이 수정되었습니다');</script>");
        out.println("<script>location.href='qnaList.jsp'</script>");
    } else {
        response.sendRedirect("/qna/updateQna.jsp?bno="+qno);
    }
    con.close(pstmt, conn);
%>