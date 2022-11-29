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
                                        
                    String UserAccount = request.getParameter("userAccount");
                    
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
                    
                        String sql = "DELETE FROM Account_List WHERE account=?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, UserAccount);
                        
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

                        String sqlRS = "SELECT * FROM Account_List";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        %>

                        <h2>계좌 삭제가 완료되었습니다.</h2>
                        <tr>
                            <td width="100">계좌상품명</td>
                            <td width="100">계좌 타입</td>
                            <td width="100">고객명</td>
                            <td width="100">주민번호</td>
                            <td width="100">계좌번호</td>
                            <td width="100">계좌잔고</td>
                            <td width="100">계좌개설일</td>
                        </tr>
                        <% while(rs.next()){ 
                            String title = rs.getString("title");
                            String type = rs.getString("type");
                            String owner = rs.getString("owner");
                            String num_resident = rs.getString("num_resident");
                            String account = rs.getString("account");
                            int balance = rs.getInt("balance");
                            String date_create = rs.getString("date_create");
                        %>
                        <tr>
                            <td width="100"><%= title %></td>
                            <td width="100"><%= type %></td>
                            <td width="100"><%= owner %></td>
                            <td width="100"><%= num_resident %></td>
                            <td width="100"><%= account %></td>
                            <td width="100"><%= balance %></td>
                            <td width="100"><%= date_create %></td>                        </tr>
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
