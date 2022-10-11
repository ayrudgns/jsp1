<%@page import="dao.CustomDao"%>
<%@page import="dao.BuyDao"%>
<%@page import="dao.ProductDao"%>
<%@page import="vo.Buy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>day2</title>
</head>

<body>		<!-- alert 표시하는 방법 중 하나로, 참고하기! -->
<%
	// method="post"로 전달된 값 중에 한글 등 다국어 문자를 포함하는 경우 꼭 해야한다!
	request.setCharacterEncoding("UTF-8");

	String custom_id = request.getParameter("custom");
	String pcode = request.getParameter("pcode");
	int quantity = 0;
	Buy by = null;
	CustomDao cdao = CustomDao.getInstance();
	BuyDao dao = BuyDao.getInstance();
	String msg = "";
	
	try {
		
		// if(custom_id.equals("viviz")) {		// 사용자가 입력한 id가 테이블에 있는지 확인하기
												// 없는 경우 if(cdao.selectById(custom_id) == null) 
		if(cdao.selectById(custom_id) == null) {									
			throw new Exception ("고객이 아닙니다.");	// 임의로 exception 오류 발생 => 문자열은 오류 메시지 내용으로 설정
		}
		
		quantity = Integer.parseInt(request.getParameter("quantity"));
		by = new Buy(custom_id, pcode, quantity);

		int cnt = dao.insert(by);
		// int cnt = dao.insert(new Buy(custom_id, pcode, quantity));	// 이것도 가능하다. 변수를 안쓰고 바로 넣기!
		// int cnt = dao.insert(new Buy(0, custom_id, pcode, quantity, null));		// 이것도 가능하다.
																					// 커스텀 생성자를 새로 만들지 않고 해당 컬럼은 임의의 값 주기!
		if (cnt == 1) {
			// out.print("구매 완료 !!");
			msg = "yes";
		}
	} catch (NumberFormatException e) {
//		out.print("잘못된 quantity(수량) 값입니다.");
//		out.print("<br>상품 등록 실패!");
		msg = "zero";
	} catch (Exception e2) {
//		out.print("오류 : " + e2.getMessage() + "<br>");
//		out.print("회원가입을 하세요 !");
		msg ="no";
	}
	// response.sendRedirect("14buy.jsp");
	response.sendRedirect("alert.jsp?msg=" + msg);
%>
	
<h3>출력</h3>
<%= by %>


</body>
</html>