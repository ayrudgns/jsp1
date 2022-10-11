<%@page import="java.util.List"%>
<%@page import="day1.vo.MyUser"%>
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
	// 4. 애트리뷰트 가져오기! : .getAttribute() 메소드 (리턴 타입은 Object)
	// 추후에 ${ } 표현식 기호로 대체한다.
	String name = (String)request.getAttribute("attr1");	// Object 타입을 String으로 형변환!
	MyUser vo = (MyUser)request.getAttribute("attr2");		// Object 타입을 MyUser 타입으로 형변환!
	@SuppressWarnings("unchecked")	// 캐스팅할 때 제네릭 타입 경고 발생하지 않게 해줌. 세미콜론은 쓰지 않는다.
	List<String> list = (List<String>)request.getAttribute("attr3");	// 위 어노테이션 주석처리 하면 노란 줄은 타입 변환 전에 체크를 해야 하는데 하지 않아서! 무시해도 됨.
	
%>

	<ul>
		<li>name : <%= name %></li>
		<li>vo : <%= vo %></li>
		<li>list : <%= list %></li>
	</ul>
	<!-- 실행은 10read.jsp에서 하고, 데이터가 11list.jsp로 전달되었는지 확인하기! (실행 URL도 확인하기!) -->
	<!-- 실행 URL을 변화가 없다. => 보여지는 화면은 11list.jsp인데, URL은 10read.jsp이다. request를 전달한 것 뿐이다! -->
	<!-- 10read.jsp와 11list.jsp는 한 묶음이다! -->
</body>
</html>