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
                                        
                    String Card_Number = request.getParameter("cardNum");
                    String Card_accountNum = request.getParameter("cardAccount");
                    
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
                    
                        String sql = "DELETE FROM Card_List WHERE num_card=? and account=?";

                        pstmt = conn.prepareStatement(sql);
                    
                        pstmt.setString(1,Card_Number);
                        pstmt.setString(2,Card_accountNum);

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

                        String sqlRS = "SELECT * FROM Card_List";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        %>

                        <h2>카드 삭제가 완료되었습니다.</h2>
                        <tr>
                            <td width="100">카드상품명</td>
                            <td width="100">카드타입</td>
                            <td width="100">카드번호</td>
                            <td width="100">만료날짜</td>
                            <td width="100">연결계좌</td>
                            <td width="100">생성날짜</td>
                            <td width="100">결제금액(달)</td>
                            <td width="100">한도</td>
                            <td width="100">상태</td>
                            <td width="100">정지사유</td>
                        </tr>
                        <% while(rs.next()){ 
                            String title = rs.getString("title");
                            String type = rs.getString("type");
                            String num_card = rs.getString("num_card");
                            String date_expiration = rs.getString("date_expiration");
                            String account = rs.getString("account");
                            String date_create = rs.getString("date_create");
                            String cumulative = rs.getString("cumulative");
                            String limit = rs.getString("limit");
                            String state = rs.getString("state");
                            String reason = rs.getString("reason");
                        %>
                        <tr>
                            <td width="100"><%= title %></td>
                            <td width="100"><%= type %></td>
                            <td width="100"><%= num_card %></td>
                            <td width="100"><%= date_expiration %></td>
                            <td width="100"><%= account %></td>
                            <td width="100"><%= date_create %></td>
                            <td width="100"><%= cumulative %></td>
                            <td width="100"><%= limit %></td>
                            <td width="100"><%= state %></td>
                            <td width="100"><%= reason %></td>
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