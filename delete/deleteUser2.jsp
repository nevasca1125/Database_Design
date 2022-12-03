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
            <table id="page">
                <!--정보 표현 및 기타 조작 공간-->
                <%
                    request.setCharacterEncoding("utf-8");
                    
                    String Name = request.getParameter("userName");
                    String UserId = request.getParameter("userID");
                    
                    Connection conn = null;
                    PreparedStatement pstmt = null;

                    try{
                        Class.forName("oracle.jdbc.driver.OracleDriver");
                    }catch(ClassNotFoundException cnfe){
                        cnfe.printStackTrace();
                        System.out.println("드라이버 로딩 실패");
                    }
                    try{
                        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
                        String userId = "chowon";
                        String userPass = "practice";
                
                        conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
                    
                        String sql = "DELETE FROM Customer WHERE name=? and num_resident=?";

                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1,Name);
                        pstmt.setString(2,UserId);
                        
                        pstmt.executeUpdate();

                    }finally{
                        if(pstmt != null) try{ pstmt.close(); } catch(SQLException ex){}
                        if(conn != null) try{conn.close();} catch(SQLException ex){}
                    }

                %>

                <td id="main">
                    <table id="AutoTable" border="1">
                        <%

                        PreparedStatement pstmtRS = null;
                        Connection con = null;
                        ResultSet rs = null;

                        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
                        String userId = "chowon";
                        String userPass = "practice";
                
                        con = DriverManager.getConnection(jdbcUrl, userId, userPass);

                        String sqlRS = "SELECT * FROM Customer";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        %>

                        <h2>유저탈퇴 처리가 완료되었습니다.</h2>
                        <tr>
                            <td width="100">고객명</td>
                            <td width="100">주민번호</td>
                            <td width="200">주소</td>
                            <td width="100">생년월일</td>
                            <td width="100">이메일</td>
                            <td width="100">전화번호</td>
                            <td width="100">직업</td>
                            <td width="100">신용등급</td>
                            <td width="100">개설일</td>
                        </tr>
                        <% while(rs.next()){ 
                            String username = rs.getString("name");
                            String num_resident = rs.getString("num_resident");
                            String address = rs.getString("address");
                            String date_birth = rs.getString("date_birth");
                            String email = rs.getString("email");
                            String phone = rs.getString("phone");
                            String job = rs.getString("job");
                            int rate_credit = rs.getInt("rate_credit");
                            String date_join = rs.getString("date_join");
                        %>
                        <tr>
                            <td width="100"><%= username %></td>
                            <td width="100"><%= num_resident %></td>
                            <td width="100"><%= address %></td>
                            <td width="100"><%= date_birth %></td>
                            <td width="100"><%= email %></td>
                            <td width="100"><%= phone %></td>
                            <td width="100"><%= job %></td>
                            <td width="100"><%= rate_credit %></td>
                            <td width="100"><%= date_join %></td>                        </tr>
                        <% } %>
                    </table>
                </td>

                <script>
                    alert("저장성공!");
                </script>
            </table>
        </div>
        <div id="bottom_div">
            <table id="bottom">
            </table>
        </div>
    </body>
</html>
