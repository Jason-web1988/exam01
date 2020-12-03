<%@page import="java.text.SimpleDateFormat"%>
<%@page import="exam01.dto.Member"%>
<%@page import="java.util.List"%>
<%@page import="exam01.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	request.setCharacterEncoding("UTF-8");
	//리스트 불러오기
	MemberDao memberDao = MemberDao.getInstance();
	List<Member> list = memberDao.selectMemberByAll();
	
	//시간타입설정
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
%>

<h2>회원목록조회 / 수정</h2>
<table border="1">
	<thead>
		<th>회원정보</th>
		<th>회원성명</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>가입일자</th>
		<th>고객등급</th>
		<th>거주지역</th>
	</thead>
	<tbody>
		<%	for(Member member : list){%>
		<tr>
			<td><a href="/exam01/index.jsp?pp=update&custNo=<%=member.getCustNo()%>"><%=member.getCustNo()%></a></td>
			<td><%=member.getCustName()%></td>
			<td><%=member.getPhone() %></td>
			<td><%=member.getAddress() %></td>
			<td><%=sdf.format(member.getJoinDate()) %></td>
			<td><%=member.getGrade() %></td>
			<td><%=member.getCity() %></td>
		<%} %>
	</tbody>
</table>