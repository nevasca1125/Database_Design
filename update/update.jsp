<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

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
				<tr id="main">
					<td>
					<%
						request.setCharacterEncoding("utf-8");

						// name 속성으로 전달받은 값  
						String name_find = request.getParameter("name_find");
						String number_find = request.getParameter("number_find");

						String name = request.getParameter("name");  
						String date_birth = request.getParameter("date_birth"); // 생년월일(변경 대상 고객을 찾는 용도)
						String address = request.getParameter("address");
						String email = request.getParameter("email");
						String phone = request.getParameter("phone");
						String job = request.getParameter("job");
						String rate_credit = request.getParameter("rate_credit");

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

							
							String updateSql = "UPDATE CUSTOMER SET "; // TO_CHAR()를 통해 생년월일을 문자열로 바꿔서 date_birth와 비교
							
							int i = 0;
							if(name != ""){
								updateSql += "Name=?";
								i++;
							}
							if(date_birth != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Date_birth=?";
								i++;
							}
							if(address != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Address=?";
								i++;
							}
							if(email != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Email=?";
								i++;
							}
							if(phone != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Phone=?";
								i++;
							}
							if(job != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Job=?";
								i++;
							}
							if(rate_credit != ""){
								if(i!=0)
									updateSql += ",";
								updateSql += "Rate_credit=?";
								i++;
							}

							updateSql += "WHERE Name=? and num_resident=?";
							pstmt = conn.prepareStatement(updateSql);

							int n = 1;
							if(name!= ""){
								pstmt.setString(n, name);
								n++;
							}
							if(date_birth!=""){
								pstmt.setString(n, date_birth);
								n++;
							}
							if(address!=""){
								pstmt.setString(n, address);
								n++;
							}
							if(email!=""){
								pstmt.setString(n, email);
								n++;
							}
							if(phone!=""){
								pstmt.setString(n, phone);
								n++;
							}
							if(job!=""){
								pstmt.setString(n, job);
								n++;
							}
							if(rate_credit!=""){
								pstmt.setString(n, rate_credit);
								n++;
							}
							pstmt.setString(n, name_find);
							n++;
							pstmt.setString(n, number_find);
							n++;

							if(nmae != ""){
								String updateSql2 = "UPDATE Account_List SET name=? WHERE owner=name";
								PreparedStatement pstmt2 = conn.prepareStatement(updateSql2);
								pstmt2.setString(1, name);
								pstmt2.executeUpdate(); 
							}
								
							int result = pstmt.executeUpdate(); 
							
							String r;
							if(result != 0)
								r = "고객 정보를 변경했습니다.";
							else
								r = "해당하는 고객 정보가 없습니다.";
					%>

						<h3 style="color:blue; padding: 15px">[<%= r %>]</p>
						<br>
						<table border="1" style="text-align: center; border-color: blue; font-size: 15px;">
							<tr style="color:black; background:rgb(190, 190, 255)">
								<td width="100">이름</td>
								<td width="140">주민번호</td>
								<td width="260">주소</td>
								<td width="100">생일</td>
								<td width="160">이메일</td>
								<td width="120">전화번호</td>
								<td width="100">직업</td>
								<td width="100">신용점수</td>
								<td width="100">가입일</td>
							</tr>
								
							<%
								String sql = "SELECT * FROM Customer WHERE name=? and num_resident=?";
								pstmt = conn.prepareStatement(sql);
								if(name != "")
									pstmt.setString(1, name);
								else
									pstmt.setString(1, name_find);
								pstmt.setString(2, number_find);
								rs = pstmt.executeQuery();

								if(result != 0){
									while( rs.next() ) {
										String name_ = rs.getString("name");
										String num = rs.getString("num_resident");
										String add = rs.getString("address");
										String birth = rs.getString("date_birth");
										String email_ = rs.getString("email");
										String phone_ = rs.getString("phone");
										String job_ = rs.getString("job");
										String credit = rs.getString("rate_credit");
										String join = rs.getString("date_join");
										birth = birth.replace("00:00:00", "");
										join = join.replace("00:00:00", "");
							%>

							<tr style="color: black;">
								<td width="100"><%= name_ %></td>
								<td width="140"><%= num %></td>
								<td width="260"><%= add %></td>
								<td width="100"><%= birth %></td>
								<td width="160"><%= email_ %></td>
								<td width="120"><%= phone_ %></td>
								<td width="100"><%= job_ %></td>
								<td width="100"><%= credit %></td>
								<td width="100"><%= join %></td>
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
								}
							%>
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
