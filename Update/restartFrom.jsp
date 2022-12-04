<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>카드 재개</title>
    <style>
        label {
            display: block;
            height: 40px;
        }
    </style>

</head>
<body>
<form name="form1" method="post" action="restart.jsp"> 
    <label>정지 해제할 카드번호 <input type="text" name="num_card"></label>  
    
    <label><input type="submit" name="Submit" value="카드 재개"></label>
</form>

</body>

</html>