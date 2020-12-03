<%@page import="java.sql.Timestamp"%>
<%@page import="exam01.dto.Member"%>
<%@page import="exam01.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	//기본필드선언
	MemberDao memberDao = MemberDao.getInstance();
	String action = request.getParameter("action");
	
	int custNo = Integer.parseInt(request.getParameter("nextNo"));
	String custName = request.getParameter("custName");
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String grade =request.getParameter("grade");
	String city = request.getParameter("city");
	
	
	switch(action){
		case "insert" :
			Member insertMember = new Member(custNo, custName, phone, address, grade, city);
			int insertRes = memberDao.insertMember(insertMember);
			System.out.println("insertRes >> " + insertRes);
			break;
		case "update" :
			Member updateMember = new Member(custNo, custName, phone, address, grade, city);
			int updateRes = memberDao.updateMember(updateMember);
			System.out.println("updateRes >> " + updateRes);
			break;
	}
%>
<script>
	alert("회원목록으로 이동합니다.")
	location.href="/exam01/index.jsp?pp=list";
</script>