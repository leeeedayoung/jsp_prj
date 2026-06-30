<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ClientService sc = new ClientService();

String newPw = request.getParameter("newPw");
sc.sendEmailNewPw(newPw);

%>