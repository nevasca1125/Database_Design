<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
	<title>출금</title>

</head>


<body>
<%
	request.setCharacterEncoding("utf-8");

	// name 속성으로 전달받은 값  
	String account = request.getParameter("account);  // 출금할 계좌번호
    int amount = request.getParameter("amount"); // 출금액

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

        String sql = "SELECT BALANCE FROM ACCOUNT_LIST WHERE ACCOUNT = ?"; // 입력된 계좌번호를 통해 계좌 잔액 불러오기
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, account);
        rs = pstmt.executeQuery();
        
		if(rs.next()) { // 출금할 계좌가 존재할 경우 
 		String withdrawSql = "UPDATE ACCOUNT_LIST SET BALANCE = ? WHERE ACCOUNT = ?"; // 금액만큼 계좌 잔액 차감
        
	    pstmt = conn.prepareStatement(withdrawSql);

        int BALANCE = rs.getInt("BALANCE");
        if(BALANCE < amount) { // 잔액이 부족할 경우
            <p>잔액이 부족합니다.</p>
            return;
        }

        pstmt.setInt(1, BALANCE - amount); 
        pstmt.setString(2, account);
                
        pstmt.executeUpdate(); 
        }
        		
%>

    <%= name %>
	<p> 고객 정보를 변경했습니다.</p>
	

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
