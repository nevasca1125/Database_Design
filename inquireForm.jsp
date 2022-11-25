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
                            <a href="#" id="home">HOME</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="inquireForm.jsp" id="inquire_customer">고객정보</a>
                        </td>    
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#">상품정보</a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#"></a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#"></a>
                        </td> 
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#"></a>
                        </td> 
                        <td class="slice"></td>  
                    </tr>  
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <td id="main" style="padding-left: 15px">
                        <!--정보 표현 및 기타 조작 공간-->
                        <p>[고객정보 조회] 이름과 주민번호를 입력하세요.</p>
                        <form name="form_customer" method="post" action="inquireOut.jsp">
                            <p>이름 : <input type="text" name="name"></p>
                            <p>주민번호 : <input type="text" name="number_r"></p>
                            <p>조회정보 : <input type="text" name="info"></p>
                            <p><input type="submit" name="Submit" value="조회하기"></p>
                        </form>
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
