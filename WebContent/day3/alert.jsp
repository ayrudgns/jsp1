<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<body>
<!-- 테스트 URL -->
<!-- 
	http://localhost:8082/jsp1/day3/alert.jsp?msg=yes		// 구매 완료
	http://localhost:8082/jsp1/day3/alert.jsp?msg=no		// 회원가입 하셔야 구매 가능!
	http://localhost:8082/jsp1/day3/alert.jsp?msg=zero		// 수량 입력
	http://localhost:8082/jsp1/day3/alert.jsp?msg=rr		// 알 수 없는 오류
-->

<%
	String msg = request.getParameter("msg");
	if(msg != null && msg.equals("yes")) {
		pageContext.setAttribute("msg", "구매 완료");
	} else if (msg != null && msg.equals("no")) {
		pageContext.setAttribute("msg", "회원 가입 이후 구매 가능합니다.");
	} else if (msg != null && msg.equals("zero")) {
		pageContext.setAttribute("msg", "수량을 입력하세요.");
	} else {
		pageContext.setAttribute("msg", "알 수 없는 오류");
	}
%>
<script type="text/javascript">
	alert('${msg}');		<%-- ${ } 표현 언어(el)는 애트리뷰트 값을 가져온다. */ --%>
	<%-- alert('<%= msg %>)'--%>		// 자바 변수를 사용할 때 표현하는 표현식
	location.href = '14buy.jsp';		// 자바스크립트에서 URL을 설정하여 새로운 요청을 변경한다.
</script>

</body>
</html>