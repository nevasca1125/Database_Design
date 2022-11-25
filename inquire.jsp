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
                        <td id="detail" style="color: rgb(151, 151, 151); padding-left: 10px">_detail</td>
                    </tr>
                </table>
            </div>
            <div id="menu_div">
                <table id="menu">
                    <tr> 
                        <td class="item">
                            <a href="#" id="one">하나</a>
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
                    </tr>  
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <td id="main">
                        <!--정보 표현 및 기타 조작 공간-->
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
