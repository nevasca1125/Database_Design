<%@ page contentType="text/html; charset=utf-8" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
	<title>고객 정보 변경</title>
    <style>
        label{
            display: block;
            height: 40px;
        }
    </style>

</head>
<body>

<p>Customer 테이블 레코드 변경</p> <%-- 주민등록번호와 가입날짜는 바뀌지 않아서 제외 --%>
<form name="form1" method="post" action="update.jsp">  <%-- 입력 폼을 생성, 사용자로부터 입력받은 값을 update.jsp로 전달 --%>
    <label>이름 <input type="text" name="name"></label>
    <label>생년월일(YY/MM/DD) <input type="text" name="date_birth"></label> <%-- 생년월일로 변경 대상 찾기 --%>
    <label>주소 <input type="text" name="address"></label>
    <label>이메일 <input type="text" name="email"></label>  
    <label>전화번호 <input type="text" name="phone"></label>
    <label>직업 <input type="text" name="job"></label>
    <label>신용등급 <input type="text" name="rate_credit"></label>

    <label><input type="submit" name="Submit" value="변경"></label>
</form>

</body>

</html>