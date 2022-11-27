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
                    </tr>
                </table>
            </div>
            <div id="menu_div">
                <table id="menu">   
                        <td class="item">
                            <a href="test.jsp">하나</a>
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
                    </ul>  
                </table>
            </div>
            <div id="page_div">
                <table id="page">
                    <!--정보 표현 및 기타 조작 공간-->
                    <td id="main">
                        <table id="register" width="500">

                            <!--신규고객가입-->
                            <details> 
                                <summary>신규 고객가입</summary>

                                <form name = "New_Customer" method="post" action="registerUser.jsp">

                                    <p>고객명 <input type="text" name="C_Name"> </p>
                                    <p>주민번호 <input type="text" name="C_UserId" pattern="\d{6}\-\d{7}" title = "123456-1234567 형식으로 입력해주세요."></p>
                                    <p>주소 <input type="text" name="C_Address"></p>
                                    <p>생년월일 <input type="text" name="C_Birth"></p>
                                    <p>이메일 <input type="text" name="C_Email"></p>
                                    <p>전화번호 <input type="text" name="C_PhoneNum"></p>
                                    <p>직업 <input type="text" name="C_job"></p>
                                    <p>신용등급 <input type="text" name="C_credit"></p>
                                    <p>개설일 <input type="text" name="C_makedate"></p>
                                    <p><input type="submit" name="new_customer_submit" value="가입"></p>
                                
                                </form>

                            </details>
                            
                            <!--계좌 상품가입-->
                            <details>
                                <summary>계좌 상품가입</summary>

                                <form name = "New_Account" method="post" action="registerAcc.jsp">

                                    <label for = "account_type">계좌 타입</label>
                                    <select id="account_type" name="account_type" size="1">
                                        <option value="">계좌 타입</option>
                                        <option value="예금, 보통">예금, 보통</option>
                                        <option value="적금, 정기">적금, 정기</option>
                                        <option value="적금, 자유">적금, 자유</option>
                                        <option value="대출">대출</option>
                                    </select>
                                    
                                    <label for = "account_goods">계좌 상품명</label>
                                    <select id="account_goods" name="account_goods" size="1">
                                        <option value="">상품명</option>
                                        <option value="직장인예금">직장인예금</option>
                                        <option value="명지은행예금">명지은행예금</option>
                                        <option value="명지사랑적금">명지사랑적금</option>
                                        <option value="대학생적금">대학생적금</option>
                                        <option value="명지대출통장">명지대출통장</option>
                                    </select>
                                
                                    <p>고객명 <input type="text" name="account_userName"> </p>
                                    <p>주민번호 <input type="text" name="account_UserId" pattern="\d{6}\-\d{7}" title = "123456-1234567 형식으로 입력해주세요."> </p>
                                    <p>계좌번호 <input type="text" name="account_Num" pattern="\d{6}\-\d{2}\-\d{6}" title="123456-12-123456 형식으로 입력해주세요."> </p>
                                    <p>입금금액 <input type="text" name="account_send"> </p>
                                    <p>개설일 <input type="text" name="account_opendate"> </p>
                                    <p><input type="submit" name="new_Account_submit" value="가입"></p>

                                </form>

                            </details>
                            
                            <!--카드 신청-->
                            <details>
                                <summary>카드 신청</summary>

                                <form name = "New_card" method="post" action="registerCard.jsp">

                                    <label for = "card_type">카드 타입 </label>
                                    <select id="card_type" name="card_type" size="1">
                                        <option value="">카드 타입</option>
                                        <option value="체크카드">체크카드</option>
                                        <option value="신용카드">신용카드</option>
                                    </select>

                                    <label for = "card_goods">카드 상품명</label>
                                    <select id="card_goods" name="card_goods" size="1">
                                        <option value="">상품명</option>
                                        <option value="청년미래카드">청년미래카드</option>
                                        <option value="시니어카드">시니어카드</option>
                                        <option value="교통서비스카드">교통서비스카드</option>
                                        <option value="반려동물사랑카드">반려동물사랑카드</option>
                                        <option value="직장인보너스카드">직장인보너스카드</option>
                                    </select>

                                    <p>카드번호 <input type="text" name="card_Num"> </p>
                                    <p>유효기간 <input type="text" name="card_period"> </p>
                                    <p>연결계좌 <input type="text" name="card_account"> </p>
                                    <p>개설일 <input type="text" name="card_opendate"> </p>
                                    <p>한도 <input type="text" name="card_limit"> </p>
                                    <p><input type="submit" name="new_Card_submit" value="신청"></p>
                                
                                </form>

                            </details>

                            <!--자동이체 신청-->
                            <details>
                                <summary>자동이체 신청</summary>

                                <form name = "New_AutoSend" method="post" action="registerAuto.jsp">
                                
                                    <p>자동이체 등록번호 <input type="text" name="Auto_num"> </p>
                                    <p>송금 계좌번호 <input type="text" name="Auto_send_account"> </p>
                                    <p>송금 금액 <input type="text" name="Auto_send_amount"> </p>
                                    <p>착금 계좌번호 <input type="text" name="Auto_receive_account"> </p>
                                    <p>매월 <input type="number" name="Auto_month" min="0" max="31" step="1" value ="(null)"></p>
                                    <label for = "Auto_week">매주</label>
                                    <select id="Auto_week" name="Auto_week" size="1">
                                        <option></option>
                                        <option value="월">월</option>
                                        <option value="화">화</option>
                                        <option value="수">수</option>
                                        <option value="목">목</option>
                                        <option value="금">금</option>
                                        <option value="토">토</option>
                                        <option value="일">일</option>
                                    </select>
                                    <p><input type="submit" name="new_Auto_submit" value="신청"></p>
                                  
                                </form>

                            </details>
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
