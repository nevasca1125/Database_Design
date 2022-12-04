<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>카드 정지</title>
    <style>
        label {
            display: block;
            height: 40px;
        }
    </style>

</head>
<body>
<form name="form1" method="post" action="stop.jsp"> 
    <label>정지 대상 카드번호<input type="text" name="num_card"></label>  
    <label>정지 사유<input type="textarea" name="reason"></label> 
 
    <label><input type="submit" name="Submit" value="정지"></label>
</form>

</body>

</html>