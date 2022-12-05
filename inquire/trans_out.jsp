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
                            <a href="../mjuBank.jsp" id="home" class="item">Home</a>
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
                        <td style="padding-left: 15px; color: blue; font-size: 20px; height: 20px; padding-top: 15px">[거래내역조회]</td>
                    </tr>
                    <tr>
                    <td id="main" style="padding: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <table id="result" border="1" style="text-align: center; border-color: blue;">
                            <tr style="background:rgb(190, 190, 255)">
                                <td width="160">거래번호</td>
                                <td width="160">카드번호</td>
                                <td width="100">소유주</td>
                                <td width="160">주민번호</td>
                                <td width="100">거래금액</td>
                                <td width="160">내역</td>
                                <td width="160">거래일자</td>
                                <td width="160">착금계좌</td>
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
                                
                                String sql = "SELECT * FROM Detail_Transaction, (SELECT num_card, name, num_resident as number_r FROM Card_List, (SELECT account as acc, name, num_resident FROM Account_List, (SELECT name, num_resident as num FROM Customer WHERE";
                                
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

                                sql += ") WHERE owner=name and num_resident=num) WHERE account=acc) WHERE card=num_card ORDER BY name, number_r, date_trans";

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
                                    rs = stmt.executeQuery("SELECT * FROM Detail_Transaction, (SELECT num_card, name, num_resident as number_r FROM Card_List, (SELECT account as acc, name, customer.num_resident FROM Account_List, Customer WHERE owner=name and Account_List.num_resident=Customer.num_resident) WHERE account = acc) WHERE card=num_card ORDER BY name, number_r, date_trans");
                                }

                                while( rs.next() ) {

                                    String number = rs.getString("number_transaction");
                                    String card = rs.getString("card");
                                    String name = rs.getString("name");
                                    String number_r = rs.getString("number_r");
                                    String amount = rs.getString("amount");
                                    String breakdown = rs.getString("breakdown");
                                    String date = rs.getString("date_trans");
                                    String account = rs.getString("account_dest");
                                    if(breakdown == null)
                                        breakdown = "";
                                    date = date.replace("00:00:00", "");
                            %>
                                        <tr>
                                            <td width="160"><%= number %></td>
                                            <td width="160"><%= card %></td>
                                            <td width="100"><%= name %></td>
                                            <td width="160"><%= number_r %></td>
                                            <td width="100"><%= amount %></td>
                                            <td width="160"><%= breakdown %></td>
                                            <td width="160"><%= date %></td>
                                            <td width="160"><%= account %></td>
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