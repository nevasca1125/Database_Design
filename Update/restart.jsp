<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>카드 재개</title>

</head>


<body>
<%
	request.setCharacterEncoding("utf-8");

	// name 속성으로 전달받은 값  
    String num_card = request.getParameter("num_card"); // 정지 해제 대상 카드 번호

	Connection conn = null;
	PreparedStatement pstmt = null;
    ResultSet rs = null;

	try{
		Class.forName("oracle.jdbc.driver.OracleDriver");
	}catch(ClassNotFoundException cnfe){
		cnfe.printStackTrace();
		System.out.println("드라이버 로딩 실패");
	}
	try{
		String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
		String userId = "Bank";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);


		String restartSql = "UPDATE CARD_LIST SET (STATE, REASON) = (?, ?) WHERE NUM_CARD = ?"; 
        // 카드번호와 일치하는 카드의 STATE와 REASON 값 설정  
        pstmt = conn.prepareStatement(restartSql);
        pstmt.setString(1, "RUN");
        pstmt.setString(2, null); // 정지 사유 null로 변경
        pstmt.setString(3, num_card);

        pstmt.executeUpdate(); 
%>

	<p>해당 카드가 정지 해제되었습니다.</p>

<%

	}catch(SQLException e){
		e.printStackTrace();

		if(pstmt != null) {
			try {
				pstmt.close();
			}catch(SQLException sqle) {}
		}
		if(conn != null) {
			try {
				conn.close();
			}catch(SQLException sqle) {}
		}
	}
%>


</body>
</html>