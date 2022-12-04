<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
				<html>

				<head>
					<title>MJU BANK</title>
					<link rel="stylesheet" href="inquire/frameVer2.css">
				</head>

				<body>
					<div id="top_div">
						<table id="top">
							<tr>
								<td id="title_th1">
									<p id="img"><img src="../mju_logo.jpg" alt="mju_logo" width="45px"></p>
								</td>
								<td id="title_th2">
									<h3 id="title">MJU BANK</h3>
								</td>
							</tr>
						</table>
					</div>
					<div id="menu_div">
						<table id="menu">
							<td class="item">
								<a href="../mjuBank.jsp" class="item">Home</a>
							</td>
							<td class="slice"></td>
						</table>
					</div>
					<div id="page_div">
						<table id="page"></table>
						<td id="main">


<%
	request.setCharacterEncoding("utf-8");

	// name 속성으로 전달받은 값  
    String num_card = request.getParameter("num_card"); // 정지할 카드에 해당하는 '카드번호'
	String stopReason = request.getParameter("reason");  // 정지 사유

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
		String userId = "class_a";
		String userPass = "practice";

		conn = DriverManager.getConnection(jdbcUrl, userId, userPass);


		String stopSql = "UPDATE CARD_LIST SET STATE = ?, REASON = ? WHERE NUM_CARD = ?"; 
        // 카드번호와 일치하는 카드의 STATE와 REASON 값 설정  
        pstmt = conn.prepareStatement(stopSql);
        pstmt.setString(1, "stop");
        pstmt.setString(2, stopReason);
        pstmt.setString(3, num_card);

        pstmt.executeUpdate(); 
%>

	<p>해당 카드가 정지 상태로 변경되었습니다.</p>

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
</td>
</table>
</div>
<div id="bottom_div">
<table id="bottom">
</table>
</div>

</body>
</html>
