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
                        <td id="title_td1">
                            <p id="img"><img src="mju_logo.jpg" alt="mju_logo" width="45px"></p>
                        </td>
                        <td id="title_td2">
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
                            <a id="home" class="item">Home</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a id="customer_info" class="item">고객정보</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a id="goods_info" class="item">상품정보</a>
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
                                        <a id="customer" style="color:blue; padding-left:25px">>고객조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="account" style="color:blue; padding-left:15px">>계좌조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="card" style="color:blue; padding-left:15px">>카드조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="transaction" style="color:blue; padding-left:15px">>거래내역조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="resmitt" style="color:blue; padding-left:15px">>송금내역조회</a>
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
                                        <h3 id="guide" style="padding-left: 8px">[고객조회]</h3>
                                        <table id="info_list">
                                            <tr>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_name" id="item_name" class="item3"> 이름
                                                </td>
                                                <td class="item3">
                                                    <input type="checkbox" name="item_number" id="item_number" class="item3"> 주민번호
                                                </td>
                                            </tr>
                                        </table>
                                        <h4 id="guide2" style="padding-left: 8px">조회할 고객의 정보를 입력해주세요.</h4>
                                        <form name="form_inquire" method="post" action="customer_out.jsp" id="form_inquire">
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
        <script src="inquire_form.js"></script>
    </body>
</html>