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
							String account=request.getParameter("account"); // 입금할
							int amount=Integer.parseInt(request.getParameter("amount")); // 입금액 
							Connection conn=null; 
							PreparedStatement pstmt=null; 
							ResultSet rs=null; 
							try{
								Class.forName("oracle.jdbc.driver.OracleDriver"); 
							}catch(ClassNotFoundException cnfe){
								cnfe.printStackTrace(); System.out.println("드라이버 로딩 실패"); 
							} 
							try{
							String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
							String userId = "class_a";
							String userPass = "practice";

							conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

							String sql = "SELECT BALANCE FROM ACCOUNT_LIST WHERE ACCOUNT = ?"; // 입금 계좌 잔액 불러오기
							pstmt = conn.prepareStatement(sql);
							pstmt.setString(1, account);
							rs = pstmt.executeQuery();

							if(rs.next()) { // 입금할 계좌가 존재할 경우
							String depositSql = "UPDATE ACCOUNT_LIST SET BALANCE = ? WHERE ACCOUNT = ?"; // 입금 계좌에 잔액 추가

							pstmt = conn.prepareStatement(depositSql);

							pstmt.setInt(1, rs.getInt("BALANCE") + amount);
							pstmt.setString(2, account);

							pstmt.executeUpdate();
							
							%>

							<h3 style="color: blue; padding-left: 15px">
								<%= amount %>원 입금 완료되었습니다.
							</h3>
							<br>
							<table border="1" style="text-align: center; border-color: blue; font-size: 15px;">
								<tr style="color:black; background:rgb(190, 190, 255)">
									<td width="100">상품명</td>
									<td width="140">상품타입</td>
									<td width="140">소유주</td>
									<td width="160">주민번호</td>
									<td width="160">계좌번호</td>
									<td width="120">잔액</td>
									<td width="100">생성일자</td>
								</tr>

							<%
								String sql2 = "SELECT * FROM (SELECT name, num_resident as num FROM Customer), (SELECT * FROM Account_List WHERE account=?) WHERE name = owner and num=num_resident";
								pstmt = conn.prepareStatement(sql2);
								pstmt.setString(1, account);

								rs = pstmt.executeQuery();

								while( rs.next() ) {

									String title = rs.getString("title");
									String type = rs.getString("type");
									String owner = rs.getString("owner");
									String number = rs.getString("num_resident");
									String account2 = rs.getString("account");
									String balance= rs.getString("balance");
									String create = rs.getString("date_create");
									create = create.replace("00:00:00", "");
							%>
								<tr>
									<td width="10"><%= title %></td>
									<td width="140"><%= type %></td>
									<td width="140"><%= owner %></td>
									<td width="160"><%= number %></td>
									<td width="160"><%= account2 %></td>
									<td width="120"><%= balance %></td>
									<td width="100"><%= create %></td>
								</tr>

							<% 
								}
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