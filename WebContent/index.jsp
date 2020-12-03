<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<jsp:include page="include/header.jsp"/>
<jsp:include page="include/nav.jsp"/>
<article>
	<jsp:include page="${empty param.pp?'list.jsp' : param.pp +='.jsp'}"></jsp:include>
</article>
<jsp:include page="include/footer.jsp"/>