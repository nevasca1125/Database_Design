<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>MJU BANK</title>
            <link rel="stylesheet" href="../frameVer2.css">
            <link rel="stylesheet" href="../inquireVer2.css">
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
                        <td id="main">
                        <p>Customer 테이블 레코드 변경</p>
                        <%-- 주민등록번호와 가입날짜는 바뀌지 않아서 제외 --%>
                            <form name="form1" method="post" action="update.jsp">
                                <%-- 입력 폼을 생성, 사용자로부터 입력받은 값을 updateTest.jsp로 전달 --%>
                                    <label>이름 <input type="text" name="name"></label>
                                    <label>생년월일(YY/MM/DD) <input type="text" name="date_birth"></label>
                                    <%-- 생년월일로 변경 대상 찾기 --%>
                                        <label>주소 <input type="text" name="address"></label>
                                        <label>이메일 <input type="text" name="email"></label>
                                        <label>전화번호 <input type="text" name="phone"></label>
                                        <label>직업 <input type="text" name="job"></label>
                                        <label>신용등급 <input type="text" name="rate_credit"></label>

                                        <label><input type="submit" name="Submit" value="변경"></label>
                            </form>
                        </td>
                    </table>
                </div>
                <div id="bottom_div">
                    <table id="bottom">
                    </table>
                </div>
            </div>

        </body>

        </html>