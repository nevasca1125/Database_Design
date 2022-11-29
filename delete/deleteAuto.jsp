<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="../frame.css">
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
                        <a href="#">하나</a>
                    </td>
                    <td class="slice"></td>
                    <td class="item">
                        <a href="#">둘</a>
                    </td>    
                    <td class="slice"></td>
                    <td class="item">
                        <a href="#">셋</a>
                    </td> 
                    <td class="slice"></td>
                    <td class="item">
                        <a href="#">넷</a>
                    </td> 
                    <td class="slice"></td>
                    <td class="item">
                        <a href="#">다섯</a>
                    </td> 
                    <td class="slice"></td>
                    <td class="item">
                        <a href="#">여섯</a>
                    </td> 
                    <td class="slice"></td>
                </ul>  
            </table>
        </div>
        <div id="page_div">
            <table id="page">
                <!--정보 표현 및 기타 조작 공간-->
                <%
                    request.setCharacterEncoding("utf-8");
                                        
                    String Auto_SendAccount = request.getParameter("sendAccount");
                    String Auto_ReceiveAccount = request.getParameter("receiveAccount");
                    
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
                    
                        String sql = "DELETE FROM Automatic WHERE account_src=? and account_dest=?";

                        pstmt = conn.prepareStatement(sql);
                    
                        pstmt.setString(1,Auto_SendAccount);
                        pstmt.setString(2,Auto_ReceiveAccount);

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

                        String sqlRS = "SELECT * FROM Automatic";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        %>

                        <h2>자동이체 신청 취소가 완료되었습니다.</h2>
                        <tr>
                            <td width="100">자동이체Id</td>
                            <td width="100">송금계좌</td>
                            <td width="100">입금계좌</td>
                            <td width="100">금액</td>
                            <td width="100">이체날짜(month)</td>
                            <td width="100">이체요일(week)</td>
                        </tr>
                        <% while(rs.next()){ 
                            String id = rs.getString("number_automatic");
                            String send = rs.getString("account_src");
                            String receive = rs.getString("account_dest");
                            String amount = rs.getString("amount");
                            String month = rs.getString("date_send");
                            String week = rs.getString("day_send");
                        %>
                        <tr>
                            <td width="100"><%= id %></td>
                            <td width="100"><%= send %></td>
                            <td width="100"><%= receive %></td>
                            <td width="100"><%= amount %></td>
                            <td width="100"><%= month %></td>
                            <td width="100"><%= week %></td>
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
