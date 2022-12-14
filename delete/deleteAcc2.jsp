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
                                        
                    String UserAccount = request.getParameter("userAccount");
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
                    
                        String sql = "DELETE FROM Account_List WHERE account=?";
                        pstmt = conn.prepareStatement(sql);
                        pstmt.setString(1, UserAccount);
                        
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

                        String sqlRS = "SELECT * FROM Account_List";
                        pstmtRS = con.prepareStatement(sqlRS);
                        
                        rs = pstmtRS.executeQuery();

                        String s;
                        if(result != 0)
                            s = "계좌 삭제가 완료되었습니다.";
                        else
                            s="해당하는 계좌가 없습니다.";
                        %>

                        <h2><%=s%></h2>
                        <tr style="background:rgb(190, 190, 255)">
                            <td class="a" width="100">계좌상품명</td>
                            <td class="a" width="100">계좌 타입</td>
                            <td class="a" width="60">고객명</td>
                            <td class="a" width="140">주민번호</td>
                            <td class="a" width="200">계좌번호</td>
                            <td class="a" width="100">계좌잔고</td>
                            <td class="a" width="100">계좌개설일</td>
                        </tr>
                        <% while(rs.next()){ 
                            String title = rs.getString("title");
                            String type = rs.getString("type");
                            String owner = rs.getString("owner");
                            String num_resident = rs.getString("num_resident");
                            String account = rs.getString("account");
                            int balance = rs.getInt("balance");
                            String date_create = rs.getString("date_create");
                            date_create = date_create.replace("00:00:00", "");
                        %>
                        <tr>
                            <td class="a" width="100"><%= title %></td>
                            <td class="a" width="100"><%= type %></td>
                            <td class="a" width="60"><%= owner %></td>
                            <td class="a" width="140"><%= num_resident %></td>
                            <td class="a" width="200"><%= account %></td>
                            <td class="a" width="100"><%= balance %></td>
                            <td class="a" width="100"><%= date_create %></td>                        </tr>
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
