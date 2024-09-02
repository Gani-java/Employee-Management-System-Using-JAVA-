<%@ page import="java.sql.*" %>
<%
    String leaveId = request.getParameter("leaveId");
    String action = request.getParameter("action");
    int status = 0;

    if ("approve".equals(action)) {
        status = 1;
    } else if ("reject".equals(action)) {
        status = 2;
    }

    Connection conn = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/ems", "root", "Gani@2000");

        String sql = "UPDATE leavetable SET status = ?, updated_on = NOW() WHERE id = ?";
        pstmt = conn.prepareStatement(sql);
        pstmt.setInt(1, status);
        pstmt.setString(2, leaveId);

        int result = pstmt.executeUpdate();
        if (result > 0) {
            response.sendRedirect("LeaveHistory.jsp");
        } else {
            out.println("Failed to update the leave request.");
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
        if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
    }
%>
