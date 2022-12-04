<%@ page contentType="text/html; charset=utf-8" %>
    <%@ page import="java.sql.*" %>

        <!DOCTYPE html>
        <html>

        <head>
            <title>은행 업무</title>
            <style>
                label {
                    display: block;
                    height: 40px;
                }
            </style>

        </head>

        <body>
            <div class="remittance">
            <form name="form1" method="post" action="remittance.jsp"> 
                <label>보내는 계좌번호<input type="text" name="postAccount"></label>  
                <hr>
                <label>받는 계좌번호<input type="text" name="getAccount"></label> 
                <label>금액 <input type="text" name="amount"></label>
            
                <label><input type="submit" name="Submit" value="송금"></label>
            </form>
            </div>

            <div class="deposit">
                <form name="form1" method="post" action="deposit.jsp">
                    <label>계좌번호 입력<input type="text" name="account"></label>
                    <label>금액<input type="text" name="amount"></label>

                    <label><input type="submit" name="Submit" value="입금"></label>
                </form>
            </div>

            <div class="withdraw">
                <form name="form1" method="post" action="withdraw.jsp">
                    <label>계좌번호 입력<input type="text" name="account"></label>
                    <label>금액<input type="text" name="amount"></label>

                    <label><input type="submit" name="Submit" value="출금"></label>
                </form>
            </div>

            <div class="stop">
                <form name="form1" method="post" action="stop.jsp">
                    <label>정지 대상 카드번호<input type="text" name="num_card"></label>
                    <label>정지 사유<input type="textarea" name="reason"></label>

                    <label><input type="submit" name="Submit" value="정지"></label>
                </form>
            </div>

            <div class="restart">
                <form name="form1" method="post" action="restart.jsp">
                    <label>정지 해제할 카드번호 <input type="text" name="num_card"></label>

                    <label><input type="submit" name="Submit" value="카드 재개"></label>
                </form>
            </div>

        </body>

        </html>