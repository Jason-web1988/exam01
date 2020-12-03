<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam01.dto.Member"%>
<%@page import="exam01.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	MemberDao memberDao = MemberDao.getInstance();
	
	int custNo = Integer.parseInt(request.getParameter("custNo"));
	System.out.println("updateCustNo >> " + custNo);
	
	Member member = memberDao.selectMemberByNo(custNo);
	System.out.println("member >> " + member);
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
%>
<h2>홈쇼핑 회원수정</h2>
<form action="/exam01/action.jsp?" method="post" id="update">
	<input type="hidden" name="action" value="update">
	<table border="1">
		<tr>
			<th>회원번호</th>
			<td><input type="text" id="nextNo" name="nextNo" readonly value="<%=member.getCustNo()%>"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" id="custName" name="custName" value="<%=member.getCustName()%>"></td>
		</tr>	
		<tr>
			<th>회원전화</th>
			<td><input type="text" id="phone" name="phone" value="<%=member.getPhone()%>"></td>			
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" id="address" name="address" value="<%=member.getAddress()%>"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" id="joinDate" name="joinDate" readonly value="<%=sdf.format(member.getJoinDate())%>"></td>
		</tr>
		<tr>	
			<th>고객등급[A:VIP, B:일반, C:직원"]</th>
			<td><input type="text" id="grade" name="grade" value="<%=member.getGrade()%>"></td>
		</tr>
		<tr>	
			<th>도시코드</th>
			<td><input type="number" id="city" name="city" value="<%=member.getCity()%>"></td>
		</tr>
	</table>
</form>
<div class="btn_group">
	<button type="button" onclick="update();">수정</button>
	<button type="button" onclick="location.href='/exam01/index.jsp?pp=list'">조회</button>
</div>