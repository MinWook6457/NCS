<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.sql.*"%>

<%
String sql = "SELECT p_id, c_name, c_email, c_tel FROM custom_01 ORDER BY p_id ASC";

String url = "jdbc:oracle:thin:@localhost:1521:xe";
String user = "minwook";
String password = "1111";

Connection con = null;
Statement stmt = null;
ResultSet rs = null;

try {
    Class.forName("oracle.jdbc.driver.OracleDriver");
    con = DriverManager.getConnection(url, user, password);
    stmt = con.createStatement();
    rs = stmt.executeQuery(sql);
%>

<head>
    <meta charset="UTF-8">
    <title>고객 목록 조회</title>
</head>

<body>
    <center>
        <h2>고객 목록 조회</h2>
        <table border="1" cellspacing="1">
            <tr>
                <th>고객ID</th>
                <th>고객명</th>
                <th>이메일</th>
                <th>전화번호</th>
            </tr>
            <%
            while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getString("p_id") %></td>
                <td><%= rs.getString("c_name") %></td>
                <td><%= rs.getString("c_email") %></td>
                <td><%= rs.getString("c_tel") %></td>
            </tr>
            <%
            }
            %>
        </table>
    </center>

<%
} catch (SQLException e) {
    e.printStackTrace();
%>
    <h3 style="color: red; text-align: center;">데이터 조회 중 오류가 발생했습니다.</h3>
<%
} finally {
    try {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    } catch (SQLException e) {
        e.printStackTrace();
    }
}
%>

</body>
