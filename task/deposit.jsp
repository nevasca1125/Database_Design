<%@ page contentType="text/html; charset=utf-8" %>
	<%@ page import="java.sql.*" %>

		<!DOCTYPE html>
		<html>

		<head>
			<title>MJU BANK</title>
			<link rel="stylesheet" href="../inquire/frameVer2.css">
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
						<% request.setCharacterEncoding("utf-8"); String account=request.getParameter("account"); // 입금할
							계좌번호 int amount=Integer.parseInt(request.getParameter("amount")); // 입금액 Connection
							conn=null; PreparedStatement pstmt=null; ResultSet rs=null; try{
							Class.forName("oracle.jdbc.driver.OracleDriver"); }catch(ClassNotFoundException cnfe){
							cnfe.printStackTrace(); System.out.println("드라이버 로딩 실패"); } 
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
							}
							%>

							<p>
								<%= amount %>원 입금 완료되었습니다.
							</p>


							<% }catch(SQLException e){
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
					</td>
					</table>
				</div>
				<div id="bottom_div">
					<table id="bottom">
					</table>
				</div>
			</body>

		</html>