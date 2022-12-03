<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>  
    <head>
        <title>MJU BANK</title>
        <link rel="stylesheet" href="../inquire/frameVer2.css">
        <link rel="stylesheet" href="../inquire.css">
    </head>
    <body>
        <div class="frame">
            <div id="top_div">
                <table id="top">
                    <tr>
                        <td id="title_th1">
                            <p id="img"><img src="../mju_logo.jpg" alt="mju_logo" width="45px"></p>
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
                    <!--정보 표현 및 기타 조작 공간-->
                    <td id="main">
                        <table id="register" width="500">

                            <H3 class="headItem" style="padding-left: 15px; color: blue">[은행탈퇴]</H3>

                            <!--고객탈퇴-->
                            <details> 
                                <summary style="padding-left: 15px;">고객탈퇴</summary>

                                <form name = "New_Customer" method="post" action="deleteUser.jsp">

                                    <p style="padding-left: 15px;">고객명<br><input type="text" name="userName"></p>
                                    <p style="padding-left: 15px;">고객 주민번호<br><input type="text" name="userID"></p>
                                    <input type="submit" value ="삭제하기" style="padding-left: 15px;">
                                
                                </form>

                            </details>
                            <br>
                            
                            <!--계좌 삭제-->
                            <details>
                                <summary style="padding-left: 15px;">계좌 삭제</summary>

                                <form name = "New_Account" method="post" action="deleteAcc.jsp">
                                    
                                    <p style="padding-left: 15px;">고객 계좌번호<br><input type="text" name="userAccount"></p>
                                    <input type="submit" value ="삭제하기" style="padding-left: 15px;">
                                  
                                </form>

                            </details>
                            <br>
                            
                            <!--카드 삭제-->
                            <details>
                                <summary style="padding-left: 15px;">카드 삭제</summary>

                                <form name = "New_card" method="post" action="deleteCard.jsp">

                                    <p style="padding-left: 15px;">카드번호<br><input type="text" name="cardNum"></p>
                                    <p style="padding-left: 15px;">연결계좌번호<br><input type="text" name="cardAccount"></p>
                                    <input type="submit" value ="삭제하기" style="padding-left: 15px;">
                                    
                                </form>

                            </details>
                            <br>

                            <!--자동이체 신청취소-->
                            <details>
                                <summary style="padding-left: 15px;">자동이체 신청취소</summary>

                                <form name = "New_AutoSend" method="post" action="deleteAuto.jsp">
                                
                                    <p style="padding-left: 15px;">신청 계좌번호<br><input type="text" name="sendAccount"></p>
                                    <p style="padding-left: 15px;">착금 계좌번호<br><input type="text" name="receiveAccount"></p>

                                    <input type="submit" value ="삭제하기" style="padding-left: 15px;">
                                    
                                </form>

                            </details>
                            <br>
                        </table>
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
