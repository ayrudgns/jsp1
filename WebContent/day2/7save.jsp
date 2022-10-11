<%@page import="dao.ProductDao"%>
<%@page import="vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Holder</title>
</head>

<body>
<% 
	// method가 post일 때는 요청 파라미터의 인코딩을 직접 설정한다.
	request.setCharacterEncoding("UTF-8");

%>

	<h2>상품 정보 가져오기</h2>
	
	<h3>.getParameter()로 가져오기</h3>
	<ul>
		<li>pcode : <%= request.getParameter("pcode") %>
		<li>category : <%= request.getParameter("category") %>
		<li>pname : <%= request.getParameter("pname") %>
		<li>price : <%= request.getParameter("price") %>	
	</ul>
	<hr>
<%
		String pcode = request.getParameter("pcode");
		String category = request.getParameter("category");
//		String pname = request.getParameter("pname");		// 객체에 변수 선언하지 않고 바로 저장!
		int price = 0;
		Product pd = null;
		try {		// price에 숫자가 아닌 값을 줬을 때, 예외처리!
					// 즉, parseInt할 때 파라미터가 문자열인 경우 Exception 처리
			price = Integer.parseInt(request.getParameter("price"));
			pd = new Product(pcode, category, request.getParameter("pname"), price);

			// TBL_PRODUCT에 행 추가하기
			ProductDao dao = ProductDao.getInstance();
			int cnt = dao.insert(pd);
			if (cnt == 1) {
				out.print("상품 등록 완료!!!");			
			} else {
				out.print("상품 등록 실패 !!! 입력값을 확인하세요.");
			}
			
/* 			
			out.print("<h3>객체에 담아서 출력하기</h3>");
			out.print("객체에서 get pcode : " + pd.getPcode() + "<br>");
			out.print("객체에서 get category : " + pd.getCategory() + "<br>");
			out.print("객체에서 get pname : " + pd.getPname() + "<br>");
			out.print("객체에서 get price : " + pd.getPrice() + "<br>");
			// 그냥 변수명만 찍어도 .toString()으로 찍힌다!
			out.print(pd);
*/
			
		} catch (NumberFormatException e) {
			out.print("잘못된 price(가격) 값입니다.");
			out.print("<br>상품 등록 실패!");
		}

%>

<h3>출력</h3>
<%= pd %>


</body>
</html>