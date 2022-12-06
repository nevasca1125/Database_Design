<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>MJU BANK</title>
            <link rel="stylesheet" href="../frameVer2.css"><!---->
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
                        <tr id="main">
                            <td>
                                <h3 style="color: blue; padding-left: 15px">[고객정보 수정]</h3>
                                <%-- 주민등록번호와 가입날짜는 바뀌지 않아서 제외 --%>
                                <form name="form1" method="post" action="update.jsp">
                                    <%-- 입력 폼을 생성, 사용자로부터 입력받은 값을 updateTest.jsp로 전달 --%>
                                    <h4 style="padding-left: 15px">변경할 고객의 이름과 주민번호를 입력하세요.</h4>
                                    <p style="color:blue; padding-left:15px">이름 : <input type="text" name="name_find"></p>
                                    <p style="color:blue; padding-left:15px">주민번호 : <input type="text" name="number_find"></p>
                                    <br>

                                    <h4 style="padding-left: 15px">변경할 내용을 입력하세요.</h4>
                                    <p style="padding-left: 15px">생년월일 : <input type="text" name="date_birth"></p>
                                    <p style="padding-left: 15px">주소 : <input type="text" name="address"></p>
                                    <p style="padding-left: 15px">이메일 : <input type="text" name="email"></p>
                                    <p style="padding-left: 15px">전화번호 : <input type="text" name="phone"></p>
                                    <p style="padding-left: 15px">직업 : <input type="text" name="job"></p>
                                    <p style="padding-left: 15px">신용점수 : <input type="text" name="rate_credit"></p>
                                    <p style="padding-left: 15px"><input type="submit" name="Submit" value="변경"></p>
                                    <%-- 생년월일로 변경 대상 찾기 --%>
                                </form>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="bottom_div">
                    <table id="bottom">
                    </table>
                </div>
            </div>

        </body>

        </html>