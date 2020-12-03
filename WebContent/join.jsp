<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam01.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	MemberDao memberDao = MemberDao.getInstance();
	int nextNo = memberDao.nextCustNo();
	System.out.println("nextNo >> " + nextNo);
			
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	Timestamp joinDate = new Timestamp(new Date().getTime());
%>
    
<h2>홈쇼핑 회원등록</h2>
<form action="/exam01/action.jsp?" method="post" id="join">
	<input type="hidden" name="action" value="insert">
	<table border="1">
		<tr>
			<th>회원번호(자동발생)</th>
			<td><input type="text" id="nextNo" name="nextNo" readonly value="<%=nextNo%>"></td>
		</tr>
		<tr>
			<th>회원성명</th>
			<td><input type="text" id="custName" name="custName"></td>
		</tr>	
		<tr>
			<th>회원전화</th>
			<td><input type="text" id="phone" name="phone"></td>			
		</tr>
		<tr>
			<th>회원주소</th>
			<td><input type="text" id="address" name="address"></td>
		</tr>
		<tr>
			<th>가입일자</th>
			<td><input type="text" id="joinDate" name="joinDate" readonly value="<%=sdf.format(joinDate)%>"></td>
		</tr>
		<tr>	
			<th>고객등급[A:VIP, B:일반, C:직원"]</th>
			<td><input type="text" id="grade" name="grade"></td>
		</tr>
		<tr>	
			<th>도시코드</th>
			<td><input type="number" id="city" name="city"></td>
		</tr>
	</table>
</form>
<div class="btn_group">
	<button type="button" onclick="insert();">등록</button>
	<button type="button" onclick="location.href='/exam01/index.jsp?pp=list'">목록</button>
</div>