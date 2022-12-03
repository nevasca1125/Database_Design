<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="inquire/frameVer2.css">
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
                    <tr>
                        <td class="item">
                            <a href="inquire/inquireForm_customer.jsp" class="item">조회</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="register/registerForm.jsp" class="item">등록</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="delete/deleteForm.jsp" class="item">삭제</a>
                        </td>
                        <td class="slice"></td>
                    </tr>                    
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <tr>
                        <td>

                        </td>
                    </tr>
                </table>
            </div>
            <div id="bottom_div">
                <table id="bottom">
                </table>
            </div>
        </div>
        <script src="main.js"></script>
    </body>
</html>