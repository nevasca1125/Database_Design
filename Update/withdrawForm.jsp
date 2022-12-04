<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>출금 계좌 입력</title>
    <style>
        label{
            display: block;
            height: 40px;
        }
    </style>

</head>
<body>
<form name="form1" method="post" action="withdraw.jsp">  
    <label>계좌번호 입력<input type="text" name="account"></label>
    <label>금액<input type="text" name="amount"></label>

    <label><input type="submit" name="Submit" value="출금"></label>
</form>

</body>

</html>