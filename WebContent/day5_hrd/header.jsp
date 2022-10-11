<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>

header {
	background-color: blue;
	text-align: center;
	color: white;
	margin-top: -20px;
	margin-left: -10px;
	margin-right: -10px;
	padding: 5px 10px;
}

nav {
	margin-left: -10px;
	margin-right: -10px;
}

ul {
	list-style-type: none;
	background-color: #606b9f;
	overflow: hidden;
	margin: auto;
	margin-left: -10px;
}

ul > li {
	float: left;
	color: aliceblue;
}

ul > li a {
    display: block;
    padding: 8px 25px;
    color: white;
    text-align: center;
    text-decoration: none;
}

ul > li a:hover {
    background-color: red;
    color: white;
}

h3 {
	text-align: center;
}

body {
	background-color: gainsboro;
	margin: 0px;
}

table {
	border: 1px solid black;
	width: 800px;
	 margin: auto;
}

th, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	text-align: center;
}

section {
    background-color: gainsboro;
    padding: 20px;
    margin-left: -10px;
    height: 600px;
}

</style>    
    
<header>														<!-- header -->
	<h2>쇼핑몰 회원 관리 ver 1.0</h2>	
</header>

<nav>															<!-- nav -->
	<ul>
		<li><a href="3memberJoin.jsp">회원등록</a></li>
		<li><a href="5memberList.jsp">회원목록 조회 / 수정</a></li>
		<li><a href="7moneyList.jsp">회원매출조회</a></li>
		<li><a href="1index.jsp">홈으로</a></li>
	</ul>
</nav>

