<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
				<html>

				<head>
					<title>MJU BANK</title>
					<link rel="stylesheet" href="../inquire/frameVer2.css"><!---->
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
						<table id="page">
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

	<h3  style="color: blue; padding-left: 15px">해당 카드가 정지 상태로 변경되었습니다.</h3>
	<br>
	<table border="1" style="text-align: center; border-color: blue; font-size: 15px;">
		<tr style="background:rgb(190, 190, 255)">
			<td width="140">상품명</td>
			<td width="100">상품타입</td>
			<td width="100">이름</td>
			<td width="160">주민번호</td>
			<td width="160">카드번호</td>
			<td width="100">유효기간</td>
			<td width="160">연결계좌번호</td>
			<td width="120">개설일자</td>
			<td width="100">누적금액</td>
			<td width="100">한도</td>
			<td width="100">상태</td>
			<td width="100">사유</td>
		</tr>
 
	<%
		String sql2 = "SELECT * FROM Card_List, (SELECT account as acc, name, customer.num_resident FROM Account_List, Customer WHERE owner=name and Account_List.num_resident=Customer.num_resident) WHERE account = acc and num_card=?";
		pstmt = conn.prepareStatement(sql2);
		pstmt.setString(1, num_card);
 
		rs = pstmt.executeQuery();
 
		while( rs.next() ) {

			String title = rs.getString("title");
			String type = rs.getString("type");
			String name = rs.getString("name");
			String number = rs.getString("num_resident");
			String num_card2 = rs.getString("num_card");
			String date_expiration = rs.getString("date_expiration");
			String account = rs.getString("account");
			String date_create = rs.getString("date_create");
			String cumulative = rs.getString("cumulative");
			String limit = rs.getString("limit");
			String state = rs.getString("state");
			String reason = rs.getString("reason");
			if(reason == null)
				reason = "";
			date_expiration = date_expiration.replace("00:00:00", "");
			date_create = date_create.replace("00:00:00", "");
	%>
				<tr>
					<td width="140"><%= title %></td>
					<td width="100"><%= type %></td>
					<td width="100"><%= name %></td>
					<td width="160"><%= num_card2 %></td>
					<td width="160"><%= number %></td>
					<td width="100"><%= date_expiration %></td>
					<td width="160"><%= account %></td>
					<td width="120"><%= date_create %></td>
					<td width="100"><%= cumulative %></td>
					<td width="100"><%= limit %></td>
					<td width="100"><%= state %></td>
					<td width="100"><%= reason %></td>
				</tr>
 
	<% 
		}
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
	} %>
	</table>
</td>
</table>
</div>
<div id="bottom_div">
<table id="bottom">
</table>
</div>

</body>
</html>
