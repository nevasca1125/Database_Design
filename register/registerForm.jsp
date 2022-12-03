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

                            <H3 class="headItem" style="padding-left: 15px; color: blue">[등록]</H3>

                            <!--신규고객가입-->
                            <details> 
                                <summary style="padding-left: 15px;">신규 고객가입</summary>

                                <form name = "New_Customer" method="post" action="registerUser2.jsp">

                                    <p style="padding-left: 15px;" >고객명 <br><input type="text" name="C_Name"> </p>
                                    <p style="padding-left: 15px;" >주민번호 <br><input type="text" name="C_UserId" pattern="\d{6}\-\d{7}" title = "123456-1234567 형식으로 입력해주세요."></p>
                                    <p style="padding-left: 15px;" >주소 <br><input type="text" name="C_Address"></p>
                                    <p style="padding-left: 15px;" >생년월일 <br><input type="text" name="C_Birth"></p>
                                    <p style="padding-left: 15px;" >이메일<br> <input type="text" name="C_Email"></p>
                                    <p style="padding-left: 15px;" >전화번호 <br><input type="text" name="C_PhoneNum"></p>
                                    <p style="padding-left: 15px;" >직업 <br><input type="text" name="C_job"></p>
                                    <p style="padding-left: 15px;" >신용점수 <br><input type="text" name="C_credit"></p>
                                    <p style="padding-left: 15px;" >개설일 <br><input type="text" name="C_makedate"></p>
                                    <p style="padding-left: 15px;" ><input type="submit" name="new_customer_submit" value="가입"></p>
                                
                                </form>

                            </details>
                            <br>
                            
                            <!--계좌 상품가입-->
                            <details>
                                <summary style="padding-left: 15px;">계좌 상품가입</summary>

                                <form name = "New_Account" method="post" action="registerAcc2.jsp">

                                    <label style="padding-left: 15px;" for = "account_type">계좌 타입<br></label>
                                    <select style="padding-left: 15px;" id="account_type" name="account_type" size="1">
                                        <option value="">계좌 타입</option>
                                        <option value="예금, 보통">예금, 보통</option>
                                        <option value="적금, 정기">적금, 정기</option>
                                        <option value="적금, 자유">적금, 자유</option>
                                        <option value="대출">대출</option>
                                    </select><br>
                                    <p></p>                               
                                    <label style="padding-left: 15px;" for = "account_goods">계좌 상품명<br></label>
                                    <select style="padding-left: 15px;" id="account_goods" name="account_goods" size="1">
                                        <option value="">상품명</option>
                                        <option value="직장인예금">직장인예금</option>
                                        <option value="명지은행예금">명지은행예금</option>
                                        <option value="명지사랑적금">명지사랑적금</option>
                                        <option value="대학생적금">대학생적금</option>
                                        <option value="명지대출통장">명지대출통장</option>
                                    </select><br>
                                
                                    <p style="padding-left: 15px;">고객명 <br><input type="text" name="account_userName"> </p>
                                    <p style="padding-left: 15px;">주민번호 <br><input type="text" name="account_UserId" pattern="\d{6}\-\d{7}" title = "123456-1234567 형식으로 입력해주세요."> </p>
                                    <p style="padding-left: 15px;">계좌번호 <br><input type="text" name="account_Num" pattern="\d{6}\-\d{2}\-\d{6}" title="123456-12-123456 형식으로 입력해주세요."> </p>
                                    <p style="padding-left: 15px;">입금금액 <br><input type="text" name="account_send"> </p>
                                    <p style="padding-left: 15px;">개설일 <br><input type="text" name="account_opendate"> </p>
                                    <p style="padding-left: 15px;"><input type="submit" name="new_Account_submit" value="가입"></p>

                                </form>

                            </details>
                            <br>
                            
                            <!--카드 신청-->
                            <details>
                                <summary style="padding-left: 15px;">카드 신청</summary>

                                <form name = "New_card" method="post" action="registerCard2.jsp">

                                    <label style="padding-left: 15px;" for = "card_type">카드 타입 <br></label>
                                    <select style="padding-left: 15px;" id="card_type" name="card_type" size="1">
                                        <option value="">카드 타입</option>
                                        <option value="체크카드">체크카드</option>
                                        <option value="신용카드">신용카드</option>
                                    </select><br>
                                    <p></p>
                                    <label style="padding-left: 15px;" for = "card_goods">카드 상품명<br></label>
                                    <select style="padding-left: 15px;" id="card_goods" name="card_goods" size="1">
                                        <option value="">상품명</option>
                                        <option value="청년미래카드">청년미래카드</option>
                                        <option value="시니어카드">시니어카드</option>
                                        <option value="교통서비스카드">교통서비스카드</option>
                                        <option value="반려동물사랑카드">반려동물사랑카드</option>
                                        <option value="직장인보너스카드">직장인보너스카드</option>
                                    </select><br>

                                    <p style="padding-left: 15px;">카드번호 <br><input type="text" name="card_Num"> </p>
                                    <p style="padding-left: 15px;">유효기간 <br><input type="text" name="card_period"> </p>
                                    <p style="padding-left: 15px;">연결계좌 <br><input type="text" name="card_account"> </p>
                                    <p style="padding-left: 15px;">개설일 <br><input type="text" name="card_opendate"> </p>
                                    <p style="padding-left: 15px;">한도 <br><input type="text" name="card_limit"> </p>
                                    <p style="padding-left: 15px;"><input type="submit" name="new_Card_submit" value="신청"></p>
                                
                                </form>

                            </details>
                            <br>

                            <!--자동이체 신청-->
                            <details>
                                <summary style="padding-left: 15px;">자동이체 신청</summary>

                                <form name = "New_AutoSend" method="post" action="registerAuto2.jsp">
                                
                                    <p style="padding-left: 15px;">자동이체 등록번호 <br><input type="text" name="Auto_num"> </p>
                                    <p style="padding-left: 15px;">송금 계좌번호 <br><input type="text" name="Auto_send_account"> </p>
                                    <p style="padding-left: 15px;">송금 금액 <br><input type="text" name="Auto_send_amount"> </p>
                                    <p style="padding-left: 15px;">착금 계좌번호 <br><input type="text" name="Auto_receive_account"> </p>
                                    <p style="padding-left: 15px;">매월 <input type="number" name="Auto_month" min="0" max="31" step="1" value ="(null)"></p>
                                    <p style="padding-left: 15px;">OR</p>
                                    <label style="padding-left: 15px;" for = "Auto_week">매주</label>
                                    <select style="padding-left: 15px;" id="Auto_week" name="Auto_week" size="1">
                                        <option></option>
                                        <option value="월">월</option>
                                        <option value="화">화</option>
                                        <option value="수">수</option>
                                        <option value="목">목</option>
                                        <option value="금">금</option>
                                        <option value="토">토</option>
                                        <option value="일">일</option>
                                    </select>
                                    <p style="padding-left: 15px;"><input type="submit" name="new_Auto_submit" value="신청"></p>
                                  
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
