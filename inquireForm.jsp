<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="frame.css">
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
                            <a href="#" id="home">home</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" id="customer_info">고객정보</a>
                        </td>
                        <td class="slice"></td>
                        <td class="item">
                            <a href="#" id="goods_info">상품정보</a>
                        </td>
                        <td class="slice"></td>
                    </tr>
                </table>
            </div>
            <div id="page_div">
                <table iid="page">
                    <tr>
                        <td style="vertical-align: top; height: 40px; table-layout: fixed">
                            <table style="padding-top: 20px">
                                <tr>
                                    <td class="item2">
                                        <a id="customer">고객조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="account">계좌조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="card">카드조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="transaction">거래내역조회</a>
                                    </td>
                                    <td class="item2">
                                        <a id="resmmitt">송금내역조회</a>
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
                                        <h4 id="guide">[고객조회]</h4>
                                        <form name="form_inquire" method="post" action="customer_out.jsp" id="form_inquire">
                                            <p id="input1">이름 :<input type=text name="name" id="name1"></p>
                                            <p><input typw="submit" name="Submit" value="조회하기"></p>
                                        </form>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
            <div id="bottom_div">
                <table id=""bottom">
                </table>
            </div>
        </div>
        <script src="inquire.js"></script>
    </body>
</html>