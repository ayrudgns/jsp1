<%@page import="vo.Product"%>
<%@page import="java.util.List"%>
<%@page import="dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2</title>
</head>


<body>
	
	
	<hr style="height: 5px; background-color: green;">
	<h3>상품 목록</h3>			

	<ul>
		<%
			// day2 폴더 8buy.jsp를 attribute 사용하여 수정하기
			// 실행은 14start.jsp 파일에서 한다.
			@SuppressWarnings("unchecked")
			List<Product> list = (List<Product>)request.getAttribute("list");
			for(Product vo : list) {		// jstl 라이브러리를 사용해서 태그로 변경할 수 있다. (예정)
		%>
		<li><%= vo.getPname() %>&nbsp;: <a href="javascript:select('<%= vo.getPcode() %>')"><%= vo.getPcode() %></a>
			&nbsp;: (<%= vo.getPrice() %>원)</li>
		<%
			}
		%>
	</ul>
	
	<hr>
	
	<h3>상품 구매</h3>
	<form action="16save.jsp" method="post">			<!-- 15save.jsp 또는 16save.jsp를 action에 주면 된다. -->
		<h5>고객 ID는 참조 무결성에 위배되지 않는 값이어야 한다.</h5>
		<input name="custom" placeholder="고객 ID 입력">
		<input name="pcode" placeholder="상품 목록에서 선택" readonly>
		<input type="number" name="quantity" placeholder="구매 수량 입력">
		<button>구매</button>
	</form>
	
<script type="text/javascript">
	function select(v_pcode) {
		console.log(v_pcode);
		document.forms[0].pcode.value = v_pcode;
	}
</script>

</body>
</html>