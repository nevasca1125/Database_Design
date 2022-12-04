<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
	<title>고객 레코드 업데이트</title>

</head>


<body>
<%
	request.setCharacterEncoding("utf-8");

	// name 속성으로 전달받은 값  
	String name = request.getParameter("name");  
    String date_birth = request.getParameter("date_birth"); // 생년월일(변경 대상 고객을 찾는 용도)
	String address = request.getParameter("address");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String job = request.getParameter("job");
    int rate_credit = Integer.parseInt(request.getParameter("rate_credit"));

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

		
		String updateSql = "UPDATE CUSTOMER SET NAME = ?, ADDRESS = ?, EMAIL = ?, PHONE = ?, JOB = ?, RATE_CREDIT = ? WHERE TO_CHAR(DATE_BIRTH) = ?"; // TO_CHAR()를 통해 생년월일을 문자열로 바꿔서 date_birth와 비교
        
          
	    pstmt = conn.prepareStatement(updateSql);

        pstmt.setString(1, name);
        pstmt.setString(2, address);
        pstmt.setString(3, email);
        pstmt.setString(4, phone);
	    pstmt.setString(5, job);
		pstmt.setInt(6, rate_credit);

        pstmt.setString(7, date_birth); // 일치하는 생년월일의 고객에 대해 데이터 변경
                
        pstmt.executeUpdate(); 
	    
			
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