<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="kr.co.sist.manage.service.AdminService" %>
<%
request.setCharacterEncoding("UTF-8");

String adminId = (String)session.getAttribute("adminId");

String pw = request.getParameter("pw");
String newPw = request.getParameter("newPw");

AdminService as = new AdminService();

boolean result = false;

try{
    result = as.changePw(adminId, pw, newPw);
}catch(Exception e){
    e.printStackTrace();
}

request.setAttribute("result", result);
RequestDispatcher rd = request.getRequestDispatcher("settings.jsp");
rd.forward(request, response);

%>