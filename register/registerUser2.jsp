<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="../inquire/frameVer2.css">
        <style>
            .a{
                border: 1px solid black;
                background-color: white;
            }
        </style>
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
                    
                    String name = request.getParameter("C_Name");
                    String newUserId = request.getParameter("C_UserId");
                    String userAddress = request.getParameter("C_Address");
                    String userBirth = request.getParameter("C_Birth");
                    String userEmail = request.getParameter("C_Email");
                    String userPhoneNum = request.getParameter("C_PhoneNum");
                    String userJob = request.getParameter("C_job");
                    int userCredit = Integer.parseInt(request.getParameter("C_credit"));
                    String userMakeDate = request.getParameter("C_makedate");

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
                        String userId = "class_a";
                        String userPass = "practice";
                
                        conn = DriverManager.getConnection(jdbcUrl, userId, userPass);
                    
                        String sql = "INSERT INTO Customer VALUES(?,?,?,?,?,?,?,?,?)";

                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1,name);
                        pstmt.setString(2,newUserId);
                        pstmt.setString(3,userAddress);
                        pstmt.setString(4, userBirth);
                        pstmt.setString(5,userEmail);
                        pstmt.setString(6,userPhoneNum);
                        pstmt.setString(7,userJob);
                        pstmt.setInt(8, userCredit);
                        pstmt.setString(9, userMakeDate);
                        pstmt.executeUpdate();

                    }finally{
                        if(pstmt != null) try{ pstmt.close(); } catch(SQLException ex){}
                        if(conn != null) try{conn.close();} catch(SQLException ex){}
                    }

                %>

                <td id="main">
                    <table id="AutoTable"style="
                    text-align: center;  
                    border: 2px solid black;
                    border-collapse: collapse;">
                        <%

                        PreparedStatement pstmtRS = null;
                        Connection con = null;
                        ResultSet rs = null;

                        String jdbcUrl = "jdbc:oracle:thin:@localhost:1521:xe";
                        String userId = "class_a";
                        String userPass = "practice";
                
                        con = DriverManager.getConnection(jdbcUrl, userId, userPass);

                        String sqlRS = "SELECT * FROM Customer";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        %>

                        <h2>신규 유저가입이 완료되었습니다.</h2>
                        <tr class="a">
                            <td class="a"width="60">고객명</td>
                            <td class="a"width="140">주민번호</td>
                            <td class="a"width="300">주소</td>
                            <td class="a"width="100">생년월일</td>
                            <td class="a"width="100">이메일</td>
                            <td class="a"width="150">전화번호</td>
                            <td class="a"width="50">직업</td>
                            <td class="a"width="70">신용등급</td>
                            <td class="a"width="100">개설일</td>
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
                            <td class="a" width="60"><%= username %></td>
                            <td class="a" width="140"><%= num_resident %></td>
                            <td class="a" width="300"><%= address %></td>
                            <td class="a" width="100"><%= date_birth %></td>
                            <td class="a" width="100"><%= email %></td>
                            <td class="a" width="150"><%= phone %></td>
                            <td class="a" width="50"><%= job %></td>
                            <td class="a" width="70"><%= rate_credit %></td>
                            <td class="a" width="100"><%= date_join %></td>                        </tr>
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
