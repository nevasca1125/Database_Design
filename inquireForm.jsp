<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="frame.css">
        <link rel="stylesheet" href="inquire.css">
        <script src="inquire.js"></script>
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
                            <a href="#" class="item">HOME</a>
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
                        <td style="vertical-align: top; height: 40px">
                            <table  style="padding-top: 20px;">
                                <tr>
                                    <td class="item2">
                                        <a href="#" id="customer" style="color:blue; padding-left: 15px">고객조회</a>
                                    </td>
                                    <td class="item2">
                                        <a href="#" id="account"  style="color:blue; padding-left: 15px">계좌조회</a>
                                    </td>    
                                    <td class="item2">
                                        <a href="#" id="card"  style="color:blue; padding-left: 15px">카드조회</a>
                                    </td> 
                                    <td class="item2">
                                        <a href="#" id="transaction"  style="color:blue; padding-left: 15px">거래내역조회</a>
                                    </td> 
                                    <td class="item2">
                                        <a href="#" id="resmitt"  style="color:blue; padding-left: 15px">송금내역조회</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">
                            <table style="padding: 10px ">
                                <tr id="main" style="padding-left: 15px">
                                    <td>
                                        <!--정보 표현 및 기타 조작 공간-->
                                        <p id="guide">[고객조회] 이름과 주민번호를 입력하세요.</p>
                                        <form name="form_customer" method="post" action="customer_out.jsp" id="form">      
                                            <p>이름 : <input type="text" name="name"></p>
                                            <p><input type="submit" name="Submit" value="조회하기"></p>
                                        </form>
                                    </td>
                                </tr>
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
        <script src="inquire.js"></script>
    </body>
</html>
