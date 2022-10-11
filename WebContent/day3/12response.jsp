<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<%
//	개발자 도구 -> 네트워크를 통해 확인한다!
	// 테스트는 1, 2, 3 중에 하나씩 실행
	
	out.print("<script>");
	out.print("alert('자바스크립트 실행 확인!')");
	out.print("</script>");
	// html과 관련된 출력이나 자바스크립트는
	// 응답이 13response.jsp인 2번과 3번에서 실행 확인이 불가능하다.


	// 1. 2, 3번 아무것도 실행하지 않는 경우
	// url : http://localhost:8082/jsp1/day3/12response.jsp
	// 화면에 보이는 응답 : 12response.jsp
		
	// 2. 2번만 실행하는 경우
	// pageContext.forward("13response.jsp");		// 2번
	// url : http://localhost:8082/jsp1/day3/12response.jsp
	// 화면에 보이는 응답 : 13response.jsp
	
	// 3. 3번만 실행하는 경우
	// response.sendRedirect("13response.jsp");		// 3번
	// url : http://localhost:8082/jsp1/day3/13response.jsp
	// 화면에 보이는 응답 : 13response.jsp

	// 동시에 실행시키는 것은 의미가 없다.
	// 다 실행하면 2번에서 13response.jsp로 응답하기 때문에 3번은 실행되지 않는다.

%>
	<h3>12response.jsp에서 보내는 응답</h3>
</body>
</html>