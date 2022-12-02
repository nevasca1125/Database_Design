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
                        <td id="detail" style="color: rgb(151, 151, 151); padding-left: 10px">_고객정보조회</td>
                    </tr>
                </table>
            </div>
            <div id="menu_div">
                <table id="menu">
                    <tr> 
                        <td class="item">
                            <a href="inquireForm.jsp" id="home" class="item">HOME</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="inquireForm.jsp" class="item">고객정보</a>
                        </td>    
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" class="item">상품정보</a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" class="item"></a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" class="item"></a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" class="item"></a>
                        </td> 
                        <td class="slice"></td>  
                    </tr>  
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <tr>
                        <td style="padding-left: 15px; color: blue; font-size: 20px; height: 20px; padding-top: 15px">[계좌조회]</td>
                    </tr>
                    <tr>
                    <td id="main" style="padding: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <table id="result" border="1" style="text-align: center; border-color: blue;">
                            <tr style="background:rgb(190, 190, 255)">
                                <td width="100">상품명</td>
                                <td width="140">상품타입</td>
                                <td width="140">소유주</td>
                                <td width="160">주민번호</td>
                                <td width="160">계좌번호</td>
                                <td width="120">잔액</td>
                                <td width="100">생성일자</td>
                            </tr>
                            <%
                                request.setCharacterEncoding("utf-8");
                                String n = request.getParameter("name");
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
                                    
                                    String sql = "SELECT * FROM Account_List WHERE owner=?";
                            
                                    pstmt = conn.prepareStatement(sql);
                                    pstmt.setString(1, n);
                            
                                    rs = pstmt.executeQuery();
                                    while( rs.next() ) {
                                        String title = rs.getString("title");
                                        String type = rs.getString("type");
                                        String owner = rs.getString("owner");
                                        String number = rs.getString("num_resident");
                                        String account = rs.getString("account");
                                        String balance= rs.getString("balance");
                                        String create = rs.getString("date_create");
                                        create = create.replace("00:00:00", "");
                            %>
                                        <tr>
                                            <td width="100"><%= title %></td>
                                            <td width="140"><%= type %></td>
                                            <td width="140"><%= owner %></td>
                                            <td width="160"><%= number %></td>
                                            <td width="160"><%= account %></td>
                                            <td width="120"><%= balance %></td>
                                            <td width="100"><%= create %></td>
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