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
                                        
                    String Auto_SendAccount = request.getParameter("sendAccount");
                    String Auto_ReceiveAccount = request.getParameter("receiveAccount");
                    int result = 0;
                    
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
                    
                        String sql = "DELETE FROM Automatic WHERE account_src=? and account_dest=?";

                        pstmt = conn.prepareStatement(sql);
                    
                        pstmt.setString(1,Auto_SendAccount);
                        pstmt.setString(2,Auto_ReceiveAccount);

                        result = pstmt.executeUpdate();
                        
                    }finally{
                        if(pstmt != null) try{ pstmt.close(); } catch(SQLException ex){}
                        if(conn != null) try{conn.close();} catch(SQLException ex){}
                    }

                %>
                <td id="main">
                    <table id="AutoTable" style="
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

                        String sqlRS = "SELECT * FROM Automatic";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        String s;
                        if(result != 0)
                            s = "자동이체 신청 취소가 완료되었습니다.";
                        else
                            s="해당하는 카드가 없습니다.";
                        %>

                        <h2><%=s%></h2>
                        <tr style="background:rgb(190, 190, 255)">
                            <td class="a" width="100">자동이체Id</td>
                            <td class="a" width="200">송금계좌</td>
                            <td class="a" width="200">입금계좌</td>
                            <td class="a" width="80">금액</td>
                            <td class="a" width="80">이체날짜(month)</td>
                            <td class="a" width="80">이체요일(week)</td>
                        </tr>
                        <% while(rs.next()){ 
                            String id = rs.getString("number_automatic");
                            String send = rs.getString("account_src");
                            String receive = rs.getString("account_dest");
                            String amount = rs.getString("amount");
                            String month = rs.getString("date_send");
                            String week = rs.getString("day_send");
                            if(month == null)
                                month = "";
                            if(week == null)
                                week = "";
                        %>
                        <tr>
                            <td class="a" width="100"><%= id %></td>
                            <td class="a" width="200"><%= send %></td>
                            <td class="a" width="200"><%= receive %></td>
                            <td class="a" width="80"><%= amount %></td>
                            <td class="a" width="80"><%= month %></td>
                            <td class="a" width="80"><%= week %></td>
                        </tr>
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
