<%@page import="vo.CustomVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정 form</title>
</head>

<body>
<!-- 회원정보 수정 form -->

	<h3>회원정보 수정</h3>
	<form action="22update.jsp" method="post">
		<h5>ID와 이름은 수정할 수 없습니다.</h5>
		<input value="<%= request.getParameter("id") %>" name="custom_id" readonly>
		<input value="<%= request.getParameter("name") %>" name="name" readonly>
		<input name="email" placeholder="수정할 email을 입력하세요." required="required">
		<input type="number" name="age" placeholder="수정할 나이를 입력하세요." required="required">
		<button>수정 완료하기</button>
		<button type="reset">다시 쓰기</button> 
	</form>

<!--  
	내가 원하는 것 :
	고객 조회 화면에서 고객 id를 클릭했을 때, 정보 수정 화면으로 넘어가면서
	고객 id와 고객 이름이 자동으로 입력됐으면 좋겠음.
	
	쿼리스트링!! 이걸 해낸 분이 있다니..!!	
-->

</body>
</html>