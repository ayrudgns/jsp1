<%@page import="dao.CustomDao"%>
<%@page import="dao.BuyDao"%>
<%@page import="vo.Buy"%>
<%@page import="vo.Product"%>
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
<%
	// method="post"로 전달된 값 중에 한글 등 다국어 문자는 꼭 set 인코딩하기
	String id = request.getParameter("custom");
	String pcode = request.getParameter("pcode");
	String temp = request.getParameter("quantity");
	int quantity = 0;
	BuyDao dao = BuyDao.getInstance();
	CustomDao cdao = CustomDao.getInstance();
	String msg="";
	
	out.print("<script>");		// 자바 코드에서 자바스크립트를 실행하기 위해서 
								// 자바 코드 안에서 자바스크립트를 쓰지 않고 특정 부분에만 쓴다면, 그 부분에만 스크립트 태그를 줘도 된다.
	try {
		// if(id.equals("viviz"))			
		// 사용자 입력 id가 테이블에 있는지 확인해서 없으면  if (cdao.selectById(id) == null)
		
		if (cdao.selectById(id) == null) {
			 throw new Exception("고객이 아닙니다.");
		}
		
		quantity = Integer.parseInt(temp);
		int cnt = dao.insert(new Buy(0, id, pcode, quantity, null));
		if(cnt == 1) {
			msg = "구매 완료!";
		} else {
			msg = "상품 코드를 입력하세요.";
		}	
	} catch (NumberFormatException e) {
			msg = "수량을 숫자로 입력 하세요.";
	} catch (Exception e) {
			msg = "회원가입이 필요합니다.";
	}
	out.print("alert('"+ msg +"');");			// 뭐여?
	out.print("location.href = '14start.jsp';");
				// attribute 저장을 위해서 url 변경
	out.print("</script>");
%>
	<!--
		if문으로 검사한 결과에 따라 실행되는 url이 달라져야 하는 경우,
		redirect 보다 alert 표시와 함께 자바스크립트에서 처리하는 것이 바람직하다.
		response.sendRedirect는 뒤에 코드가 있는 경우 그 부분도 처리하기 때문에
		예상치 못한 상황이 생길 수 있다.
	-->
</body>
</html>