<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");

String p_id = request.getParameter("pId");
String p_pw = request.getParameter("pPw");
String c_name = request.getParameter("cName");
String c_email = request.getParameter("cEmail");
String c_tel = request.getParameter("cTel");

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "minwook";
String password = "1111";

String sql = "INSERT INTO custom_01 VALUES(?, ?, ?, ?, ?)";

int result = 0;
Connection con = null;
PreparedStatement pstmt = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(url, user, password);
    pstmt = con.prepareStatement(sql);
        
    pstmt.setString(1, p_id);
    pstmt.setString(2, p_pw);
    pstmt.setString(3, c_name);
    pstmt.setString(4, c_email);
    pstmt.setString(5, c_tel);
    
    result = pstmt.executeUpdate();
} catch(SQLException e) {
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) pstmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>    

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>고객 등록 결과</title>
</head>
<body>
    <div>
        <h2>고객 등록 결과</h2>
        <div style="text-align:center;">
            <% if(result > 0) { %>
                <h2><%= p_id %>님이 등록되었습니다.</h2>
            <% } else { %>
                <h2>오류가 발생했습니다. 관리자에게 문의하세요.</h2>
            <% } %>
        </div>
    </div>
</body>
</html>
