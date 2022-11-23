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
        <div id="top_div">
            <table id="top">
                <tr>
                    <td id="title_th1">
                        <p id="img"><img src="mju_logo.jpg" alt="mju_logo" width="45px"></p>
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
                        <a href="test.jsp">하나</a>
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
                <td id="main">
                    <table id="test" width="500" border="1">
                        <tr>
                            <td width="100">아이디</td>
                            <td width="100">이름</td>
                            <td width="100">학과명</td>
                            <td width="100">이수학점</td>
                        </tr>
                        <%
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
                                
                                String sql = "SELECT * FROM student";
                        
                                pstmt = conn.prepareStatement(sql);
                        
                                rs = pstmt.executeQuery();
                                while( rs.next() ) {
                                    String id = rs.getString("ID");
                                    String name = rs.getString("NAME");
                                    String dept = rs.getString("DEPT_NAME");
                                    int tot = rs.getInt("TOT_CRED");
                        %>
                            <tr>
                                <td width="100"><%= id %></td>
                                <td width="100"><%= name %></td>
                                <td width="100"><%= dept %></td>
                                <td width="100"><%= tot %></td>
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
    </body>
</html>
