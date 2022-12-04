<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>송금</title>
    <style>
        label {
            display: block;
            height: 40px;
        }
    </style>

</head>
<body>

<p></p>
<form name="form1" method="post" action="remittance.jsp"> 
    <label>보내는 계좌번호<input type="text" name="postAccount"></label>  
    <hr>
    <label>받는 계좌번호<input type="text" name="getAccount"></label> 
    <label>금액 <input type="text" name="amount"></label>

    <label><input type="submit" name="Submit" value="송금"></label>
</form>

</body>

</html>