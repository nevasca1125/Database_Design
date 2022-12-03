<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="frameVer2.css">
        <link rel="stylesheet" href="inquireVer2.css">
    </head>
    <body>
        <div class="frame">
            <div id="top_div">
                <table id="top">
                    <tr>
                        <td id="title_th1">
                            <p id="img"><img src="mju_logo.jpg" alt="mju_logo" width="45px"></p>
                        </td>
                        <td id="title_th2">
                            <h3 id="title">MJU BANK</h3>
                        </td>
                        <td id="detail" style="color: rgb(151, 151, 151); padding-left: 10px">_상품정보조회</td>
                    </tr>
                </table>
            </div>
            <div id="menu_div">
                <table id="menu">
                    <tr> 
                        <td class="item">
                            <a href="inquireForm_customer.jsp" id="home" class="item">HOME</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="inquireForm_customer.jsp" class="item">고객정보</a>
                        </td>    
                        <td class="slice"></td>
                        <td class="item">
                            <a href="inquireForm_goods.jsp" class="item">상품정보</a>
                        </td> 
                        <td class="slice"></td>
                    </tr>  
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <tr>
                        <td style="padding-left: 15px; color: blue; font-size: 20px; height: 20px; padding-top: 15px">[계좌상품조회]</td>
                    </tr>
                    <tr>
                    <td id="main" style="padding: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <table id="result" border="1" style="text-align: center; border-color: blue;">
                            <tr style="background:rgb(190, 190, 255)">
                                <td width="120">상품명</td>
                                <td width="120">상품타입</td>
                                <td width="100">최대한도</td>
                                <td width="100">가입대상</td>
                                <td width="80">금리</td>
                                <td width="80">우대금리</td>
                                <td width="380">내용</td>
                            </tr>
                            <%
                                request.setCharacterEncoding("utf-8");
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
                                    String userId = "class_a";
                                    String userPass = "practice";

                                    conn = DriverManager.getConnection(jdbcUrl, userId, userPass);

                                    String title_g = request.getParameter("title");   
                                    String type_g = request.getParameter("type");      
                                    String target_g = request.getParameter("target");   
                                    String interest_g = request.getParameter("interest");             
                                    
                                    String sql = "SELECT * FROM Goods_Account WHERE";
                                    
                                    if(title_g != null && title_g != "")
                                        sql += " title=?";
                                    if(type_g != null && type_g != "")
                                        sql += " type=?";
                                    if(target_g != null && target_g != "")
                                        sql += " target=?";
                                    if(interest_g != null && interest_g != "")
                                        sql += " rate_interest>?";

                                    pstmt = conn.prepareStatement(sql);
                                    
                                    int i = 1;
                                    if(title_g != null && title_g != ""){
                                        pstmt.setString(i, title_g);
                                        i++;
                                    }
                                    if(type_g != null && type_g != ""){
                                        pstmt.setString(i, type_g);
                                        i++;
                                    }
                                    if(target_g != null && target_g != ""){
                                        pstmt.setString(i, target_g);
                                        i++;
                                    }
                                    if(interest_g != null && interest_g != ""){
                                        pstmt.setString(i, interest_g);
                                        i++;
                                    }

                                    if(i != 1)
                                        rs = pstmt.executeQuery();
                                    else{
                                        Statement stmt = conn.createStatement();
                                        rs = stmt.executeQuery("SELECT * FROM Goods_Account");
                                    }

                                    
                                    while( rs.next() ) {
                                        String title = rs.getString("title");
                                        String type = rs.getString("type");
                                        String limit = rs.getString("limit");
                                        String target = rs.getString("target");
                                        String interest = rs.getString("rate_interest");
                                        String prefer = rs.getString("interest_prefer");
                                        String content = rs.getString("content");
                            %>
                                        <tr>
                                            <td width="120"><%= title %></td>
                                            <td width="120"><%= type %></td>
                                            <td width="100"><%= limit %></td>
                                            <td width="100"><%= target %></td>
                                            <td width="80"><%= interest %></td>
                                            <td width="80"><%= prefer %></td>
                                            <td width="380"><%= content %></td>
                                        </tr>
                            
                            <%
                                    }
                                }catch(SQLException e){
                                    e.printStackTrace();
                            
                                    if(rs != null) {
                                        try {
                                            rs.close();
                                        }catch(SQLException sqle) {} 
                                    }
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
                        </table>
                    </td>
                    </tr>
                </table>
            </div>
            <div id="bottom_div">
                <table id="bottom">
                </table>
            </div>
        </div>
        <script src="frame.js"></script>
    </body>
</html>