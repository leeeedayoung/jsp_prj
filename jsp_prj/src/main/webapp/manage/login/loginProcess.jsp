<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="service/AdminService"%>
<%
String id = request.getParameter("id");
String password = request.getParameter("password");

AdminService as = new AdminService();

boolean result = as.login(id, password);

if(result){
    session.setAttribute("adminId", id);
    response.sendRedirect("dashboard.jsp?id=" + id);
}else{
%>
<script>
alert("아이디 또는 비밀번호가 일치하지 않습니다.");
history.back();
</script>
<%
}
%>
