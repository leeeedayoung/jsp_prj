<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.sist.manage.service.AdminService"%>

<%
String id = request.getParameter("id");
String password = request.getParameter("password");

AdminService as = new AdminService(); 
boolean result = as.login(id, password);

if(result){
    session.setAttribute("adminId", id);
    response.sendRedirect("dashboard.jsp");
}else{
%>
<script>
    location.href="login.jsp";
</script>
<%
}
%>