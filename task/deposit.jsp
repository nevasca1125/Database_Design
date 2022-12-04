<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>입금</title>

</head>


<body>
<%
	request.setCharacterEncoding("utf-8");

	String account = request.getParameter("account");  // 입금할 계좌번호
    int amount = Integer.parseInt(request.getParameter("amount")); // 입금액
    
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

    <p><%= amount %>원 입금 완료되었습니다.</p>
	

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
