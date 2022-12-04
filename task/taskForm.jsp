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
                        <td id="main" style="padding: 15px">
                            <div class="remittance">
                                <form name="form1" method="post" action="remittance.jsp">
                                    <h3 style="color: blue;">[송금]</h3>
                                    <label>보내는 계좌번호<input type="text" name="postAccount" style="padding-left: 10px"></label>
                                    <label style="padding-left: 20px">받는 계좌번호<input type="text" name="getAccount" style="padding-left: 10px"></label>
                                    <label style="padding-left: 20px">금액 <input type="text" name="amount" style="padding-left: 10px"></label>

                                    <label><input type="submit" name="Submit" value="송금"></label>
                                </form>
                            </div>
                            <hr>
                            <div class="deposit">
                                
                                <form name="form1" method="post" action="deposit.jsp">
                                    <h3 style="color: blue;">[입금]</h3>
                                    <label>계좌번호 입력<input type="text" name="account" style="padding-left: 10px"></label>
                                    <label style="padding-left: 20px">금액<input type="text" name="amount" style="padding-left: 10px"></label>

                                    <label><input type="submit" name="Submit" value="입금"></label>
                                </form>
                            </div>
                            <hr>
                            <div class="withdraw">
                                
                                <form name="form1" method="post" action="withdraw.jsp">
                                    <h3 style="color: blue;">[출금]</h3>
                                    <label>계좌번호 입력<input type="text" name="account" style="padding-left: 10px"></label>
                                    <label style="padding-left: 20px">금액<input type="text" name="amount" style="padding-left: 10px"></label>

                                    <label><input type="submit" name="Submit" value="출금"></label>
                                </form>
                            </div>
                            <hr>
                            <div class="stop">
                                
                                <form name="form1" method="post" action="stop.jsp">
                                    <h3 style="color: blue;">[카드 정지]</h3>
                                    <label>정지 대상 카드번호<input type="text" name="num_card" style="padding-left: 10px"></label>
                                    <label style="padding-left: 20px">정지 사유<input type="textarea" name="reason" style="padding-left: 10px"></label>

                                    <label><input type="submit" name="Submit" value="정지"></label>
                                </form>
                            </div>
                            <hr>
                            <div class="restart">
                                <form name="form1" method="post" action="restart.jsp">
                                    <h3 style="color: blue;">[카드 재개]</h3>
                                    <label>정지 해제할 카드번호 <input type="text" name="num_card" style="padding-left: 10px"></label>

                                    <label><input type="submit" name="Submit" value="카드 재개"></label>
                                </form>
                            </div>
                        </td>
                    </table>
                    <div id="bottom_div">
                        <table id="bottom">
                        </table>
                    </div>
                </div>
        </body>

        </html>