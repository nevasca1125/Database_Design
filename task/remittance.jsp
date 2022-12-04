<%@ page contentType="text/html; charset=utf-8" %>
	<%@ page import="java.sql.*" %>
		<%@ page import="java.util.Date" %>
			<%@ page import="java.text.SimpleDateFormat" %>

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
						<tr>
						<td id="main">
							<%
							request.setCharacterEncoding("utf-8");
						
							// name 속성으로 전달받은 값  
							String postAccount = request.getParameter("postAccount"); // 돈을 보내는 계좌번호
						
							String getAccount = request.getParameter("getAccount");  // 송금 받는 계좌번호
							int amount = Integer.parseInt(request.getParameter("amount")); // 금액
						
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
						
						
								String postSql = "SELECT BALANCE FROM ACCOUNT_LIST WHERE ACCOUNT = ?"; 
								pstmt = conn.prepareStatement(postSql);
								pstmt.setString(1, postAccount); // 계좌번호를 통해 보내는 계좌를 탐색
						
								rs = pstmt.executeQuery();
						
								if(rs.next()) { // 보내는 계좌가 존재할 때
									int postBalance = rs.getInt("BALANCE");
									postSql = "UPDATE ACCOUNT_LIST SET BALANCE = ? WHERE ACCOUNT = ?";
									pstmt = conn.prepareStatement(postSql);
									pstmt.setInt(1,  postBalance - amount); // 보내는 금액만큼 차감
									pstmt.setString(2, postAccount);
									
									pstmt.executeUpdate(); 
								}
						
								String getSql = "SELECT BALANCE from ACCOUNT_LIST WHERE ACCOUNT = ?";
								pstmt = conn.prepareStatement(getSql);
								pstmt.setString(1, getAccount);
						
								rs = pstmt.executeQuery();
						
								if(rs.next()) { // ACCOUNT_LIST에 등록된 계좌로 송금할 때
									int getBalance = rs.getInt("BALANCE");
									getSql = "UPDATE ACCOUNT_LIST SET BALANCE = ? WHERE ACCOUNT = ?";
									pstmt = conn.prepareStatement(getSql);
									pstmt.setInt(1, getBalance + amount); // 받는 금액만큼 더하기
									pstmt.setString(2, getAccount);
						
									pstmt.executeUpdate();	
									
									
									String number_remittance = "SELECT dbms_random.string('X', 8) AS NUM_REMITTANCE FROM DUAL"; // 송금번호 생성
									pstmt = conn.prepareStatement(number_remittance);
									rs = pstmt.executeQuery();
									rs.next();
						
									ResultSet rsDate = null; // 송금 날짜용 
									String sysdate = "SELECT SYSDATE FROM DUAL";  
									pstmt = conn.prepareStatement(sysdate); 
									rsDate = pstmt.executeQuery(); // 날짜 생성(현재 날짜 기준)
									rsDate.next();
						
						
									// 송금내역에 추가
									String insertSql = "INSERT INTO DETAIL_REMITTANCE VALUES(?, ?, ?, ?, ?)";
									pstmt = conn.prepareStatement(insertSql);
						
									pstmt.setString(1, rs.getString("NUM_REMITTANCE")); // attribute 이름으로 송금번호 값 얻기
									pstmt.setString(2, postAccount); // 송금 계좌번호
									pstmt.setString(3, getAccount); // 착금 계좌번호 
									pstmt.setInt(4, amount); // 금액
									pstmt.setDate(5, rsDate.getDate("SYSDATE")); // 송금 날짜
						
									pstmt.executeUpdate();
								}
						%>
						
							
								<p style="color: blue; padding-left: 15px;"><%= amount %>원 송금되었습니다.</p>
								<p style="color: blue; padding-left: 15px;">송금 내역이 추가되었습니다.</p>
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
									String sql = "SELECT * FROM (SELECT name, num_resident as num FROM Customer), (SELECT * FROM Account_List WHERE account=? or account=?) WHERE name = owner and num=num_resident";
									pstmt = conn.prepareStatement(sql);
									pstmt.setString(1, postAccount);
									pstmt.setString(2, getAccount);

									rs = pstmt.executeQuery();

									while( rs.next() ) {

                                        String title = rs.getString("title");
                                        String type = rs.getString("type");
                                        String owner = rs.getString("owner");
                                        String number = rs.getString("num_resident");
                                        String account = rs.getString("account");
                                        String balance= rs.getString("balance");
                                        String create = rs.getString("date_create");
                                        create = create.replace("00:00:00", "");
								%>
									<tr>
										<td width="10"><%= title %></td>
										<td width="140"><%= type %></td>
										<td width="140"><%= owner %></td>
										<td width="160"><%= number %></td>
										<td width="160"><%= account %></td>
										<td width="120"><%= balance %></td>
										<td width="100"><%= create %></td>
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
							</tr>
						</table>
					</div>
					<div id="bottom_div">
						<table id="bottom">
						</table>
					</div>
				</body>
				</html>