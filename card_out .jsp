<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="frame.css">
        <link rel="stylesheet" href="inquire.css">
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
                    <td id="main" style="padding: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <table id="result" border="1" style="text-align: center; border-color: blue;">
                            <tr>
                                <td width="100">이름</td>
                                <td width="140">주민번호</td>
                                <td width="260">주소</td>
                                <td width="100">생일</td>
                                <td width="140">이메일</td>
                                <td width="120">전화번호</td>
                                <td width="100">직업</td>
                                <td width="100">신용점수</td>
                                <td width="100">가입일</td>
                            </tr>
                            <%
                                request.setCharacterEncoding("utf-8");
                                String n = request.getParameter("name");
                                String r = request.getParameter("number_r");

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
                                    
                                    String sql = "SELECT * FROM Customer WHERE name=?";
                            
                                    pstmt = conn.prepareStatement(sql);
                                    pstmt.setString(1, n);
                            
                                    rs = pstmt.executeQuery();
                                    while( rs.next() ) {
                                        String name = rs.getString("name");
                                        String num = rs.getString("num_resident");
                                        String add = rs.getString("address");
                                        String birth = rs.getString("date_birth");
                                        String email = rs.getString("email");
                                        String phone = rs.getString("phone");
                                        String job = rs.getString("job");
                                        String credit = rs.getString("rate_credit");
                                        String join = rs.getString("date_join");

                                        birth = birth.replace("00:00:00", "");
                                        join = join.replace("00:00:00", "");
                                    
                            %>
                                        <tr>
                                            <td width="100"><%= name %></td>
                                            <td width="140"><%= num %></td>
                                            <td width="260"><%= add %></td>
                                            <td width="100"><%= birth %></td>
                                            <td width="140"><%= email %></td>
                                            <td width="120"><%= phone %></td>
                                            <td width="100"><%= job %></td>
                                            <td width="100"><%= credit %></td>
                                            <td width="100"><%= join %></td>
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
