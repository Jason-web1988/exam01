<%@page import="exam01.dto.Money"%>
<%@page import="java.util.List"%>
<%@page import="exam01.dao.MoneyDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	MoneyDao moneyDao = MoneyDao.getInstance();
	List<Money> list = moneyDao.selectMoneyByAll();
	
	/* for(Money m : list){
		System.out.println(m);
	} */
%>
<h2>회원매출조회</h2>
<table border="1">
	<thead>
		<th>회원정보</th>
		<th>회원성명</th>
		<th>고객등급</th>
		<th>매출</th>
	</thead>
	<tbody>
	<% for(Money money : list){ %>
	<tr>
		<td><%=money.getCustName() %></td>
		<td><%=money.getCustName() %></td>
		<td>
			<%if(money.getGrade().equals("A")){  %>
			VIP
			<%}else if(money.getGrade().equals("B")){ %>
			일반
			<%}else{ %>
			직원
			<%} %>
		</td>
		
		<td><%=money.getTotal() %></td>
	
	</tr>
	<%} %>
	</tbody>
</table>
