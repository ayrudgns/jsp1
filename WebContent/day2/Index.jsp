<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2</title>
</head>


<body>
	<h3>입력 파라미터 테스트 INDEX</h3>
	<hr>
	<p>쿼리 스트링을 url에 직접 입력</p>
	
	<ul>
		<li><a href="4parameter.jsp?data1=나나&data2=123&data3=hong">첫번째 예시</a></li>
		<li><a href="4parameter.jsp?name=나나&age=23&country=korea">두번째 예시</a></li>
	</ul>
	
	<p>사용자 form에 입력</p>
	
	<ul>
		<li><a href="5form.jsp">입력 GO</a></li>
		<li><a href="6product.jsp">상품 입력 GO</a></li>
		<!-- 
			6product.jsp 파일에서 입력받은 것을 7save.jsp가 전달받아서
			Product 객체를 생성하도록 작성하기
			=> 완료되면 화면 공유로 확인 (점심시간 이후 확인)
			
			7save.jsp 파일에서 Product 객체 확인 출력은 out.print(객체변수)
		-->
		<li><a href="8buy.jsp">상품 구매</a></li>
	</ul>


</body>
</html>