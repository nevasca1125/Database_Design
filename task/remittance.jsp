<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>

<!DOCTYPE html>
<html>
<head>
	<title>송금</title>

</head>


<body>
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
		String userId = "Bank";
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

    <%= amount %> <p>원 송금되었습니다.</p>
	<p>송금 내역이 추가되었습니다.</p>
	

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
