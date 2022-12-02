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
                        <td style="padding-left: 15px; color: blue; font-size: 20px; height: 20px; padding-top: 15px">[카드조회]</td>
                    </tr>
                    <tr>
                    <td id="main" style="padding: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <table id="result" border="1" style="text-align: center; border-color: blue;">
                            <tr style="background:rgb(190, 190, 255)">
                                <td width="140">상품명</td>
                                <td width="120">상품타입</td>
                                <td width="100">이름</td>
                                <td width="160">주민번호</td>
                                <td width="160">카드번호</td>
                                <td width="100">유효기간</td>
                                <td width="160">연결계좌번호</td>
                                <td width="120">개설일자</td>
                                <td width="100">누적금액</td>
                                <td width="100">한도</td>
                                <td width="100">상태</td>
                                <td width="180">사유</td>
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
                                
                                String name_c = request.getParameter("name");
                                String number_c = request.getParameter("number_r");
                                String address_c = request.getParameter("address");
                                String phone_c = request.getParameter("phone");
                                String credit_c = request.getParameter("credit");                       
                                
                                String sql = "SELECT * FROM Card_List, (SELECT account as acc, name, num_resident FROM Account_List, (SELECT name, num_resident as num FROM Customer WHERE";
                                
                                if(name_c != null && name_c != "")
                                    sql += " name=?";
                                if(number_c != null && number_c != "")
                                    sql += " num_resident=?";
                                if(address_c != null && address_c != "")
                                    sql += " address=?";
                                if(phone_c != null && phone_c != "")
                                    sql += " phone=?";
                                if(credit_c != null && credit_c != "")
                                    sql += " rate_credit>?";

                                sql += ") WHERE owner=name and num_resident=num) WHERE account=acc";

                                pstmt = conn.prepareStatement(sql);
                                
                                int i = 1;
                                if(name_c != null && name_c != ""){
                                    pstmt.setString(i, name_c);
                                    i++;
                                }
                                if(number_c != null && number_c != ""){
                                    pstmt.setString(i, number_c);
                                    i++;
                                }
                                if(address_c != null && address_c != ""){
                                    pstmt.setString(i, address_c);
                                    i++;
                                }
                                if(phone_c != null && phone_c != ""){
                                    pstmt.setString(i, phone_c);
                                    i++;
                                }
                                if(credit_c != null && credit_c != ""){
                                    pstmt.setString(i, credit_c);
                                    i++;
                                }

                                if(i != 1)
                                    rs = pstmt.executeQuery();
                                else{
                                    Statement stmt = conn.createStatement();
                                    rs = stmt.executeQuery("SELECT * FROM Card_List, (SELECT account as acc, name, customer.num_resident FROM Account_List, Customer WHERE owner=name and Account_List.num_resident=Customer.num_resident) WHERE account = acc");
                                }

                                while( rs.next() ) {

                                    String title = rs.getString("title");
                                    String type = rs.getString("type");
                                    String name = rs.getString("name");
                                    String number = rs.getString("num_resident");
                                    String num_card = rs.getString("num_card");
                                    String date_expiration = rs.getString("date_expiration");
                                    String account = rs.getString("account");
                                    String date_create = rs.getString("date_create");
                                    String cumulative = rs.getString("cumulative");
                                    String limit = rs.getString("limit");
                                    String state = rs.getString("state");
                                    String reason = rs.getString("reason");
                                    if(reason == null)
                                        reason = "";
                                    date_expiration = date_expiration.replace("00:00:00", "");
                                    date_create = date_create.replace("00:00:00", "");
                            %>
                                        <tr>
                                            <td width="140"><%= title %></td>
                                            <td width="120"><%= type %></td>
                                            <td width="100"><%= name %></td>
                                            <td width="160"><%= num_card %></td>
                                            <td width="160"><%= number %></td>
                                            <td width="100"><%= date_expiration %></td>
                                            <td width="160"><%= account %></td>
                                            <td width="120"><%= date_create %></td>
                                            <td width="100"><%= cumulative %></td>
                                            <td width="100"><%= limit %></td>
                                            <td width="100"><%= state %></td>
                                            <td width="180"><%= reason %></td>
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