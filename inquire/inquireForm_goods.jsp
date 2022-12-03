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
                        <td id="detail" style="color: rgb(151, 151, 151); padding-left: 10px">_상품정보조회</td>
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
                            <a href="inquireForm_customer.jsp" id="customer_info" class="item">고객정보</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="inquireForm_goods.jsp" id="goods_info" class="item">상품정보</a>
                        </td>
                        <td class="slice"></td>
                    </tr>
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <tr>
                        <td style="vertical-align: top; height: 40px; table-layout: fixed">
                            <table style="padding-top: 20px">
                                <tr>
                                    <td class="item2">
                                        <a id="goods_card" style="color:blue; padding-left:25px">>카드상품조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="goods_account" style="color:blue; padding-left:25px">>계좌상품조회</a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="vertical-align: top">
                            <table style="padding:10px">
                                <tr id="main" style="padding-left:15px">
                                    <td>
                                        <h3 id="guide" style="padding-left: 8px">[카드상품조회]</h3>
                                        <table id="info_list">
                                            <tr>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_goods" id="item_goods" class="item3"> 상품명
                                                </td>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_type" id="item_type" class="item3"> 상품타입
                                                </td>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_target" id="item_target" class="item3"> 가입대상
                                                </td>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_interest" id="item_interest" class="item3"> 금리
                                                </td>
                                            </tr>
                                        </table>
                                        <h4 id="guide2" style="padding-left: 8px"></h4>
                                        <form name="form_inquire" method="post" action="goods_card_out.jsp" id="form_inquire">
                                            <p style="padding-left: 8px"><input type="submit" name="Submit" value="조회하기"></p>
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
        <script src="goods.js"></script>
    </body>
</html>